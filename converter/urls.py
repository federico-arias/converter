from converter.views import Cepillo
from django.conf.urls import include, url

urlpatterns = [
    url(r'', Cepillo.as_view(), name='cepillo'),
]
