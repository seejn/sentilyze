from django.urls import path
from . import views

app_name = 'dashboard'

urlpatterns=[
    path('', views.see_my_posts, name='dashboard'),
    path('see_my_posts/', views.see_my_posts, name='see_my_posts'),
    path('analytics/', views.analytics, name='analytics'),
    path('publish/', views.publish, name='publish_product'),
]