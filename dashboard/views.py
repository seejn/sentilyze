from django.shortcuts import render,redirect
from merchants.models import Account
from product_posts.models import Product, Category
from django.contrib import messages

import numpy as np

# Create your views here.

def dashboard(request):
    try:
        company_pk = request.session.get('company_pk')
    except KeyError:
        return redirect('/merchants/login/')

    context = {
        "document_title": "dashboard",
    }
    return context

def see_my_posts(request):
    context = dashboard(request)
    company_pk = request.session["company_pk"]
    products = Product.objects.filter(account_id=company_pk)

    context.update({
        "products": products,
        "dashboard_page_no": 0,
    })
    return render(request, 'dashboard/see_my_posts.html', context)



def analytics(request):
    context = dashboard(request)
    context.update({
        "dashboard_page_no": 1
    })

    company_pk = request.session["company_pk"]
    print(company_pk)

    products = Product.objects.filter(account_id=company_pk)
    category_id = []
    category = []
    category_positive_count=[]
    category_negative_count=[]

    for x in products:
        category_id.append(x.get_product_category().id)

        reviews = x.get_review_status()

    category_id = np.unique(category_id)

    for id in category_id:
        print("category: ",Category.objects.get(pk=id).category)
        category.append(Category.objects.get(pk=id).category)

        category_based_products = Product.objects.filter(account_id=company_pk,category_id=id)

        print("category_based_products",category_based_products)
        
        positive_count = 0
        negative_count = 0
        for product in category_based_products:


            print("Product Name:",product)
            count = product.get_review_status()
            
            print("Negative count:",count["positive_count"])
            print("Positive count:",count["negative_count"])
            
            positive_count+=count["positive_count"]
            negative_count+=count["negative_count"]

        category_positive_count.append(positive_count)
        category_negative_count.append(negative_count)

    print("categories: ", category)
    print("category_positive_count", category_positive_count)
    print("category_negative_count", category_negative_count)

    category_collection = {
        "category_positive_count": category_positive_count,
        "category_negative_count": category_negative_count,
    }

    context = {
        "products": products,
        "reviews": reviews,
        "dashboard_page_no": 1,
        "category": category,
        "category_collection": category_collection,
    }

    return render(request, 'dashboard/analytics.html', context)

def publish(request):
    context = dashboard(request)
    categories = Category.objects.all()
    context.update({
        "categories": categories,
        "dashboard_page_no": 2,
    })
    return render(request, 'dashboard/publish_product.html', context)