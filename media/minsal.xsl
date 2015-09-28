<!--http://pimpmyxslt.com/articles/entity-tricks-part1/-->
<!DOCTYPE xsl:stylesheet [
    <!ENTITY node "node">
    ]>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:f="urn:federico"
extension-element-prefixes="f"
>

<xsl:param name="inicio"/>
<xsl:param name="biblio"/>
<xsl:param name="curso"/>

<xsl:output 
 method="html"
 doctype-system="about:legacy-compat"
 encoding="utf-8" 
 indent="yes"/>


<xsl:variable name="unit" select="/tema[1]/attribute::unit" />


<xsl:template match="node()|@*">
     <xsl:copy>
       <xsl:apply-templates/>
     </xsl:copy>
</xsl:template>

<!--<xsl:template match="p[normalize-space()=''|descendant::*[normalize-space()=''] and not(descendant::*[normalize-space()!=''])|normalize-space() = '\u0160']"/>-->
<xsl:template match="/tema">
    <html>
    <xsl:text disable-output-escaping="yes">
        &lt;!--[if lt IE 7]&gt;      &lt;html class="no-js lt-ie9 lt-ie8 lt-ie7"&gt; &lt;![endif]--&gt;
        &lt;!--[if IE 7]&gt;         &lt;html class="no-js lt-ie9 lt-ie8"&gt; &lt;![endif]--&gt;
        &lt;!--[if IE 8]&gt;         &lt;html class="no-js lt-ie9"&gt;
            &lt;link rel="stylesheet" href="css/ie8.css"&gt;
        &lt;![endif]--&gt;
        &lt;!--[if gt IE 8]&gt; &lt;html class="no-js"&gt; &lt;![endif]--&gt;
    </xsl:text>
    <head>
        <meta charset="utf-8" />
        <xsl:text disable-output-escaping="yes">&lt;!--[if IE]&gt;
            &lt;script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"&gt;&lt;/script&gt;
            &lt;style rel="stylesheet" href="styles/ie.css"/&gt;
        &lt;![endif]--&gt;</xsl:text>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <title><xsl:value-of select="$unit"/></title>

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css' />
            <link rel="stylesheet" href="css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico"  />
        <style>
           .nav .prev a,
           .nav .next a{
               display:block;
               width:49%;
               padding:15px;
               background-color:white;
               margin:10px 0;
           }
           .nav .prev a{
               float:left;
           }

           .nav .next a{
               float:right;
               text-align:right;
           }

           .nav .prev a:hover,
           .nav .next a:hover {
                background-color:#0F69B4;
                color:white;
           }
        </style>
    </head>
    <body class="page">
    <div id="menu-movil">
        <div class="wrap">
            <nav id="menu-principal">
                <xsl:apply-templates select="nav"/>
            </nav>
        </div>
    </div>

    <header style="background-image:url('img/bg-header.jpg')">
        <div class="wrap">

        	<h1 id="logo-main">
                <a href="/">
                    <img src="img/logo-main.png" />
                </a>
            </h1>

            <nav id="menu-principal">
                <xsl:apply-templates select="nav"/>
            </nav>

            <a href="#" id="menu-movil-trigger">Menú Principal</a>

        </div>
    </header>

	<div id="content">

		<div class="wrap">

			<div id="main">

				<div id="breadcrumbs">
					<ul>
                        <li>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$inicio" />
                                </xsl:attribute>
                                <xsl:value-of select="$curso" />
                            </a>
                        </li>
						<li class="sep">/</li>
                        <li><xsl:value-of select="$unit" /></li>
					</ul>
                    <div class="clearfix"><xsl:comment></xsl:comment> 
                    </div>
				</div>


				<div class="post">


					<div class="fontsize">
						<ul>
							<li class="small"><a data-size="10">a</a></li>
								<li class="medium current"><a data-size="15">a</a></li>
								<li class="large"><a data-size="20">a</a></li>
						</ul>
					</div>

                    <div class="clearfix"><xsl:comment></xsl:comment></div>

					<div class="texto">

                        <h3 class="title">
                            <xsl:value-of select="title"/>
                        </h3>
						<div class="contenido">
                            <xsl:text disable-output-escaping="yes">
                            &lt;!--[if lte IE 8]&gt; 
                            ¡Atención!. Tu navegador no está actualizado. Tiene conocidas fallas de seguridad y podría no mostrar todas las características de este y otros sitios web. 
                            </xsl:text>
                            <a href="https://browser-update.org/es/update.html">Aprende cómo puedes actualizar tu navegador</a>.
                            <xsl:text disable-output-escaping="yes">
                                &lt;![endif]--&gt;
                            </xsl:text>
                            <xsl:apply-templates select="content" />
						</div>
					</div>
                    <div class="clearfix"><xsl:comment></xsl:comment>
</div>
				</div>
                <div class="nav">
                    <xsl:apply-templates select="pie"/>
                </div>

			</div>

			<div id="sidebar">

				<div class="redes-lista">
					<h5 class="titulo-seccion">Recursos</h5>
					<ul>
						<li id="biblioteca">
                            <a class="clearfix" href="{$biblio}">
								<span class="icono"></span>
								<div class="texto">
									<span class="red">Biblioteca</span>
									<span class="usuario"></span>
								</div>
							</a>
						</li>
						<li id="inicio">
                            <a class="clearfix" href="{$inicio}">
								<div class="texto">
									<span class="red">Volver al inicio</span>
									<span class="usuario"></span>
								</div>
							</a>
						</li>
                        <div class="clearfix">  
<xsl:comment></xsl:comment>
                        </div>
					</ul>
				</div>


                <div class="clearfix"><xsl:comment></xsl:comment>
                </div>

			</div>

            <div class="clearfix"><xsl:comment></xsl:comment>
            </div>

		</div>

	</div>

    <div class="clearfix"><xsl:comment></xsl:comment>
    </div>

	<footer>
		<div class="wrap">

			<div class="bicolor">
				<span class="azul"></span>
				<span class="rojo"></span>
			</div>

            <div class="top">

                <div class="sep"></div>

            </div>

            <div class="bottom">

                <div class="left">
                </div>

                <nav>
                    <ul>
                    </ul>
                </nav>

                <div class="clearfix"><xsl:comment></xsl:comment>
                </div>

                <div class="bicolor">
					<span class="azul"></span>
					<span class="rojo"></span>
				</div>

            </div>

		</div>

	</footer>

    <script src="http://code.jquery.com/jquery-1.11.0.min.js"><xsl:comment></xsl:comment></script>
    <script type="text/javascript" src="js/main.js"><xsl:comment></xsl:comment></script>

    </body>
    </html>
</xsl:template>

<xsl:template match="title|module" mode="title">
        <xsl:value-of select="." />
</xsl:template>

<xsl:template match="nav">
        <ul id="menu-main-menu" class="menu-main">
            <xsl:apply-templates select="menu" />
        </ul>
</xsl:template>

<xsl:template match="menu">
    <xsl:apply-templates select="menu-item" />
</xsl:template>

<xsl:template match="menu-item">
    <li>
        <xsl:if test="submenu">
            <xsl:attribute name="class">
                <xsl:text>parent</xsl:text>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="attribute::active = 'yes'">
            <xsl:attribute name="class">
                <xsl:text>active</xsl:text>
            </xsl:attribute>
        </xsl:if>
        <xsl:if test="attribute::active = 'yes' and submenu">
            <xsl:attribute name="class">
                <xsl:text>active parent</xsl:text>
            </xsl:attribute>
        </xsl:if>
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="f:slugify(concat(attribute::module, string(./text())))" />
            </xsl:attribute>
            <xsl:value-of select="./text()" />
        </a>
            <xsl:apply-templates select="submenu" mode="submenu" />
    </li>
</xsl:template>

<xsl:template match="submenu" mode="submenu">
    <ul class="sub-menu">
        <xsl:apply-templates select="menu-item" mode="submenu" />
    </ul>
</xsl:template>

<xsl:template match="menu-item" mode="submenu">
    <li>
        <xsl:if test="attribute::active = 'yes'">
            <xsl:attribute name="class">
                <xsl:text>active</xsl:text>
            </xsl:attribute>
        </xsl:if>
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="f:slugify(concat(attribute::module, string(./text())))" />
            </xsl:attribute>
            <xsl:value-of select="./text()" />
        </a>
    </li>
</xsl:template>

<xsl:template match="content">
    <xsl:copy-of select="*|@*" />
</xsl:template>

<xsl:template match="pie">
    <div class="nav">
        <xsl:apply-templates select="prev" />
        <xsl:apply-templates select="next" />
    </div>
</xsl:template>

<xsl:template match="next">
    <div class="next">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="f:slugify(concat(attribute::module, string(.)))" />
            </xsl:attribute>
            <xsl:text>Siguiente»</xsl:text>
        </a> 
    </div>
</xsl:template>

<xsl:template match="prev">
    <div class="prev">
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="f:slugify(concat(attribute::module, string(.)))" />
            </xsl:attribute>
            <xsl:text>«Anterior</xsl:text>
        </a> 
    </div>
</xsl:template>

</xsl:stylesheet>
