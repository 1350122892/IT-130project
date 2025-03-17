from django.urls import path
from core import views
app_name = 'core'

urlpatterns = [
    path('about/', views.about, name='about'),
    # path('member/', views.member, name='member'),
    path('friend/', views.friend, name='friend'),
    path('message/', views.message, name='message'),
    path('echarts_category/', views.echarts_category, name='echarts_category'),
    path('echarts_activate/', views.echarts_activate, name='echarts_activate'),
    path('member/', views.member, name='member'),

]
