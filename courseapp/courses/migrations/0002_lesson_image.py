# Generated by Django 4.0.2 on 2022-03-15 11:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='lesson',
            name='image',
            field=models.ImageField(null=True, upload_to='lessons/title/%Y/%m/%d/'),
        ),
    ]
