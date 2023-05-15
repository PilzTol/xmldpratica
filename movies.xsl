<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h2>My CD Collection</h2>
<table>
                    <tr>
                        <th>Classificação indicativa</th>
                        <th>Filme</th>
                    </tr>
                        <tr>
                            <td>
                                 <xsl:apply-templates select="Movies/Movie[@rating='G']"/>      
                            </td>
                        </tr>
                </table>           
</body>
</html>

</xsl:template>
<xsl:template match="Movie">
    <select>
      <xsl:value-of select="Title"/>
    </select>
</xsl:template>
</xsl:stylesheet>
