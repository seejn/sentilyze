from django.urls import path
from . import views
app_name = 'product_posts'

urlpatterns = [
    path('<int:company_id>', views.products),
    path('post_review/<int:product_id>', views.post_review, name="post_review")
]