import json
import datetime
from django.test import TestCase, Client, RequestFactory
from django.urls import reverse
from blog.models import (
    Article, Notice, Category, Tag, Year, Valine, Site, Social
)


class BlogViewsTest(TestCase):
    def setUp(self):
        self.client = Client()
        self.factory = RequestFactory()
        self.site = Site.objects.create(
            site_name="Test Site",
            logo="logo.png",
            keywords="test,blog",
            desc="Test description",
            slogan="Test slogan",
            dynamic_slogan="Dynamic slogan",
            bg_cover="bg.png",
            icp_number="ICP123",
            icp_url="http://icp.test"
        )
        self.category1 = Category.objects.create(name="Cat1", add_menu=True, index=1)
        self.category2 = Category.objects.create(name="Cat2", add_menu=True, index=2)

        self.tag1 = Tag.objects.create(name="Tag1")
        self.tag2 = Tag.objects.create(name="Tag2")

        self.year = Year.objects.create(year="2025")

        self.notice = Notice.objects.create(title="Notice Title", content="Notice Content", icon="icon-notice")
        self.social = Social.objects.create(social_url="http://social.test", social_desc="Desc", social_icon="fas fa-envelope")
        self.valine = Valine.objects.create(appid="123", appkey="456", placeholder="Test placeholder")

        now = datetime.datetime.now()
        self.article1 = Article.objects.create(
            title="Article 1",
            desc="Desc 1",
            content="Content of article 1",
            add_time=now - datetime.timedelta(days=2),
            click_count=0,
            is_recommend=True,
            category=self.category1,
            author="Author1",
            years=self.year
        )
        self.article2 = Article.objects.create(
            title="Article 2",
            desc="Desc 2",
            content="Content of article 2",
            add_time=now - datetime.timedelta(days=1),
            click_count=0,
            is_recommend=False,
            category=self.category2,
            author="Author2",
            years=self.year
        )
        self.article1.tag.add(self.tag1)
        self.article2.tag.add(self.tag2)

    def test_index_view(self):
        response = self.client.get(reverse('index'))
        self.assertEqual(response.status_code, 200)
        self.assertIn('all_articles', response.context)
        self.assertIn('top_articles', response.context)
        self.assertIn('notices', response.context)
        top_articles = response.context['top_articles']
        self.assertTrue(any(a.id == self.article1.id for a in top_articles))

    def test_article_detail_view(self):
        url = reverse('article_detail', args=[self.article1.id])
        initial_click = self.article1.click_count
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)

        self.article1.refresh_from_db()
        self.assertEqual(self.article1.click_count, initial_click + 1)

        self.assertIn('article_detail_html', response.context)
        self.assertIn('before_article', response.context)
        self.assertIn('next_article', response.context)

    def test_edit_view_get(self):
        session = self.client.session
        session['info'] = {"id": 1, "name": "Test User"}
        session.save()

        response = self.client.get(reverse('edit'))
        self.assertEqual(response.status_code, 200)
        self.assertIn("form", response.context)
        self.assertIn("categorys", response.context)
        self.assertIn("tags", response.context)
        self.assertIn("years", response.context)

    def test_edit_view_post_valid(self):
        session = self.client.session
        session['info'] = {"id": 1, "name": "TestUser"}
        session.save()

        data = {
            'title': 'New Article',
            'desc': 'A short description',
            'cover': 'https://i1.hdslb.com/bfs/article/986da61cd857a85708ef16f21ecc588e4c7edc5d.jpg@1192w.avif',
            'content': 'Some markdown content here...',
            'category': self.category1.id,
            'years': self.year.id,
            'author': 'TestUser',
        }

        response = self.client.post(reverse('edit'), data=data)
        if response.status_code == 200 and 'form' in response.context:
            print("Form errors:", response.context['form'].errors)

        self.assertEqual(response.status_code, 302)
        self.assertTrue(Article.objects.filter(title='New Article').exists())

    def test_category_tag_view(self):
        url = reverse('category_tag')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("categories", response.context)
        self.assertIn("tags", response.context)

    def test_article_category_view(self):
        url = reverse('article_category', args=[self.category1.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("articles", response.context)
        self.assertIn("categories", response.context)
        self.assertIn("page_string", response.context)

    def test_article_tag_view(self):
        url = reverse('article_tag', args=[self.tag1.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("articles", response.context)
        self.assertIn("page_string", response.context)

    def test_tag_list_view(self):
        url = reverse('tag')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("tags", response.context)

    def test_category_list_view(self):
        url = reverse('category')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("categories", response.context)

    def test_year_list_view(self):
        url = reverse('article_year')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("article", response.context)

    def test_archive_detail_view(self):
        url = reverse('article_set', args=[self.year.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("all_articles", response.context)
        self.assertIn("date_list", response.context)
        self.assertIn("begin", response.context)
        self.assertIn("end", response.context)

    def test_archive_by_year_view(self):
        url = reverse('archive2', args=[self.year.id])
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertIn("all_articles", response.context)
        self.assertIn("articles", response.context)
        self.assertIn("year", response.context)

    def test_cloud_tag_view(self):
        url = reverse('cloud_tag')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        resp_json = json.loads(response.content.decode())
        self.assertTrue(resp_json.get("status"))
        self.assertIsInstance(resp_json.get("data"), list)

    def test_search_view(self):
        url = reverse('search')
        payload = {
            "searchKey": "Article",
            "page": 1,
            "pageSize": 10
        }
        response = self.client.post(url, data=json.dumps(payload), content_type='application/json')
        self.assertEqual(response.status_code, 200)
        resp_json = json.loads(response.content.decode())
        self.assertEqual(resp_json.get("code"), 200)
        self.assertIn("articleList", resp_json.get("data", {}))
