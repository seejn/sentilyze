from django.shortcuts import render,redirect
from django.contrib import KeyError
from merchants.models import Account
from product_posts.models import Product, Category
from django.contrib import messages

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
    return render(request, 'dashboard/analytics.html', context)

def publish(request):
    context = dashboard(request)
    categories = Category.objects.all()
    context.update({
        "categories": categories,
        "dashboard_page_no": 2,
    })
    return render(request, 'dashboard/publish_product.html', context)