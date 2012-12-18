<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:f="http://docbook.org/xslt/ns/extension"
                xmlns:mp="http://docbook.org/xslt/ns/mode/private"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
		exclude-result-prefixes="db f mp xs"
                version="2.0">

<!-- This stylesheet attempts to preserve the logical structure of an XML document -->

<!-- This may be the first in a series of transformations. Because
     only the first document in a series of transformations has
     (guaranteed) access to the original base URI and any declarations
     provided in an internal or external subset, this stylesheet simply
     provides an xml:base attribute and replaces all entityref
     attributes with fileref. -->

<xsl:output method="xml" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>

<xsl:template match="/">
  <xsl:sequence select="f:explicit-logical-structure(/)"/>
</xsl:template>

<xsl:function name="f:explicit-logical-structure" as="document-node()">
  <xsl:param name="root" as="document-node()"/>
  <xsl:apply-templates select="$root" mode="mp:justcopy"/>
</xsl:function>

<xsl:template match="/" mode="mp:justcopy">
  <xsl:copy>
    <xsl:apply-templates mode="mp:justcopy"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="/*[1]" priority="2" mode="mp:justcopy">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:if test="not(@xml:base)">
      <xsl:attribute name="xml:base" select="base-uri(.)"/>
    </xsl:if>
    <xsl:apply-templates mode="mp:justcopy"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="db:imagedata[@entityref]
                     |db:textdata[@entityref]
		     |db:videodata[@entityref]
                     |db:audiodata[@entityref]" mode="mp:justcopy">
  <xsl:copy>
    <xsl:copy-of select="@*[node-name(.) != xs:QName('entityref')]"/>
    <xsl:if test="@entityref">
      <xsl:attribute name="fileref">
        <xsl:value-of select="unparsed-entity-uri(@entityref)"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates mode="mp:justcopy"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="*" mode="mp:justcopy">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="mp:justcopy"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="comment()|processing-instruction()|text()"
	      mode="mp:justcopy">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
