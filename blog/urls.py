from tkinter.font import names

from django.urls import path
from blog import views
urlpatterns = [
    #首页
    path('', views.index,name='index'),
    #文章详情页
    path('article/<int:id>/',views.article_detail,name='article_detail'),
    #成员页
    #分类和标签页
    path('category_tag/',views.category_tag,name='category_tag'),
    #文章分类详情页
    path('article_category/<int:id>/', views.article_category, name='article_category'),
    #文章标签详情页
    path('article_tag/<int:id>',views.article_tag,name='article_tag'),

    #文章归档
    path('article_set/<int:id>',views.archive_detail,name='article_set'),
    path('article_year/',views.year_list,name='article_year'),


    path('category/',views.category_list,name='category'),
    path('tag/',views.tag_list,name='tag'),

    path('cloud_tag/',views.cloud_tag,name='cloud_tag'),
    path('search/',views.search,name='search'),

    path('archive2/<int:id>',views.archive_by_year,name='archive2'),

    path('edit/', views.edit, name='edit'),



]

#mkeditor配置
from django.conf.urls.static import static
from django.conf import settings
if settings.DEBUG:
    # static files (images, css, javascript, etc.)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)