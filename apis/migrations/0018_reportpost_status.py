# Generated by Django 3.0.2 on 2020-04-27 07:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0017_auto_20200417_0846'),
    ]

    operations = [
        migrations.AddField(
            model_name='reportpost',
            name='status',
            field=models.IntegerField(default=0),
        ),
    ]