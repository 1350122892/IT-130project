
from django import forms
from django.template.context_processors import request
from urllib import request
from blog.models import Article,User
from blog.utils.encrypt import md5
from blog.models import User

class editForm(forms.ModelForm):
    author = forms.CharField(
        label="author",
        disabled=True,
        widget=forms.TextInput(attrs={"placeholder": "username"}),
    )
    boostrap_exclude_fields = []
    def __init__(self, *args, **kwargs):
        default_name = kwargs.pop('default_name', None)
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name in self.boostrap_exclude_fields:
                continue
            if default_name:
                self.fields['author'].initial = default_name
            self.fields['desc'].widget.attrs['id'] = 'add_color'
            self.fields['title'].widget.attrs['id'] = 'add_color'
            self.fields['author'].widget.attrs['id'] = 'add_color'
            self.fields['cover'].widget.attrs['id'] = 'add_color'

            if field.widget.attrs:
                field.widget.attrs["class"] = "form-control"
                field.widget.attrs["placeholder"] = field.label
            else:
                field.widget.attrs = {"class": "form-control" }

    def clean_content(self):
        content = self.cleaned_data['content']
        if "<script>" in content or "</script>" in content:
            raise forms.ValidationError("Content contains unsafe code!")
        return content

    def clean_title(self):
        title = self.cleaned_data['title']
        if "<script>" in title or "</script>" in title:
            raise forms.ValidationError("Content contains unsafe code!")
        return title

    def clean_desc(self):
        desc = self.cleaned_data['desc']
        if "<script>" in desc or "</script>" in desc:
            raise forms.ValidationError("Content contains unsafe code!")
        return desc

    def clean_cover(self):
        cover = self.cleaned_data['cover']
        try:
            with request.urlopen(cover) as file:
                pass
        except Exception as e:
            raise forms.ValidationError("Invalid links")
        return cover

    class Meta:
        model = Article
        fields = ['title', 'author', 'desc', 'cover', 'content', 'years', 'category', 'tag']



class RegisterForm(forms.ModelForm):
    boostrap_exclude_fields = []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name in self.boostrap_exclude_fields:
                continue

            if field.widget.attrs:
                field.widget.attrs["class"] = "form-control"
                field.widget.attrs["placeholder"] = field.label
            else:
                field.widget.attrs = {"class": "form-control"}


    confirm_password = forms.CharField(
        widget=forms.PasswordInput(attrs={"placeholder": "Confirm Password"}),
        label="确认密码",
    )
    code = forms.CharField(
        label="验证码",

        widget=forms.TextInput(attrs={"placeholder": "Please enter the verification code"}),
    )


    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)


    def clean_confirm_password(self):
        pwd = self.cleaned_data.get("password")
        confirm =  md5(self.cleaned_data.get("confirm_password"))
        if pwd != confirm:
            raise forms.ValidationError("Two incorrect password entries")
        else:
            return confirm

    def clean_name(self):
        name = self.cleaned_data.get('name')
        if User.objects.filter(name=name).exists():
            raise forms.ValidationError("User name already exists")
        else:
            return name

    class Meta:
        model = User
        fields = ['name', 'password','email']
        widgets = {
            'password':forms.PasswordInput(render_value=True)
        }


class ResetPassword(forms.ModelForm):
    boostrap_exclude_fields = []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name in self.boostrap_exclude_fields:
                continue

            if field.widget.attrs:
                field.widget.attrs["class"] = "form-control"
                field.widget.attrs["placeholder"] = field.label
            else:
                field.widget.attrs = {"class": "form-control"}

    confirm_password = forms.CharField(
        widget=forms.PasswordInput(attrs={"placeholder": "Confirm password"}),
        label="确认密码",
    )

    code = forms.CharField(
        widget=forms.PasswordInput(attrs={"placeholder": "Enter verification code"}),
        label="验证码"
    )

    def clean_name(self):
        name = self.cleaned_data.get('name')
        if not User.objects.filter(name=name).exists():
            raise forms.ValidationError("Username does not exist")
        else:
            return name


    def clean_password(self):
        pwd = self.cleaned_data.get("password")
        return md5(pwd)

    def clean_confirm_password(self):
        pwd = self.cleaned_data.get('confirm_password')
        if md5(pwd)!= self.cleaned_data.get('password'):
            raise forms.ValidationError("Inconsistent passwords")
        else:
            return md5(pwd)

    class Meta:
        model = User
        fields = ['name','password', 'email']



class LoginForm(forms.ModelForm):
    boostrap_exclude_fields = []

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name in self.boostrap_exclude_fields:
                continue

            if field.widget.attrs:
                field.widget.attrs["class"] = "form-control"
                field.widget.attrs["placeholder"] = field.label
            else:
                field.widget.attrs = {"class": "form-control"}

    code = forms.CharField(
        label="CAPTCHA",

        widget=forms.TextInput(attrs={"placeholder": "Please enter the verification code"}),
    )

    def clean_password(self):
        pwd = self.cleaned_data.get('password')
        return md5(pwd)


    class Meta:
        model = User
        fields = ['name','password']



