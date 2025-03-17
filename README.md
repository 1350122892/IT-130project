# IT-project

1.**克隆项目**

命令行bash:git clone https://github.com/1350122892/IT-130project.git

直接下载压缩包解压下载

2.**按照环境依赖**

pip install -r requirements.txt（或手动pycharm按照所需库）

3.**数据库配置**

安装mysql

创建一个空的数据库

编辑项目中的 settings.py（或使用单独的配置文件），配置 MySQL 数据库信息，例如：

DATABASES = {
'default':{
'ENGINE':'django.db.backends.mysql',
'NAME':'django_blog',
'USER':'root',
'PASSWORD':'',
'HOST':'127.0.0.1',
'PORT':3306
}
}

4.**迁移数据库**

python manage.py makemigrations

python manage.py migrate

导入我的数据库文件(dump-django_blog-202503110609.sql)

5.**创建超级管理员**

python manage.py createsuperuser（后台admin的账户和密码）

6.**启动开发服务器**

python manage.py runserver
