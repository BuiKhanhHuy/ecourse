# Generated by Django 4.0.2 on 2022-02-22 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='avatar',
            field=models.ImageField(null=True, upload_to='avatar/%Y/%m/%d/'),
        ),
    ]
