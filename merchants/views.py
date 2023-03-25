from django.shortcuts import render, redirect
from django.contrib.auth.hashers import make_password, check_password
from django.http import HttpResponse
from django.utils import timezone as tz
from django.contrib import messages
from django.db import *
from .models import * 
from product_posts.models import * 
from product_posts import views
from django.core.files.storage import FileSystemStorage
import os
# Create your views here.
def create_account(request):
    print("create_account")
    if request.method == "POST":
        company_reg_id = request.POST.get("company_reg_id") 
        company_name = request.POST.get("company_name")
        company_email = request.POST.get("company_email")
        password = request.POST.get("password")

        password = make_password(password)

        try:
            new_acc = Account(company_email=company_email, password=password)
            new_acc.save()
        except IntegrityError:
            messages.error(request, "Sorry, Try Again!!!")
            new_acc = None

        print(new_acc)
            
        if new_acc is not None:            
            new_acc.profile_set.create(company_reg_id=company_reg_id, company_name=company_name)
            messages.success(request, "Account Created")
            return redirect('/merchants/login/')

    context = {
        "document_title":"Sign Up",
    }
    return render(request, 'merchants/signup_form.html', context)



def login(request):

    company_pk = request.session.get('company_pk') 
    if company_pk:
        return redirect('/dashboard/')

    if request.method == 'POST':
        company_email = request.POST.get("company_email")
        password = request.POST.get("password")

        print(company_email, password)

        try:
            req_company = Account.objects.get(company_email=company_email)
            print(password)
            print(req_company.password)
        except Account.DoesNotExist:
            req_company = None

        if req_company is not None and check_password(password, req_company.password):
            request.session['company_pk'] = req_company.id
            return redirect("/dashboard/")
        else:
            messages.error(request, "Email or Password is incorrect.")


    context = {
        "document_title":"Log In"
    }
    return render(request, 'merchants/login_form.html', context)



def logout(request):
    del request.session['company_pk']

    return redirect('/')

def home(request):
    context = {
        "document_title":"Home",
        "products": views.get_products(0),
        "path": request.path,
    }
    return render(request, 'merchants/home.html', context)

def profile(request, company_pk):
    print(request.path)
    
    if company_pk is None:
        company_pk = request.session.get('company_pk')
    print(company_pk)
    company = Account.objects.get(pk=company_pk)
    print(company.id)

    context = {
        "document_title":company.profile_set.get(account_id=company.id).company_name,
        "company": company,
        "company_profile": company.profile_set.get(account_id=company_pk),
        "products": views.get_products(company_pk),
        "path": request.path,
    }

    return render(request, 'merchants/profile.html', context)

def edit_profile(request):
    if request.method == 'GET':
        return redirect('/')

    company_pk = request.session['company_pk']
    acc = Account.objects.get(pk=company_pk)

    context = {
        "company": acc,
        "company_profile": acc.profile_set.get(account_id=company_pk),
    }

    if request.POST.get("apply_change") is not None:
        company_name = request.POST.get("company_name")
        map_url = request.POST.get("map_url")
        company_address = request.POST.get("company_address")
        company_desc = request.POST.get("company_desc")

        print(company_name, company_address, company_desc, map_url)

        acc.profile_set.update(company_name = company_name)
        acc.profile_set.update(company_address = company_address)
        acc.profile_set.update(company_desc = company_desc)
        acc.profile_set.update(map_url = map_url)
        acc.updated_at = tz.now()
        acc.save()
        return redirect('/merchants/profile/' + str(company_pk) + '/')

    return render(request, 'merchants/edit_profile.html', context);

def change_password(request):
    company_pk = request.session['company_pk']
    context = {
        # "company": Account.objects.get(pk=company_pk),
        # "company_profile": Account.objects.get(pk=company_pk).profile_set.get(account_id=company_pk),
    }
    return render(request, 'merchants/change_password.html', context);

def change_profile_picture(request):
    company_pk = request.session['company_pk']
    acc = Account.objects.get(pk=company_pk)
    
    if request.method == "POST":

        profile_pic = request.FILES['profile_picture']
        path = 'media/profile_picture/{}/'.format(request.session['company_pk'])
        savefile = FileSystemStorage(path)
        name = savefile.save(profile_pic.name, profile_pic)

        acc.profile_set.update(company_logo=name)
        acc.updated_at = tz.now()
        acc.save()
        return redirect('/merchants/profile/' + str(company_pk) + '/')


    return render(request, 'merchants/change_profile_picture.html')


