<?xml version='1.0'?>
<xsl:stylesheet 
	   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
       xmlns:fo="http://www.w3.org/1999/XSL/Format"
       version="1.0"> 

<xsl:import href="../docbook-xsl-1.77.1/fo/docbook.xsl" />
<xsl:import href="myTitlePage.xsl" />

<xsl:param name="paper.type" select="'A4'" />
<xsl:param name="fop1.extensions" select="1" />
<xsl:param name="generate.toc" select="'book toc,title'"/>

<xsl:param name="default.image.width" select="125" />


<xsl:param name="callout.graphics.path" select="'./common/images/callouts/'" />
<xsl:param name="admon.graphics" select="1" />
<xsl:param name="admon.graphics.extension" select="'.png'" />
<xsl:param name="admon.graphics.path" select="'./common/images/'" />

<xsl:param name="body.font.family" select="'Helvetica'" />
<xsl:param name="title.font.family" select="'Helvetica'" />
<xsl:param name="root.font.family" select="'Helvetica'" />
<xsl:param name="monospace.font.family" select="'Courier'"/>
<xsl:param name="insert.xref.page.number" select="1" />
<xsl:param name="column.count.front" select="2"/>
<xsl:param name="next.itemsymbol" select="'bullet'" />

<xsl:param name="header.rule" select="1"/>

<xsl:param name="hyphenate">false</xsl:param>

<xsl:param name="glossary.as.blocks" select="1" />
<xsl:param name="glossterm.seperation" select=".1" />
<xsl:param name="glossterm.width" select="1.5" /> 

<xsl:param name="shade.verbatim" select="1"/>
<xsl:param name="hyphenate.verbatim" select="0"/>

<xsl:param name="chapter.autolabel" select="1"/>

<!-- Gets rid of span errors such as WARNING: span="inherit" on fo:block when Index is used   
    https://issues.apache.org/bugzilla/show_bug.cgi?id=45070 -->
<xsl:attribute-set name="component.title.properties">
   <!-- Use 'none' here  -->
  <xsl:attribute name="span">none</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="header.content.properties">
  <xsl:attribute name="font-family">Helvetica</xsl:attribute>
  <xsl:attribute name="font-style">italic</xsl:attribute>
  <xsl:attribute name="font-size">9pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="footer.content.properties">
  <xsl:attribute name="font-family">Helvetica</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
  <xsl:attribute name="font-size">9pt</xsl:attribute>
</xsl:attribute-set>

<!--     start page count at beginning -->
<xsl:template name="initial.page.number">auto</xsl:template>
<xsl:template name="page.number.format">
	<xsl:param name="element" select="local-name(.)" />
	<xsl:choose>
		<xsl:when test="$element = 'toc'">1</xsl:when>
		<xsl:when test="$element = 'preface'">1</xsl:when>
		<xsl:when test="$element = 'dedication'">1</xsl:when>
		<xsl:otherwise>1</xsl:otherwise>
	</xsl:choose>
</xsl:template>

 <!--     simple/ general customizations for PDF titlepage --> 
<xsl:attribute-set name="book.titlepage.recto.style">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="font-size">40pt</xsl:attribute>  
  <xsl:attribute name="text-align">right</xsl:attribute>
  <xsl:attribute name="color">#000000</xsl:attribute>
</xsl:attribute-set>   

<!--     other first page material --> 
<xsl:template match="title" mode="chapter.titlepage.recto.auto.mode">  
	<!--     display "chapter" on chapter start page --> 
	<fo:block color="#0B486B"
		xsl:use-attribute-sets="chapter.titlepage.recto.style" 
		margin-left="{$title.margin.left}" 
		font-size="20pt" 
		text-align="right">
		<xsl:call-template name="gentext">
			<xsl:with-param name="key" select="'chapter'"/>
		</xsl:call-template>
	</fo:block>
	<!--     display number of chapter on chapter start page -->
	<fo:block color="#0B486B"
		xsl:use-attribute-sets="chapter.titlepage.recto.style" 
		margin-left="{$title.margin.left}" 
		font-size="120pt" 
		text-align="right">
		<xsl:apply-templates select=".." mode="label.markup"/>
	</fo:block>
	<!--     display chapter name on chapter start page -->
	<fo:block color="#0B486B" xmlns:fo="http://www.w3.org/1999/XSL/Format" 
		xsl:use-attribute-sets="chapter.titlepage.recto.style" 
		margin-left="{$title.margin.left}" 
		font-size="24.8832pt" 
		font-weight="bold" 
		padding-before="80pt"
		space-after="30pt"
		text-align="right"
		border-bottom-style="solid"
		border-bottom-width="3pt"
		border-bottom-color="#0B486B"
		font-family="{$title.font.family}">    
 <!-- removes "chapter 1" from title page    
 	<xsl:call-template name="gentext">
  	<xsl:with-param name="key" select="'chapter'"/>
</xsl:call-template>
<xsl:text> </xsl:text>
<xsl:apply-templates select=".." mode="label.markup"/> -->
<fo:block>
	<xsl:apply-templates select="." mode="title.markup"/>
</fo:block>
</fo:block>
</xsl:template>

<xsl:template match="title" mode="appendix.titlepage.recto.auto.mode">  
	<fo:block color="#0B486B"
		xsl:use-attribute-sets="chapter.titlepage.recto.style" 
		margin-left="{$title.margin.left}" 
		font-size="20pt" 
		text-align="right">
		<xsl:call-template name="gentext">
			<xsl:with-param name="key" select="'appendix'"/>
		</xsl:call-template>
	</fo:block>
	<fo:block color="#0B486B"
		xsl:use-attribute-sets="chapter.titlepage.recto.style" 
		margin-left="{$title.margin.left}" 
		font-size="120pt" 
		text-align="right">
		<xsl:apply-templates select=".." mode="label.markup"/>
	</fo:block>
	<fo:block color="#0B486B" xmlns:fo="http://www.w3.org/1999/XSL/Format" 
		xsl:use-attribute-sets="appendix.titlepage.recto.style" 
		margin-left="{$title.margin.left}" 
		font-size="24.8832pt" 
		font-weight="bold" 
		text-align="right"
		border-bottom-style="solid"
		border-bottom-width="3pt"
		border-bottom-color="#0B486B"
		font-family="{$title.font.family}">    
		<fo:block>
			<xsl:apply-templates select="." mode="title.markup"/>
		</fo:block>
	</fo:block>
</xsl:template>

<!--     customizations for PDF sections title output -->
<xsl:attribute-set name="section.title.properties">
	<xsl:attribute name="font-family">
		<xsl:value-of select="$title.font.family"/>
	</xsl:attribute>
	<xsl:attribute name="font-weight">normal</xsl:attribute>
	<!-- font size is calculated dynamically by section.heading template -->
	<xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
	<xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
	<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
	<xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level1.properties">
	<xsl:attribute name="font-weight">bold</xsl:attribute>
	<xsl:attribute name="font-style">normal</xsl:attribute>
	<xsl:attribute name="border-bottom">0.5pt solid black</xsl:attribute>
	<xsl:attribute name="font-size">
		<xsl:value-of select="$body.font.master * 1.8"/>
		<xsl:text>pt</xsl:text>
	</xsl:attribute> 
	<xsl:attribute name="padding-top">6pt</xsl:attribute>
	<xsl:attribute name="padding-bottom">3pt</xsl:attribute>
</xsl:attribute-set>   

<xsl:attribute-set name="section.title.level2.properties">
	<xsl:attribute name="border-style">none</xsl:attribute>
	<xsl:attribute name="border-width">0</xsl:attribute>
	<!-- <xsl:attribute name="background-color">#cecfff</xsl:attribute>
	    <xsl:attribute name="padding">0.3em</xsl:attribute>  -->
	<xsl:attribute name="font-style">normal</xsl:attribute>
	<xsl:attribute name="font-weight">bold</xsl:attribute>
	<xsl:attribute name="font-size">
		<xsl:value-of select="$body.font.master * 1.4"/>
		<xsl:text>pt</xsl:text>
	</xsl:attribute>  
</xsl:attribute-set> 

<xsl:attribute-set name="section.title.level3.properties">
	<xsl:attribute name="border-after-style">solid</xsl:attribute>
	<xsl:attribute name="border-after-width">0</xsl:attribute>
	<xsl:attribute name="font-weight">bold</xsl:attribute>
	<xsl:attribute name="font-style">normal</xsl:attribute>
	<xsl:attribute name="font-size">
		<xsl:value-of select="$body.font.master * 1.2"/>
		<xsl:text>pt</xsl:text>
	</xsl:attribute>  
	<xsl:attribute name="start-indent">.3in</xsl:attribute>     
	<xsl:attribute name="end-indent">.3in</xsl:attribute>
</xsl:attribute-set> 

<!--     verbatim style   &#x25BA; or &#x2D; -->
<xsl:attribute-set name="monospace.verbatim.properties" 
	use-attribute-sets="verbatim.properties monospace.properties">
	<xsl:attribute name="wrap-option">wrap</xsl:attribute>
	<xsl:attribute name="hyphenation-character">&#x2D;</xsl:attribute>
	<xsl:attribute name="font-size">
		<xsl:value-of select="$body.font.master * .75"/>
		<xsl:text>pt</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="border-color">#9C9893</xsl:attribute>
	<xsl:attribute name="border-style">solid</xsl:attribute>
	<xsl:attribute name="border-width">thin</xsl:attribute>
	<xsl:attribute name="padding">0.3em</xsl:attribute>
</xsl:attribute-set>

 <!--     table style  -->
 <xsl:template name="table.cell.block.properties">
  <!-- highlight text in table head -->
  <xsl:if test="ancestor::thead">
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="color">white</xsl:attribute>
  </xsl:if>
 </xsl:template>
  
 <xsl:template name="table.cell.properties">
  <!-- background color for table head -->
  <xsl:choose>
    <xsl:when test="ancestor::thead">
      <xsl:attribute name="background-color">darkgrey</xsl:attribute>
      <xsl:attribute name="padding">0.3em</xsl:attribute>
    </xsl:when>
  </xsl:choose>
  
  <!-- highlight alternate row text in table -->
 <xsl:variable name="rownumber">
   <xsl:number count="row" from="tbody"/>
 </xsl:variable>
    <xsl:if test="$rownumber mod 2 = 0">
      <xsl:attribute name="background-color">lightgrey</xsl:attribute>
    </xsl:if>
    <!-- borders for everything in table 
    <xsl:attribute name="border-top">0.5pt solid green</xsl:attribute>
    <xsl:attribute name="border-bottom">0.5pt solid green</xsl:attribute>
    <xsl:attribute name="border-left">0.5pt solid green</xsl:attribute>
    <xsl:attribute name="border-right">0.5pt solid green</xsl:attribute> -->
</xsl:template>

  <!-- change text color and background in table -->
<xsl:attribute-set name="table.table.properties">
<xsl:attribute name="color">black</xsl:attribute>
 <xsl:attribute name="background-color">#EEEEEE</xsl:attribute>
 </xsl:attribute-set>
 
  <!-- aligns table titles -->
<xsl:attribute-set name="formal.title.properties">
  <xsl:attribute name="text-align">
    <xsl:choose>
      <xsl:when test="self::table">left</xsl:when>
      <xsl:otherwise>left</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!--     admonition styles -->
<xsl:attribute-set name="admonition.title.properties">
	<xsl:attribute name="border-style">solid</xsl:attribute>
	<xsl:attribute name="border-width">.1mm</xsl:attribute>
	<xsl:attribute name="border-bottom">0pt solid</xsl:attribute>
	<xsl:attribute name="border-color">
		<xsl:choose>
			<xsl:when test="self::note">#483D8B</xsl:when>
			<xsl:when test="self::tip">#00FF00</xsl:when>
			<xsl:when test="self::caution">#FF9933</xsl:when>
			<xsl:when test="self::warning">#DC143C</xsl:when>
		</xsl:choose>
	</xsl:attribute>
	    <xsl:attribute name="padding">0.35em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="admonition.properties">
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-width">.1mm</xsl:attribute>
    <xsl:attribute name="border-top">0pt solid</xsl:attribute>
  <xsl:attribute name="border-color">
      <xsl:choose>
      <xsl:when test="self::note">#483D8B</xsl:when>
      <xsl:when test="self::tip">#00FF00</xsl:when>
      <xsl:when test="self::caution">#FF9933</xsl:when>
      <xsl:when test="self::warning">#DC143C</xsl:when>
        </xsl:choose>
  </xsl:attribute>
  <!-- <xsl:attribute name="background-color">
      <xsl:choose>
      <xsl:when test="self::note">#B0E0E6</xsl:when>
      <xsl:when test="self::tip">#CCFFCC</xsl:when>
      <xsl:when test="self::caution">#FFFFCC</xsl:when>
      <xsl:when test="self::warning">#FFCCFF</xsl:when>
        </xsl:choose>
  </xsl:attribute>-->
    <xsl:attribute name="padding">0.5em</xsl:attribute>
    <xsl:attribute name="font-style">italic</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
 </xsl:attribute-set> 

<!--     add company logo where corpname appears for 1st PDF titlepages -->   
<xsl:template match="corpname" mode="book.titlepage.recto.mode">
    <fo:block text-align="right" padding-before="20pt">
      <fo:external-graphic content-width="50%" content-height="50%" scaling="uniform" src="url(../images/logo_corp.png)"/>
        </fo:block>
      <fo:inline color="black">
        <xsl:apply-templates mode="titlepage.mode"/>
      </fo:inline>
</xsl:template>        

<!--     add software logo where product name appears for 2nd PDF titlepages -->    
<xsl:template match="productname" mode="book.titlepage.verso.mode">
    <fo:block text-align="center" padding-before="15pt">
      <fo:external-graphic content-width="50%" content-height="50%" scaling="uniform" src="url(../images/logo_soft.png)"/>
        </fo:block>
      <fo:inline>
        <xsl:apply-templates mode="titlepage.mode"/>
      </fo:inline>
</xsl:template>     
                
<!--     add company logo where corpname appears for 2nd PDF titlepages -->   
<xsl:template match="corpname" mode="book.titlepage.verso.mode">
    <fo:block text-align="left" padding-before="30pt">
      <fo:external-graphic content-width="50%" content-height="50%" scaling="uniform" src="url(../images/logo_corp.png)"/>
        </fo:block>
      <fo:inline color="black">
        <xsl:apply-templates mode="titlepage.mode"/>
      </fo:inline>
</xsl:template>       


<!--     add front cover page  --> 
<xsl:template name="front.cover">
  <xsl:call-template name="page.sequence">
    <xsl:with-param name="master-reference">titlepage</xsl:with-param>
    <xsl:with-param name="content">
      <fo:block text-align="center">
        <fo:external-graphic src="url(../images/cover_image.png)" content-width="7cm"/>
      </fo:block>
      <fo:block page-break-before="always"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!--     add back cover page  --> 
<xsl:template name="back.cover">
  <xsl:call-template name="page.sequence">
    <xsl:with-param name="master-reference">titlepage</xsl:with-param>
    <xsl:with-param name="content">
      <fo:block text-align="center">
        <fo:external-graphic src="url(../images/cover_image.png)" content-width="7cm"/>
      </fo:block>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

 </xsl:stylesheet>