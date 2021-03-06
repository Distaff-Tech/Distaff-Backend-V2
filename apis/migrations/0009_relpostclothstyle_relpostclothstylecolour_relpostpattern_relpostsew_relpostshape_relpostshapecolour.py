# Generated by Django 3.0.2 on 2020-04-13 04:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0008_auto_20200401_0847'),
    ]

    operations = [
        migrations.CreateModel(
            name='RelPostShapeColour',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('cloth_style', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.ShapeColour')),
                ('post', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Post')),
            ],
            options={
                'verbose_name': 'relpostshapecolour',
                'verbose_name_plural': 'relpostshapecolours',
                'db_table': 'relpostshapecolour',
            },
        ),
        migrations.CreateModel(
            name='RelPostShape',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('cloth_style', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Shape')),
                ('post', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Post')),
            ],
            options={
                'verbose_name': 'relpostshape',
                'verbose_name_plural': 'relpostshapes',
                'db_table': 'relpostshape',
            },
        ),
        migrations.CreateModel(
            name='RelPostSew',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('cloth_style', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Sew')),
                ('post', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Post')),
            ],
            options={
                'verbose_name': 'relpostsew',
                'verbose_name_plural': 'relpostsews',
                'db_table': 'relpostsew',
            },
        ),
        migrations.CreateModel(
            name='RelPostPattern',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
                ('cloth_style', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Pattern')),
                ('post', models.ForeignKey(null='True', on_delete=django.db.models.deletion.CASCADE, to='apis.Post')),
            ],
            options={
                'verbose_name': 'relpostpattern',
                'verbose_name_plural': 'relpostpatterns',
                'db_table': 'relpostpattern',
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
