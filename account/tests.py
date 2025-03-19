from django.test import TestCase, RequestFactory, Client
from django.urls import reverse
from django.http import HttpResponse
from PIL import Image
import io
import time
import json

from account import views
from blog.models import User
from blog.utils.Form import LoginForm
from blog.utils import Verification

class AccountViewsTest(TestCase):
    def setUp(self):
        self.factory = RequestFactory()
        self.client = Client()
        # Create a test user (using custom fields: name and password)
        self.user = User.objects.create(name='testuser', password='12345')
        self.login_url = reverse('account:login')
        self.logout_url = reverse('account:logout')
        self.index_url = reverse('index')

    def test_generate_captcha_image(self):
        # Define a dummy_check_code that returns a red image and the captcha "ABC123"
        def dummy_check_code():
            img = Image.new('RGB', (100, 50), color='red')
            code = "ABC123"
            return img, code

        # Replace views.check_code (Note: check_code is already imported in views)
        original_check_code = views.check_code
        views.check_code = dummy_check_code
        try:
            request = self.factory.get('/account/captcha/')
            # Add a session attribute to the RequestFactory request (a simple dict is acceptable)
            request.session = {}
            response = views.generate_captcha_image(request)
            self.assertIsInstance(response, HttpResponse)
            # Verify that the captcha stored in the session is "ABC123"
            self.assertIn('captcha_code', request.session)
            self.assertEqual(request.session['captcha_code'], "ABC123")
            # Check that the response content is in PNG format (PNG file header: 89 50 4E 47)
            content = response.content
            self.assertTrue(content.startswith(b'\x89PNG'))
        finally:
            views.check_code = original_check_code

    def test_login_valid(self):
        # Store the correct captcha in the client's session
        session = self.client.session
        session['captcha_code'] = "ABC123"
        session.save()
        # To ensure login success, replace authenticate_user so that it always returns the test user
        original_authenticate_user = views.authenticate_user
        views.authenticate_user = lambda form: self.user
        try:
            # Construct POST data (assuming LoginForm uses the fields: name, password, code)
            data = {
                'name': 'testuser',
                'password': '12345',
                'code': 'ABC123'
            }
            # On successful login, it should redirect to the next URL
            response = self.client.post(self.login_url + '?next=/', data)
            self.assertEqual(response.status_code, 302)
            session = self.client.session
            self.assertIn('info', session)
            self.assertEqual(session['info']['name'], 'testuser')
        finally:
            views.authenticate_user = original_authenticate_user

    def test_login_invalid_captcha(self):
        session = self.client.session
        session['captcha_code'] = "ABC123"
        session.save()
        data = {
            'name': 'testuser',
            'password': '12345',
            'code': 'WRONG'
        }
        response = self.client.post(self.login_url, data)
        # When the captcha is incorrect, the login page should be returned (status code 200)
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "CAPTCHA error")

    def test_logout_requires_post(self):
        # A GET request to logout should return 405
        response = self.client.get(self.logout_url)
        self.assertEqual(response.status_code, 405)

    def test_logout_post_when_logged_in(self):
        # Simulate a logged-in state (session contains 'info')
        session = self.client.session
        session['info'] = {"id": self.user.id, "name": self.user.name}
        session.save()
        response = self.client.post(self.logout_url, follow=True)
        self.assertRedirects(response, self.index_url)
        session = self.client.session
        self.assertNotIn('info', session)

    def test_logout_post_when_not_logged_in(self):
        # Call logout when not logged in
        response = self.client.post(self.logout_url, follow=True)
        self.assertRedirects(response, self.index_url)
