from django.shortcuts import render,redirect
from merchants.models import Account

from django.contrib import messages

# Create your views here.

def dashboard(request):
    company_pk = request.session.get('company_pk')

    if company_pk is None:
        return redirect('/merchants/login/')
    
    company = Account.objects.get(pk=company_pk)

    context = {
        "company": company,
        "company_profile": company.profile_set.get(account_id=company.id),
    }
    return render(request, "dashboard/dashboard.html", context)

