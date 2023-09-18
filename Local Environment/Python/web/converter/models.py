from django.db import models


class Upload(models.Model):
    file = models.FileField(upload_to='uploads/', verbose_name='Select File')

    def __str__(self):
        return self.file.name
