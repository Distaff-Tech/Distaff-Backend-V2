# Generated by Django 3.0.2 on 2020-04-28 13:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0018_reportpost_status'),
    ]

    operations = [
        migrations.CreateModel(
            name='FabricColour',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('colour', models.CharField(default='', max_length=59)),
                ('colour_code', models.CharField(default='', max_length=59)),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'fabriccolour',
                'verbose_name_plural': 'fabriccolours',
                'db_table': 'fabriccolour',
            },
        ),
        migrations.CreateModel(
            name='FabricColourImage',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('status', models.BooleanField(default=True)),
                ('image', models.CharField(max_length=255)),
                ('fabric', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Fabric')),
                ('fabriccolour', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.FabricColour')),
            ],
            options={
                'verbose_name': 'fabriccolourimage',
                'verbose_name_plural': 'fabriccolourimages',
                'db_table': 'fabriccolourimage',
            },
        ),
    ]