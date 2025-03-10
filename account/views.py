from django.shortcuts import render, redirect
from django.http import HttpResponse
from io import BytesIO

from blog.models import User
from blog.utils.Form import LoginForm
from blog.utils.Verification import check_code  # 如果验证码函数留在原utils中
# Create your views here.

# 验证码
def generate_captcha_image(request):
    img, code = check_code()
    # 将验证码保存到session，并设置有效期
    request.session['captcha_code'] = code
    request.session.set_expiry(60)

    buffer = BytesIO()
    img.save(buffer, format='PNG')
    print(code)
    return HttpResponse(buffer.getvalue())


def validate_captcha(form, session):
    if form.cleaned_data.get('code') != session.get('captcha_code'):
        form.add_error("code", "验证码错误")
        return False
    return True

def authenticate_user(form):
    user = User.objects.filter(**form.cleaned_data).first()
    if not user:
        form.add_error("password", "用户名或密码错误")
    return user

def login(request):
    next_url = request.GET.get('next', '/')
    login_form = LoginForm(data=request.POST or None)
    if request.method == 'POST' and login_form.is_valid():
        # 验证码校验
        if not validate_captcha(login_form, request.session):
            pass
        else:
            # 验证通过后，先弹出 code 字段
            login_form.cleaned_data.pop('code', None)
            user = authenticate_user(login_form)
            if user:
                request.session['info'] = {"id": user.id, "name": user.name}
                request.session.set_expiry(60 * 3600 * 7)
                return redirect(next_url)

    return render(request, 'login.html', {"form": login_form})




def logout(request):
    request.session.clear()
    return redirect('index')
