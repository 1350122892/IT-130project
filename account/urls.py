from django.urls import path
from account import views
app_name = 'account'  # 如果需要使用命名空间，请加上这行

urlpatterns = [
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('captcha/', views.generate_captcha_image, name='captcha'),
]
