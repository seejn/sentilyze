from django.shortcuts import render, redirect
from product_posts import views
# Create your views here.
def mainapp(request):
    print(request.path)
    try:
        if request.session["company_pk"]:
            return redirect('/dashboard/')
    except KeyError:
        context = {
            "document_title":"Home",
            "products": views.get_products(0),
            "path": request.path,
        }
        return render(request, 'mainapp/landingpage.html', context)

def aboutus(request):
    context = {
        "document_title":"About Us",
    }
    return render(request, 'mainapp/aboutus.html', context)
        