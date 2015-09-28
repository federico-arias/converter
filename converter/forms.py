from django import forms
from converter.models import UploadedFile

class UploadForm(forms.ModelForm):
    class Meta:
        model=UploadedFile
        fields=('filename', 'fileurl')

