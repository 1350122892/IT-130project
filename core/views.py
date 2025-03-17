from django.shortcuts import render
from django.db.models import Count
from django.db.models.functions import TruncDate
from blog.models import Article, Link, Category, Tag, Notice, Valine, About, Site, Social, Skill
from django.http import JsonResponse, HttpResponse

# Create your views here.

def about(request):
    articles = Article.objects.all().order_by('-add_time')
    categories = Category.objects.all()
    tags = Tag.objects.all()
    about = About.objects.first()
    skill = Skill.objects.all()
    return render(request, 'about.html', {
        'articles': articles,
        'categories': categories,
        'tags': tags,
        'about': about,
        'skill': skill,
    })
def echarts_category(request):
    data_list = []
    catagroy_list = Category.objects.all()
    catagroy_count = Category.objects.count()
    for catagory in catagroy_list:
        dict = {}
        count = Article.objects.filter(category_id=catagory.id).count()
        dict["value"] = count
        dict["name"] = catagory.name
        data_list.append(dict)
    result = {
        "status":True,
        "data":{
            "data_list":data_list,
            "count":catagroy_count
        }
    }
    return JsonResponse(result)


def echarts_activate(request):
    article_by_day = Article.objects.annotate(
        day = TruncDate('add_time')
    ).values('day').annotate(
        article_count = Count('id')
    ).order_by('-day')[0:10]
    datalist = []
    valuelist = []
    for group in article_by_day:
        datalist.append(group['day'].strftime('%Y-%m-%d'))
        valuelist.append(group['article_count'])
    datalist = datalist[::-1]
    valuelist = valuelist[::-1]
    result = {
        "status":True,
        "data":{
            "datalist":datalist,
            "valuelist":valuelist
        }
    }
    return JsonResponse(result)

def message(request):
    return  render(request,'message.html')


def member(request):
    link_list = Link.objects.all()
    return render(request, 'member.html', {"links": link_list})

def friend(request):
    link_list = Link.objects.all()

    return render(request,'friend.html',{"links":link_list})