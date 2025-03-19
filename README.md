# IT-project

1.**Clone the project**

command linebash:git clone https://github.com/1350122892/IT-130project.git

Download the compressed package directly, unzip and download

2.**Depends on the environment**

pip install -r requirements.txt（Or manually pycharm as per the desired library）

3.**Database configuration**

Install MySQL

Create an empty database

Edit the project settings.py（Or use a separate profile），Configure MySQL database information, for example:

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

4.**Migrate the database**

python manage.py makemigrations

python manage.py migrate

Import my database files(dump-django_blog-202503110609.sql)

5.**Create a super admin**

python manage.py createsuperuser（The account and password of the admin in the backend）

6.**Start the development server**

python manage.py runserver
