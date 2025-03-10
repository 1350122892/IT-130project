import random
import string
from email.policy import default
import datetime
import json
import logging
import traceback
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import render, redirect
from pure_pagination import Paginator, PageNotAnInteger
import mistune
from blog.utils.Pagination import Pagination
from blog.utils.Form import editForm
from .models import (
    Article, Link, Category, Tag, Notice, Valine,
    Site, Social, Year
)
logger = logging.getLogger(__name__)




# ========== 1. 文章相关视图 ==========

def index(request):
    """
    首页展示：
    - 列出所有文章（按添加时间倒序）
    - 推荐文章
    - 公告列表
    - 分页
    """
    all_articles = Article.objects.all().order_by('-add_time')
    top_articles = Article.objects.filter(is_recommend=1)
    notices = Notice.objects.all()

    paginator = Pagination(request, all_articles)
    context = {
        "page_string": paginator.html(),
        'all_articles': paginator.page_queryset,
        'top_articles': top_articles,
        'notices': notices
    }
    return render(request, 'index.html', context)


def article_detail(request, id):
    """
    文章详情页：
    - 获取文章并递增点击数
    - 渲染 Markdown
    - 获取上一篇/下一篇文章
    """
    article = Article.objects.get(id=id)
    article.click_count += 1
    article.save(update_fields=['click_count'])

    valine = Valine.objects.first()
    mk = mistune.Markdown()
    output = mk(article.content)

    current_time = article.add_time
    before_article = Article.objects.filter(add_time__lt=current_time).order_by('-add_time').first() or article
    next_article = Article.objects.filter(add_time__gt=current_time).order_by('add_time').first() or article

    context = {
        'valine': valine,
        'article': article,
        'article_detail_html': output,
        'before_article': before_article,
        'next_article': next_article
    }
    return render(request, 'article_detail.html', context)




def edit(request):
    """
    文章编辑/发布视图：
    - GET：返回空表单
    - POST：提交表单，保存文章
    """
    default_name = request.session.get('info', {}).get('name', None)
    if request.method == "GET":
        categories = Category.objects.all()
        tags = Tag.objects.all()
        years = Year.objects.all()
        form = editForm(default_name=default_name)
        return render(request, 'edit.html', {"form": form, "categorys": categories, "tags": tags, "years": years})

    # POST
    form = editForm(data=request.POST, default_name=default_name)
    if form.is_valid():
        article = form.save(commit=False)
        article.save()
        form.save_m2m()
        return redirect('index')
    return render(request, 'edit.html', {"form": form})



# ========== 2. 归档相关视图 ==========

def archive_by_year(request, id):
    """
    根据年份归档（带分页和月度分组）
    """
    year_obj = Year.objects.filter(id=id).first()
    if not year_obj:
        return render(request, 'archive2.html', {"articles": None, "year": "未知"})

    articles_qs = Article.objects.filter(years__id=id)
    if not articles_qs.exists():
        return render(request, 'archive2.html', {"articles": None, "year": year_obj.year})

    paginator = Pagination(request, articles_qs)
    # 将文章按月份分组
    monthly_dict = {}
    for article in paginator.page_queryset:
        monthly_dict.setdefault(article.add_time.month, []).append(article)

    context = {
        "articles": monthly_dict,
        "year": year_obj.year,
        "page_string": paginator.html(),
        'all_articles': paginator.page_queryset,
    }
    return render(request, 'archive2.html', context)


def year_list(request):
    """
    列出所有年份（归档入口）
    """
    year_qs = Year.objects.all()
    return render(request, 'article_year.html', {"article": year_qs})

def archive_detail(request, id):
    """
    按年份区间做详细归档（带日历散点），原 article_set
    """
    articles = Article.objects.filter(years__id=id).order_by('-add_time')
    if not articles.exists():
        return render(request, 'archive.html', {'all_articles': None})

    all_dates = articles.values_list('add_time', flat=True).order_by('add_time')
    latest_date = all_dates.last()
    if not latest_date:
        return render(request, 'archive.html', {'all_articles': None})

    # 生成日期列表
    date_str_list = [dt.strftime("%Y-%m-%d") for dt in all_dates]
    end = datetime.date(latest_date.year, latest_date.month, latest_date.day)
    begin = datetime.date(latest_date.year - 1, latest_date.month, latest_date.day)

    d = begin
    delta = datetime.timedelta(days=1)
    date_list = []
    while d <= end:
        day_str = d.strftime("%Y-%m-%d")
        count = date_str_list.count(day_str)
        date_list.append([day_str, count])
        d += delta

    # 分页
    try:
        page_num = request.GET.get('page', 1)
    except PageNotAnInteger:
        page_num = 1

    p = Paginator(articles, 10, request=request)
    articles_page = p.page(page_num)

    context = {
        'all_articles': articles_page,
        'date_list': date_list,
        'end': str(end),
        'begin': str(begin),
    }
    return render(request, 'archive.html', context)


# ========== 3. 分类 & 标签相关视图 ==========

def category_tag(request):
    """分类和标签汇总页"""
    categories = Category.objects.all()
    tags = Tag.objects.all()
    return render(request, 'category_tag.html', {
        'categories': categories,
        'tags': tags,
    })

def category_list(request):
    """所有分类列表"""
    categories = Category.objects.all()
    return render(request, 'category_article.html', {"categories": categories})

def tag_list(request):
    """所有标签列表"""
    tags = Tag.objects.all()
    return render(request, 'cartegory_tag.html', {"tags": tags})

def article_tag(request, id):
    """
    文章标签详情页：
    - 根据标签 ID 获取文章并分页
    """
    tags = Tag.objects.all()
    articles_qs = Tag.objects.get(id=id).article_set.all()
    paginator = Pagination(request, articles_qs, page_size=6)

    context = {
        'tags': tags,
        'id': id,
        'articles': paginator.page_queryset,
        "page_string": paginator.html(),
    }
    return render(request, 'article_tag.html', context)


# ========== 4. 搜索相关视图 ==========

def search(request):
    """
    接收 JSON 格式参数：
    - searchKey: 搜索关键字
    - page: 当前页码
    - pageSize: 每页条数
    返回 JSON 格式搜索结果
    """
    try:
        json_data = json.loads(request.body.decode())
        search_key = json_data.get("searchKey")
        if not search_key:
            return JsonResponse({"code": 400, "data": "Not searchKey", "msg": "fail"})

        page = max(1, int(json_data.get("page", 1)))
        page_size = max(1, int(json_data.get("pageSize", 10)))

    except Exception as e:
        logger.exception("Search request error")
        return JsonResponse({"code": 400, "data": None, "msg": "fail"})

    article_qs = Article.objects.values(
        "title", "desc", "id", "add_time", "author", "click_count", "category__name"
    ).filter(
        Q(title__icontains=search_key) | Q(content__icontains=search_key)
    ).order_by("add_time")

    total_count = article_qs.count()
    total_page_count, remainder = divmod(total_count, page_size)
    if remainder:
        total_page_count += 1
    if page > total_page_count:
        page = total_page_count

    paginator = Paginator(article_qs, page_size)
    current_page_data = paginator.page(page).object_list

    return JsonResponse({
        "code": 200,
        "data": {
            "articleList": list(current_page_data),
            "total_count": total_count,
            "pageInfo": {
                "pageCount": paginator.num_pages,
                "articleCount": paginator.count,
                "currentPage": page,
            }
        },
        "msg": "success"
    })





def cloud_tag(request):
    # 返回云标签数据
    tags = Tag.objects.all()
    data = []
    for tag in tags:
        data.append({"text": tag.name, "weight": 1, "link": "/article_tag/"+ str(tag.id)})
    result = {
        "status": True,
        "data": data,
    }
    return JsonResponse(result, safe=False)

def article_category(request, id):
    '''文章分类详情页'''
    categories = Category.objects.all()
    articles = Category.objects.get(id=id).article_set.all()  # 获取该id对应的所有的文章
    queryset = Pagination(request,articles,page_size=6)
    context = {
        "page_string": queryset.html(),
        'categories': categories,
        'id': id,
        'articles': queryset.page_queryset
    }
    return render(request, 'article_category.html', context)


def add_nav(request):
    '''导航栏'''
    category_nav = Category.objects.filter(add_menu=True).order_by('index')
    context = {
        'category_nav': category_nav,
    }
    return render(request, 'layout/header.html', context)








