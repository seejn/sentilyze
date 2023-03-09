from django.urls import path
from . import views

app_name = 'merchants'

urlpatterns = [
    path("create_account/", views.create_account, name="create_account"),
    path("login/", views.login, name="login"),
    path("logout/", views.logout, name="logout"),
    path("home/", views.home, name="home"),
    path("profile/<int:company_pk>/", views.profile, name="profile"),
    path("edit_profile/", views.edit_profile, name="edit_profile"),
    path("change_password/", views.change_password, name="change_password"),
    path("change_profile_picture/", views.change_profile_picture, name="change_profile_picture"),
]