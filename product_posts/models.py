from django.db import models
from merchants.models import Account
from django.utils import timezone as tz
# Create your models here.

class Product(models.Model):
    account = models.ForeignKey(Account, on_delete=models.CASCADE)
    product_image = models.ImageField(null=True)
    product_name = models.CharField(max_length=50)
    product_desc = models.TextField(max_length=100)
    product_price = models.FloatField()
    category_id = models.IntegerField(null=False, default=1)
    uploaded_at = models.DateTimeField(default=tz.now())

    def __str__(self):
        return self.product_name

    def get_company_name(self):
        acc = Account.objects.get(pk=self.account_id)
        profile = acc.profile_set.get(account_id=acc.id)
        return profile.company_name

    def get_product_category(self):
        category = Category.objects.get(pk=self.category_id)
        return category.category

class Category(models.Model):
    category = models.CharField(max_length=20)

    def __str__(self):
        return self.category

class Product_Review(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    review = models.TextField(max_length=200, null=True)
    status = models.CharField(max_length=20)

    def __str__(self):
        return self.status