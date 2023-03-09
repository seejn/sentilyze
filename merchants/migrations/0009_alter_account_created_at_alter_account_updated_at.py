# Generated by Django 4.1.7 on 2023-03-08 17:25

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('merchants', '0008_alter_account_created_at_alter_account_updated_at_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='created_at',
            field=models.DateTimeField(default=datetime.datetime(2023, 3, 8, 17, 25, 10, 793597), verbose_name='Account created'),
        ),
        migrations.AlterField(
            model_name='account',
            name='updated_at',
            field=models.DateTimeField(default=datetime.datetime(2023, 3, 8, 17, 25, 10, 793632), verbose_name='Account updated'),
        ),
    ]
