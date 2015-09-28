from django.views.generic.edit import FormView
from converter.forms import UploadForm
from converter.models import UploadedFile
from converter.unit import Unidad 
from django.conf import settings
from django.http import FileResponse, HttpResponse
import os

class Cepillo(FormView):
    form_class=UploadForm
    template_name='converter/post.html'

    def form_valid(self, form):
        form.save()
        xmlUrl='media/' + str(UploadedFile.objects.last().fileurl)
        u = Unidad(xmlUrl)
        fname = u.getZipFileName()
        response = HttpResponse(open(fname, 'rb'), content_type='application/zip')
        response['Content-Disposition'] = 'attachment; filename="%s"' % fname
        return response
