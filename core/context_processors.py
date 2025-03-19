from blog.models import Site, Social, Category


def global_params(request):
    """Global variables for templates."""
    site = Site.objects.first()
    if site:
        site_name = site.site_name
        logo = site.logo
        keywords = site.keywords
        desc = site.desc
        slogan = site.slogan
        dynamic_slogan = site.dynamic_slogan
        bg_cover = site.bg_cover
        icp_number = site.icp_number
        icp_url = site.icp_url
    else:
        site_name = "Default Site Name"
        logo = ""
        keywords = ""
        desc = ""
        slogan = ""
        dynamic_slogan = ""
        bg_cover = ""
        icp_number = ""
        icp_url = ""

    category_nav = Category.objects.filter(add_menu=True).order_by('index')
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
