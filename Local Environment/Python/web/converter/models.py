from django.db import models


class Upload(models.Model):
    title = models.CharField(max_length=200, verbose_name="Title")  # CharField for the title
    file = models.FileField(upload_to='uploads/', verbose_name='Select File')

    def __str__(self):
        return self.title
