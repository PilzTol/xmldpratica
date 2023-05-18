<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:key name="movies-by-rating" match="Movie" use="@rating"/>
    <xsl:template match="/">
        <table border="1">
            <thead>
                <tr>
                    <th>Rating</th>
                    <th>Title</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//Movie[count(. | key('movies-by-rating', @rating)[1]) = 1]">
                    <xsl:sort select="@rating"/>
                    <xsl:variable name="current-rating" select="@rating"/>
                    <xsl:for-each select="key('movies-by-rating', $current-rating)">
                        <xsl:sort select="Title"/>
                        <tr>
                            <xsl:if test="position() = 1">
                                <td rowspan="{count(key('movies-by-rating', $current-rating))}">
                                    <xsl:value-of select="$current-rating"/>
                                </td>
                            </xsl:if>
                            <td><xsl:value-of select="Title"/></td>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>
