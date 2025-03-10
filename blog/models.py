from math import trunc
import markdown
from django.db import models
from datetime import datetime
from django.utils.html import format_html
from mdeditor.fields import MDTextField

class Category(models.Model):
    """Article Category"""
    name = models.CharField(max_length=20, verbose_name='Category Name')
    index = models.IntegerField(default=1, verbose_name='Category Order')
    add_menu = models.BooleanField(default=False, verbose_name='Add to Navigation')
    icon = models.CharField(max_length=30, default='fas fa-home', verbose_name='Navigation Icon')

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Category'

    def get_items(self):
        """Count how many articles are related to this category."""
        return len(self.article_set.all())
    get_items.short_description = 'Number of Articles'

    def icon_data(self):
        """Preview of the icon in the admin."""
        return format_html('<h1><i class="{}"></i></h1>', self.icon)
    icon_data.short_description = 'Icon Preview'

    def __str__(self):
        return self.name


class Tag(models.Model):
    """Tag"""
    name = models.CharField(max_length=20, verbose_name='Tag Name')

    class Meta:
        verbose_name = 'Tag'
        verbose_name_plural = 'Tag'

    def get_items(self):
        """Count how many articles are related to this tag."""
        return len(self.article_set.all())
    get_items.short_description = 'Number of Articles'

    def __str__(self):
        return self.name


class Year(models.Model):
    """Year"""
    year = models.CharField(unique=True, max_length=4, verbose_name='Year')

    class Meta:
        verbose_name = 'Year'
        verbose_name_plural = 'Year'

    def __str__(self):
        return str(self.year)


class Article(models.Model):
    """Article"""
    title = models.CharField(max_length=50, verbose_name='Article Title')
    author = models.CharField(max_length=10, verbose_name='Author',
                              default='Long Live the Motherland',
                              blank=True, null=True)
    desc = models.CharField(max_length=50, verbose_name='Article Description')
    cover = models.URLField(max_length=200, verbose_name='Article Cover',
                            default='https://i1.hdslb.com/bfs/article/986da61cd857a85708ef16f21ecc588e4c7edc5d.jpg@1192w.avif')
    content = MDTextField(verbose_name='Article Content')
    click_count = models.PositiveIntegerField(default=0, verbose_name='Reading Count')
    is_recommend = models.BooleanField(default=False, verbose_name='Recommended')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Publish Time')
    update_time = models.DateTimeField(auto_now=True, verbose_name='Update Time')
    category = models.ForeignKey(Category, to_field="id",
                                 blank=True, null=True,
                                 verbose_name='Article Category',
                                 on_delete=models.CASCADE)
    tag = models.ManyToManyField(Tag, blank=True, verbose_name='Article Tag')
    years = models.ForeignKey(Year, to_field="id",
                              blank=True, null=True,
                              verbose_name='Year',
                              on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'Article'
        verbose_name_plural = 'Article'
        ordering = ('-add_time',)

    def cover_preview(self):
        """Preview of the article cover in the admin."""
        return format_html('<img src="{}" width="200px" height="150px" />', self.cover)
    cover_preview.short_description = 'Cover Preview'

    def __str__(self):
        return self.title

    def content_as_html(self):
        """Convert Markdown content to HTML."""
        return markdown.markdown(self.content)


class Link(models.Model):
    """Link (e.g., members or partners)"""
    title = models.CharField(max_length=10, verbose_name='Title')
    url = models.URLField(verbose_name='URL', blank=True)
    avatar = models.URLField(default='https://i.loli.net/2020/04/23/jGP8gQOYW75TSJp.png',
                             verbose_name='Avatar')
    desc = models.TextField(max_length=50, verbose_name='Description')
    button_word = models.CharField(default='Visit', max_length=10, verbose_name='Button Text')

    class Meta:
        verbose_name = 'Link'
        verbose_name_plural = 'Link'

    def avatar_admin(self):
        """Preview of the avatar in the admin."""
        return format_html('<img src="{}" width="50px" height="50px" style="border-radius: 50%;" />', self.avatar)
    avatar_admin.short_description = 'Avatar Preview'

    def __str__(self):
        return self.title


class Notice(models.Model):
    """Notice"""
    title = models.CharField(max_length=30, verbose_name='Notice Title')
    content = models.TextField(max_length=500, verbose_name='Notice Content')
    icon = models.CharField(default='far fa-lightbulb', max_length=50, verbose_name='Notice Icon')

    class Meta:
        verbose_name = 'Notice'
        verbose_name_plural = 'Notice'

    def icon_data(self):
        """Preview of the notice icon in the admin."""
        return format_html('<h1><i class="{}"></i></h1>', self.icon)
    icon_data.short_description = 'Icon Preview'

    def __str__(self):
        return self.title


class Valine(models.Model):
    """Valine Comment"""
    appid = models.CharField(max_length=100, verbose_name='AppID')
    appkey = models.CharField(max_length=100, verbose_name='AppKey')
    avatar = models.CharField(default='', blank=True, max_length=100, verbose_name='Avatar')
    pagesize = models.IntegerField(default=10, verbose_name='Page Size')
    placeholder = models.CharField(max_length=100, verbose_name='Placeholder')

    class Meta:
        verbose_name = 'Valine Comment'
        verbose_name_plural = 'Valine Comment'


class About(models.Model):
    """About Page"""
    avatar = models.URLField(verbose_name='Avatar')
    career = models.CharField(max_length=50, verbose_name='Career')
    introduction = models.TextField(verbose_name='Introduction')
    skill_title = models.CharField(default='Skill', max_length=50, verbose_name='Skill Title')

    class Meta:
        verbose_name = 'About'
        verbose_name_plural = 'About'

    def avatar_admin(self):
        """Preview of the avatar in the admin."""
        return format_html('<img src="{}" width="50px" height="50px" style="border-radius: 50%;" />', self.avatar)
    avatar_admin.short_description = 'Avatar Preview'


class Social(models.Model):
    """Social Link"""
    social_url = models.URLField(verbose_name='Social URL')
    social_desc = models.CharField(max_length=50, verbose_name='Description')
    social_icon = models.CharField(max_length=50, default='fas fa-envelope', verbose_name='Social Icon')

    class Meta:
        verbose_name = 'Social'
        verbose_name_plural = 'Social'

    def icon_data(self):
        """Preview of the social icon in the admin."""
        return format_html('<h1><i class="{}"></i></h1>', self.social_icon)
    icon_data.short_description = 'Icon Preview'


class Skill(models.Model):
    """Skill for the About Page"""
    skill_name = models.CharField(max_length=50, verbose_name='Skill Name')
    skill_precent = models.CharField(default='%', max_length=50, verbose_name='Percentage')

    class Meta:
        verbose_name = 'Skill'
        verbose_name_plural = 'Skill'

    def icon_data(self):
        # Not sure if you intended to show an icon for Skill; removed references to social_icon
        return format_html('<h1>{}</h1>', self.skill_name)
    icon_data.short_description = 'Icon Preview'


class Site(models.Model):
    """Site Configuration"""
    site_name = models.CharField(default='SimpleSite', max_length=30, verbose_name='Site Name')
    keywords = models.CharField(default='Keywords test', max_length=50, verbose_name='Keywords')
    logo = models.URLField(default='/media/img/preview.jpg', max_length=100, verbose_name='Site Logo')
    desc = models.CharField(max_length=50, verbose_name='Site Description')
    slogan = models.CharField(max_length=50, verbose_name='Site Slogan')
    dynamic_slogan = models.CharField(max_length=50, verbose_name='Dynamic Slogan')
    icp_number = models.CharField(max_length=40, verbose_name='ICP Number')
    icp_url = models.URLField(default='#', max_length=100, verbose_name='ICP URL')
    bg_cover = models.URLField(default='/media/img/003044Cwsr1.jpg', max_length=100, verbose_name='Background Image')

    class Meta:
        verbose_name = 'Site Config'
        verbose_name_plural = 'Site Config'

    def logo_preview(self):
        """Preview of the site logo in the admin."""
        return format_html('<img src="{}" width="40px" height="40px" alt="logo" />', self.logo)
    logo_preview.short_description = 'Logo Preview'

    def bgcover_preview(self):
        """Preview of the home background in the admin."""
        return format_html('<img src="{}" width="100px" height="80px" alt="bgcover" />', self.bg_cover)
    bgcover_preview.short_description = 'Home Background Preview'

    def __str__(self):
        return self.site_name


class User(models.Model):
    """User Table"""
    name = models.CharField(max_length=10, verbose_name="Username")
    password = models.CharField(max_length=64, verbose_name='Password')
    email = models.EmailField(max_length=22, null=True, blank=True, verbose_name="Email")

    def __str__(self):
        return self.name
