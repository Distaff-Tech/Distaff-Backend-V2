# Generated by Django 3.0.2 on 2020-07-21 04:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0026_custsize'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='post_printing_size_back',
            field=models.CharField(default='', max_length=255),
        ),
        migrations.AddField(
            model_name='post',
            name='post_printing_size_front',
            field=models.CharField(default='', max_length=255),
        ),
    ]