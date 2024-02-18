<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>codi_fitxa</title>
            </head>
            <body>
                <table width="90%" height="40px" border="1px" cellpadding="2px" cellspacing="0px" bgcolor="#b9cbf9">
                    <tbody>
                    <xsl:for-each select="/Taller_XML/minerals">
                        <xsl:if test="nom = 'URANINITA'">
                            <tr>
                                <td width="25%" height="35"><b>MINERAL</b></td>
                                <td width="25%"><xsl:value-of select="nom"/></td>
                                <td width="25%"><xsl:value-of select="composicio"/></td>
                                <td><b>Grup: </b><xsl:value-of select="grup"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                    </tbody>
                </table>
                <br />
                <table width="90%" border="1px" cellpadding="4px" cellspacing="0px">
                    <tbody>
                    <xsl:for-each select="/Taller_XML/minerals">
                    <xsl:if test="nom = 'URANINITA'">
                        <tr>
                            <td bgcolor="#b9cbf9" width="50%"><b>Densitat: </b><xsl:value-of select="densitat"/></td>
                            <td rowspan="3" bgcolor="#d0ddfb">
                                <img border="0px" width="244px" height="158px" style="display:block;margin-left:auto;margin-right:auto;"> <xsl:attribute name="src"> <xsl:value-of select="foto"/> </xsl:attribute> </img>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#b9cbf9"><b>Duresa: </b><xsl:value-of select="duressa"/></td>
                        </tr>
                        <tr>
                            <td bgcolor="#b9cbf9"><b>Color: </b><xsl:value-of select="color"/></td>
                        </tr>
                    </xsl:if>
                    </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
