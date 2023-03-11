from django.urls import path
from . import views
app_name = 'product_posts'

urlpatterns = [
    path('<int:company_id>', views.get_products),
    path('post_review/<int:product_id>', views.post_review, name="post_review"),
    path('post_product/', views.post_product, name="post_product"),
    path('edit_product/<int:product_id>/', views.edit_product, name="edit_product"),
    path('delete_product/<int:product_id>/', views.delete_product, name="delete_product"),
    path('change_product_image/<int:product_id>/', views.change_product_image, name="change_product_image"),
]