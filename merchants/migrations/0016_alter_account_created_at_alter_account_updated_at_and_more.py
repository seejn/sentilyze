# Generated by Django 4.1.7 on 2023-03-09 19:08

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('merchants', '0015_alter_account_created_at_alter_account_updated_at'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='created_at',
            field=models.DateTimeField(default=datetime.datetime(2023, 3, 9, 19, 7, 52, 735280), verbose_name='Account created'),
        ),
        migrations.AlterField(
            model_name='account',
            name='updated_at',
            field=models.DateTimeField(default=datetime.datetime(2023, 3, 9, 19, 7, 52, 735321), verbose_name='Account updated'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='company_name',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='profile',
            name='company_reg_id',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]