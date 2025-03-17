from django.contrib import admin
from .models import Article,Category,Tag,Link,Site,Notice,Valine,About,Social,Skill,Year
from import_export.admin import ImportExportModelAdmin
from django.urls import reverse
from django.utils.html import format_html

from django.db import models

#admin.site.register(Article)

#Modify the header display content and backend name of the backend management page
admin.site.site_header = 'IT-Group130'
admin.site.site_title = 'IT | Background'

#articles
@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    #Setting the fields to be displayed in the backend list
    list_display = ('add_time','title','cover_preview','category','show_tag','is_recommend','click_count','update_time','years')
    list_per_page = 10 #Set how many records are displayed on each page, the default is 100.
    list_editable = ['category','is_recommend'] #Setting the default editable fields will allow you to edit them in the list
    ordering = ('-add_time','is_recommend') #Set the default sort field, a negative sign indicates a descending sort order
    list_display_links = ('title',) #Set which fields can be clicked into the edit screen
    search_fields = ('title', 'desc', 'content')
    list_filter = ('title','add_time')  #Filter, filter by field
    date_hierarchy = 'add_time'  #Detailed time-stratified screening　
    readonly_fields = ('cover_preview',)#Read-only field, add this field to preview the cover in the backend, otherwise an error is reported
    fieldsets = (  #Backend article editing page layout
        ('Editorials', {
            'fields': ('title','author','cover','cover_preview', 'desc','content')
        }),
        ('Other settings', {
            'classes': ('collapse', ),
            'fields': ('is_recommend','category','tag', 'add_time','years'),
        }),
    )

    '''Show all tags of the article in the backend'''
    def show_tag(self, obj):
        return [t.name for t in obj.tag.all()]
    show_tag.short_description = "labels"   # Setting the backend table header


#categorisation
@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id','name','add_menu','get_items','icon','icon_data']
    list_editable = ['add_menu','icon']
    search_fields = ('name',)
    list_display_links = ('name',) #Set which fields can be clicked into the edit screen

#labelS
@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ['id','name','get_items']
    search_fields = ('name',)

#year
@admin.register(Year)
class TagAdmin(admin.ModelAdmin):
    list_display = ['id','year']
    list_editable = ['year']
    search_fields = ('year',)


#menber
@admin.register(Link)
class LinkAdmin(ImportExportModelAdmin):
    list_display = ['title','url','avatar_admin','desc','button_word']
    list_editable = ['url','button_word']
    search_fields = ('title', 'url', 'desc')

#bulletin board
@admin.register(Notice)
class NoticeAdmin(admin.ModelAdmin):
    list_display = ['title', 'content','icon','icon_data']
    list_editable = ['icon']
#Website Setup
@admin.register(Site)
class SiteAdmin(ImportExportModelAdmin):
    list_display = ['site_name','logo_preview','keywords','desc','slogan','dynamic_slogan','bgcover_preview','icp_number','icp_url']
from django.forms import PasswordInput

#about
@admin.register(About)
class AboutAdmin(admin.ModelAdmin):
    list_display = ['avatar_admin','career','introduction','skill_title']
    list_display_links = ('career',)

#sociality
@admin.register(Social)
class SocialAdmin(admin.ModelAdmin):
    list_display = ['social_desc', 'social_url', 'social_icon','icon_data']
    list_editable = ['social_icon']

#skill
@admin.register(Skill)
class SocialAdmin(admin.ModelAdmin):
    list_display = ['skill_name',  'skill_precent']

