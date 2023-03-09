from django.urls import path
from . import views
app_name = 'product_posts'

urlpatterns = [
    path('<int:company_id>', views.get_products),
    path('post_review/<int:product_id>', views.post_review, name="post_review"),
    path('post_product/', views.post_product, name="post_product"),
]