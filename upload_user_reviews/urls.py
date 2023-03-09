from django.urls import path
from . import views

app_name = 'upload_user_reviews'

urlpatterns = [
    path('', views.csv_index, name="upload_user_reviews"),
    path('show_result/', views.feedback_result, name="show_result"),
]