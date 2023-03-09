from django.db import models
from django.utils import timezone as tz
# Create your models here.
class Account(models.Model):
    company_email = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=200)
    created_at = models.DateTimeField('Account created', default=tz.now())
    updated_at = models.DateTimeField('Account updated', default=tz.now())

    def __str__(self):
        return self.company_email

    def get_company_email(self):
        return self.company_email

class Profile(models.Model):
    account = models.ForeignKey(Account, on_delete=models.CASCADE)
    company_logo = models.ImageField(upload_to="profile_picture", default=False)
    map_url = models.CharField(max_length=500, null=True)
    company_name = models.CharField(max_length=20)
    company_address = models.CharField(max_length=100, null=True)
    company_reg_id = models.CharField(max_length=20, unique=True)
    company_desc = models.TextField(max_length=100, null=True)


    def __str__(self):
        return self.company_name

    