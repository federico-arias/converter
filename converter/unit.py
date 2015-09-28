from lxml import etree
from django.conf import settings
from slugify import slugify
import shutil, os, sys

def slug(context, s):
    return slugify(s.encode('utf-8', 'ignore').decode('utf-8', 'ignore'))

class Unidad:
    def __init__(self, filename):
        self.stylesheet = os.path.join(settings.MEDIA_ROOT, 'minsal.xsl')
        self.filename = filename
        self.folder = os.path.join(settings.MEDIA_ROOT, 'test')
        if os.path.exists(self.folder): 
            shutil.rmtree(self.folder)
        shutil.copytree(os.path.join(settings.MEDIA_ROOT, 'vendor'), self.folder)

        self.xml = etree.parse(self.filename)
        self.url=[]
        self.url.append(self.xml.xpath('/temas/meta[1]/courseurl')[0].text)
        self.url.append(self.xml.xpath('/temas/meta[1]/bibliotecaurl')[0].text)
        self.url.append(self.xml.xpath('/temas/meta[1]/course')[0].text)
        self.parse_xml()

    def parse_xml(self):
        temas = self.xml.xpath('/temas/tema')
        ns = etree.FunctionNamespace("urn:federico")
        ns.prefix = 'f'
        ns['slugify'] = slug
        stylesheet = etree.parse(self.stylesheet)
        transform = etree.XSLT(stylesheet)
        for tema in temas:
            self.create_files(tema, transform)

    def create_files(self, node, xslt):
        node = etree.ElementTree(node)
        inicio=etree.XSLT.strparam(self.url[0])
        biblio=etree.XSLT.strparam(self.url[1])
        curso=etree.XSLT.strparam(self.url[2])
        webpage = xslt(node,\
                inicio=inicio,\
                biblio=biblio, \
                curso=curso) 
        name = self.slug(node.find('filename').text)
        webpage.write(os.path.join(self.folder, name + '.html'))

    def getZipFileName(self):
        fname = shutil.make_archive(os.path.join(os.path.dirname(self.folder), self.filename), 'zip', os.path.dirname(self.folder), base_dir=self.folder)
        shutil.rmtree(self.folder)
        os.remove(self.filename)
        return fname

    def slug(self, s):
        return slugify(s.encode('utf-8', 'ignore').decode('utf-8', 'ignore'))
