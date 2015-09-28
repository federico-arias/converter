from django.db import models

class UploadedFile(models.Model):
    filename=models.CharField(max_length=400)
    fileurl= models.FileField(blank=True, null=True, upload_to='files')
