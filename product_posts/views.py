from django.shortcuts import render, redirect
from django.contrib import messages
from .models import *
from upload_user_reviews.views import get_review_status
from django.core.files.storage import FileSystemStorage
from product_posts.models import Category

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



def edit_product(request, product_id):

    product = Product.objects.get(id=product_id)
    categories = Category.objects.all()
    if request.method == 'POST':
        product_name = request.POST.get('product_name')
        product_price = request.POST.get('product_price')
        product_category = request.POST.get('product_category')
        product_desc = request.POST.get('product_desc')

        print(product_name)
        print(product_price)
        print(product_category)
        print(product_desc)

        product.product_name=product_name
        product.product_price=product_price
        product.category_id=product_category
        product.product_desc=product_desc
        product.save()

        messages.success(request, "Changes Applied.")

        return redirect('/dashboard/see_my_posts/')

    context = {
        "product": product,
        "categories": categories,
    }

    return render(request, 'product_posts/edit_product.html', context)



def delete_product(request, product_id):

    product = Product.objects.get(id=product_id)

    if product.delete() is not None:
        messages.error(request, "Product Removed")
    else:
        message.error(request, "Something went wrong")

    return redirect('/dashboard/see_my_posts/')

def change_product_image(request, product_id):
    product = Product.objects.get(id=product_id)

    if request.method == "POST":

        product_image = request.FILES['product_image']
        path = 'media/posted_product_picture/{}/'.format(request.session['company_pk'])
        savefile = FileSystemStorage(path)
        name = savefile.save(product_image.name, product_image)

        product.product_image = name
        product.save()
        
        return redirect('/dashboard/see_my_posts/')


    return render(request, 'product_posts/change_product_image.html', {"product": product})