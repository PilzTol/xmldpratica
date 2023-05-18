<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:for-each select="Movies/Movie">
      <xsl:sort select="Title/@runtime" data-type="number"/>
      <xsl:variable name="range" select="floor(Title/@runtime div 100)"/>
      <xsl:if test="not(preceding-sibling::Movie[floor(Title/@runtime div 100) = $range])">
        <ul data-range="{concat($range * 100, '-', ($range + 1) * 100 - 1)}" data-count="{count(following-sibling::Movie[floor(Title/@runtime div 100) = $range]) + 1}">
          <xsl:for-each select=". | following-sibling::Movie[floor(Title/@runtime div 100) = $range]">
            <xsl:sort select="Title/@runtime" data-type="number"/>
            <xsl:apply-templates select="."/>
          </xsl:for-each>
        </ul>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="Movie">
    <li data-runtime="{Title/@runtime}">
      <xsl:value-of select="Title"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
