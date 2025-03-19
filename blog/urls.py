
from django.urls import path
from blog import views
urlpatterns = [

    path('', views.index,name='index'),

    path('article/<int:id>/',views.article_detail,name='article_detail'),

    path('search/', views.search, name='search'),
    path('category_tag/',views.category_tag,name='category_tag'),

    path('article_category/<int:id>/', views.article_category, name='article_category'),

    path('article_tag/<int:id>',views.article_tag,name='article_tag'),


    path('article_set/<int:id>',views.archive_detail,name='article_set'),
    path('article_year/',views.year_list,name='article_year'),


    path('category/',views.category_list,name='category'),
    path('tag/',views.tag_list,name='tag'),

    path('cloud_tag/',views.cloud_tag,name='cloud_tag'),
    # path('search/',views.search,name='search'),

    path('archive2/<int:id>',views.archive_by_year,name='archive2'),

    path('edit/', views.edit, name='edit'),



]


from django.conf.urls.static import static
from django.conf import settings
if settings.DEBUG:
    # static files (images, css, javascript, etc.)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)