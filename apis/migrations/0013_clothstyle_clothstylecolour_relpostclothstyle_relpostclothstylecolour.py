# Generated by Django 3.0.2 on 2020-04-13 08:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0012_auto_20200413_0848'),
    ]

    operations = [
        migrations.CreateModel(
            name='ClothStyle',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('style_name', models.CharField(default='', max_length=59)),
                ('price', models.DecimalField(decimal_places=2, max_digits=9, null=True)),
                ('status', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'clothstyle',
                'verbose_name_plural': 'clothstyles',
                'db_table': 'clothstyle',
            },
        ),
        migrations.CreateModel(
            name='ClothStyleColour',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('status', models.BooleanField(default=True)),
                ('image', models.CharField(max_length=255)),
                ('cloth_style', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.ClothStyle')),
                ('colour', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='apis.Colour')),
            ],
            options={
                'verbose_name': 'clothstylecolour',
                'verbose_name_plural': 'clothstylescolours',
                'db_table': 'clothstylecolour',
            },
        ),
        migrations.CreateModel(
            name='RelPostClothStyleColour',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('cloth_style', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.ClothStyleColour')),
                ('post', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Post')),
            ],
            options={
                'verbose_name': 'relpostclothstylecolour',
                'verbose_name_plural': 'relpostclothstylecolours',
                'db_table': 'relpostclothstylecolour',
            },
        ),
        migrations.CreateModel(
            name='RelPostClothStyle',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('cloth_style', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.ClothStyle')),
                ('post', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Post')),
            ],
            options={
                'verbose_name': 'relpostclothstyle',
                'verbose_name_plural': 'relpostclothstyles',
                'db_table': 'relpostclothstyle',
            },
        ),
    ]
