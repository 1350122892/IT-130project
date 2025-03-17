from blog.models import Site, Social, Category

def global_params(request):
    """global variable"""

    category_nav = Category.objects.filter(add_menu=True).order_by('index')
    site_name = Site.objects.first().site_name
    logo = Site.objects.first().logo
    keywords = Site.objects.first().keywords
    desc = Site.objects.first().desc
    slogan = Site.objects.first().slogan
    dynamic_slogan = Site.objects.first().dynamic_slogan
    bg_cover = Site.objects.first().bg_cover
    icp_number = Site.objects.first().icp_number
    icp_url = Site.objects.first().icp_url
    social = Social.objects.all()
    return {
        'category_nav': category_nav,
        'SITE_NAME': site_name,
        'LOGO': logo,
        'KEYWORDS': keywords,
        'DESC': desc,
        'SLOGAN': slogan,
        'DYNAMIC_SLOGAN': dynamic_slogan,
        'BG_COVER': bg_cover,
        'ICP_NUMBER': icp_number,
        'ICP_URL': icp_url,
        'social': social,
    }