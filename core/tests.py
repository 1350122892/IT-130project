from django.test import TestCase
import json
import datetime
from django.test import TestCase, Client
from django.urls import reverse
from blog.models import (
    Article, Link, Category, Tag, Notice, Valine,
    About, Site, Social, Skill, Year
)

class CoreViewsTest(TestCase):
    def setUp(self):
        self.client = Client()

        # Create sample data for Site, Category, Tag, About, Skill, etc.
        self.site = Site.objects.create(
            site_name="Test Site",
            logo="http://example.com/logo.png",
            keywords="test,site",
            desc="Test Desc",
            slogan="Test Slogan",
            dynamic_slogan="Dynamic Slogan",
            bg_cover="http://example.com/bg.png",
            icp_number="ICP123",
            icp_url="http://icp.example.com"
        )
        self.category1 = Category.objects.create(name="Cat1", index=1, add_menu=True)
        self.category2 = Category.objects.create(name="Cat2", index=2, add_menu=False)
        self.tag1 = Tag.objects.create(name="Tag1")

        self.about = About.objects.create(
            avatar="http://example.com/avatar.png",
            career="Tester",
            introduction="An introduction text",
            skill_title="Skill Title"
        )
        self.skill1 = Skill.objects.create(skill_name="Python", skill_precent="95%")

        # Create one Link
        self.link1 = Link.objects.create(
            title="FriendSite",
            url="http://friend.example.com",
            avatar="http://example.com/avatar.png",
            desc="A friend site",
            button_word="Visit"
        )

        # Create several Articles for echarts or other statistics
        now = datetime.datetime.now()
        self.category_year = Year.objects.create(year="2025")
        self.article1 = Article.objects.create(
            title="Article 1",
            desc="Desc 1",
            author="TestAuth",  # 10 chars max
            content="Content of article 1",
            add_time=now - datetime.timedelta(days=1),
            category=self.category1,
        )
        self.article2 = Article.objects.create(
            title="Article 2",
            desc="Desc 2",
            author="Author2",  # 10 chars max
            add_time=now - datetime.timedelta(days=2),
            category=self.category2,
        )

    def test_about_view(self):
        """Test the about view."""
        # urls.py: path('about/', views.about, name='about')
        url = reverse('core:about')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        # Check context
        self.assertIn('articles', response.context)
        self.assertIn('categories', response.context)
        self.assertIn('tags', response.context)
        self.assertIn('about', response.context)
        self.assertIn('skill', response.context)
        # Verify the 'about' in context is the same as self.about
        self.assertEqual(response.context['about'], self.about)

    def test_member_view(self):
        """Test the member view."""
        # urls.py: path('member/', views.member, name='member')
        url = reverse('core:member')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        # Check "links" in context
        self.assertIn("links", response.context)
        # Confirm the link1 created in setUp is included
        links = response.context["links"]
        self.assertTrue(any(l.id == self.link1.id for l in links))

    def test_friend_view(self):
        """Test the friend view."""
        # urls.py: path('friend/', views.friend, name='friend')
        url = reverse('core:friend')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("links", response.context)
        links = response.context["links"]
        self.assertTrue(any(l.id == self.link1.id for l in links))

    def test_message_view(self):
        """Test the message view."""
        # urls.py: path('message/', views.message, name='message')
        url = reverse('core:message')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        # The returned template is message.html, with no specific context
        self.assertTemplateUsed(response, 'message.html')

    def test_echarts_category_view(self):
        """Test the echarts_category view => returns JSON."""
        # urls.py: path('echarts_category/', views.echarts_category, name='echarts_category')
        url = reverse('core:echarts_category')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        # Check if response is JSON
        resp_json = json.loads(response.content.decode())
        self.assertTrue(resp_json.get("status"))
        data_dict = resp_json.get("data", {})
        # data_list should be the statistics for each category
        data_list = data_dict.get("data_list", [])
        self.assertIsInstance(data_list, list)
        # count is the total number of categories
        self.assertEqual(data_dict.get("count"), Category.objects.count())

    def test_echarts_activate_view(self):
        """Test the echarts_activate view => returns JSON."""
        # urls.py: path('echarts_activate/', views.echarts_activate, name='echarts_activate')
        url = reverse('core:echarts_activate')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        resp_json = json.loads(response.content.decode())
        self.assertTrue(resp_json.get("status"))
        data_dict = resp_json.get("data", {})
        datalist = data_dict.get("datalist", [])
        valuelist = data_dict.get("valuelist", [])
        self.assertIsInstance(datalist, list)
        self.assertIsInstance(valuelist, list)
