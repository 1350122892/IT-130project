from django.urls import path
from account import views
app_name = 'account'

urlpatterns = [
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('captcha/', views.generate_captcha_image, name='captcha'),
]
