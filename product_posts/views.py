from django.shortcuts import render, redirect
from .models import *
from upload_user_reviews.views import get_review_status
from django.core.files.storage import FileSystemStorage

# Create your views here.
def post_product(request):
    if request.method == "GET":
        return redirect('/')
    
    product_image = request.FILES["product_image"]
    product_name = request.POST.get("product_name")
    product_price = request.POST.get("product_price")
    product_desc = request.POST.get("product_desc")
    product_category = request.POST.get("product_category")


    path = 'media/posted_product_picture/{}/'.format(request.session['company_pk'])
    savefile = FileSystemStorage(path)
    image_name = savefile.save(product_image.name, product_image)

    print(product_desc)

    product = Product(account_id=request.session["company_pk"],product_image=image_name, product_name=product_name, product_price=product_price, product_desc=product_desc, category_id=product_category)
    product.save()
    return redirect('/')

def get_products(company_id):

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

