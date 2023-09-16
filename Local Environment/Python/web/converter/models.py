from django.db import models


class Upload(models.Model):
    title = models.CharField(max_length=200)
    file = models.FileField(upload_to='uploads/')
