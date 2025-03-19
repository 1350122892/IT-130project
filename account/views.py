from django.shortcuts import render, redirect
from django.http import HttpResponse
from io import BytesIO
import logging
from django.views.decorators.http import require_POST
from blog.models import User
from blog.utils.Form import LoginForm
from blog.utils.Verification import check_code  # 如果验证码函数留在原utils中
# Create your views here.
logger = logging.getLogger(__name__)

# CAPTCHA
def generate_captcha_image(request):
    img, code = check_code()
    # Save CAPTCHA to session and set expiry date
    request.session['captcha_code'] = code

    buffer = BytesIO()
    img.save(buffer, format='PNG')
    print(code)
    return HttpResponse(buffer.getvalue())


def validate_captcha(form, session):
    if form.cleaned_data.get('code') != session.get('captcha_code'):
        form.add_error("code", "CAPTCHA error")
        return False
    return True

def authenticate_user(form):
    user = User.objects.filter(**form.cleaned_data).first()
    if not user:
        form.add_error("password", "Incorrect username or password")
    return user

def login(request):
    next_url = request.GET.get('next', '/')
    login_form = LoginForm(data=request.POST or None)
    if request.method == 'POST' and login_form.is_valid():
        # CAPTCHA verification
        if not validate_captcha(login_form, request.session):
            pass
        else:
            # After validation, the code field pops up first
            login_form.cleaned_data.pop('code', None)
            user = authenticate_user(login_form)
            if user:
                request.session['info'] = {"id": user.id, "name": user.name}
                request.session.set_expiry(60 * 60 * 24 * 7 * 2)
                return redirect(next_url)

    return render(request, 'login.html', {"form": login_form})





@require_POST
def logout(request):
    request.session.clear()
    return redirect('index')