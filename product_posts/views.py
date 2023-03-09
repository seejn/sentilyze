from django.shortcuts import render, redirect
from .models import *
from upload_user_reviews.views import get_review_status
# Create your views here.

def products(company_id):

    company = Account.objects.all()
    if not company_id == 0:
        products = Product.objects.filter(account_id=company_id)
    else:
        products = Product.objects.all()

    # context = {
    #     "products": products,
    # }
    # return render(request, 'product_posts/product_posts.html', context)
    return products

def post_review(request, product_id):
    
    print(product_id)
    print(request.POST.get('path'))
    print(request.POST.get('review'))
    
    review = request.POST.get('review')
    product = Product.objects.get(pk=product_id)

    review_status = get_review_status(review)
    if review_status[0] > 0:
        product.product_review_set.create(review=review, status='Positive')
    else:
        product.product_review_set.create(review=review, status='Negative')

    return redirect(request.POST.get('path'))

