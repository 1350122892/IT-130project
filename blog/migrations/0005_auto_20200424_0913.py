# Generated by Django 3.0.5 on 2020-04-24 01:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_auto_20200424_0912'),
    ]

    operations = [
        migrations.AlterField(
            model_name='link',
            name='url',
            field=models.URLField(verbose_name='网址'),
        ),
    ]
