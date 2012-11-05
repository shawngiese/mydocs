<?xml version='1.0'?>
<xsl:stylesheet 
	   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
       xmlns:fo="http://www.w3.org/1999/XSL/Format"
       version="1.0"> 

<xsl:import href="docbook-xsl-1.77.1/fo/docbook.xsl" />
<xsl:import href="myTitlePage.xsl" />

<xsl:param name="paper.type" select="'A4'" />
<xsl:param name="fop1.extensions" select="1" />

<xsl:param name="body.font.family" select="'Helvetica'" />
<xsl:param name="title.font.family" select="'Helvetica'" />
<xsl:param name="root.font.family" select="'Helvetica'" />
<xsl:param name="insert.xref.page.number" select="1" />
<xsl:param name="column.count.front" select="2"/>

<xsl:param name="hyphenate">false</xsl:param>

<xsl:param name="glossary.as.blocks" select="1" />
<xsl:param name="glossterm.seperation" select=".1" />
<xsl:param name="glossterm.width" select="1.5" /> 

<xsl:param name="shade.verbatim" select="0"/>
<xsl:param name="hyphenate.verbatim" select="0"/>

</xsl:stylesheet>