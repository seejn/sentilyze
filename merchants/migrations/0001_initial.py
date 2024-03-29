# Generated by Django 4.1.7 on 2023-03-05 15:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company_email', models.CharField(max_length=50, unique=True)),
                ('password', models.CharField(max_length=200)),
                ('created_at', models.DateTimeField(verbose_name='Account created')),
                ('updated_at', models.DateTimeField(verbose_name='Account updated')),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company_logo', models.CharField(default=False, max_length=50)),
                ('company_name', models.CharField(max_length=20)),
                ('company_reg_id', models.CharField(max_length=20, unique=True)),
                ('account', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='merchants.account')),
            ],
        ),
    ]
