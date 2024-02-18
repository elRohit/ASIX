<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <table cellspacing="0"  >
    <tr bgcolor = "#82CCD2">
        <th style="text-align:left">Id</th>
        <th style="text-align:left">Nom</th>
        <th style="text-align:left">Duressa</th>
        <th style="text-align:left">Densitat</th>
        <th style="text-align:left">Composicio</th>
        <th style="text-align:left">Color</th>
        <th style="text-align:left">Grup</th>
    </tr>
    <xsl:for-each select="/Taller_XML/minerals">
    <xsl:sort select="grup" order="ascending"/>
    <xsl:sort select="/Id" order="descending"/>
        <xsl:choose>
            <xsl:when test="color='Groc'">        
            <tr bgcolor="yellow">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:when test="color='Vermell'">        
            <tr bgcolor="Red">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:when test="color='Blau'">        
            <tr bgcolor="Blue">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:when test="color='verd'">
            <tr bgcolor="Green">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:when test="color='gris'">
            <tr bgcolor="Gray">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:when test="color='negre'">
            <tr bgcolor="Black">
                <td style="color: white"><xsl:value-of select="Id"/></td>
                <td style="color: white"><xsl:value-of select="nom"/></td>
                <td style="color: white"><xsl:value-of select="duressa"/></td>
                <td style="color: white"><xsl:value-of select="densitat"/></td>
                <td style="color: white"><xsl:value-of select="composicio"/></td>
                <td style="color: white"><xsl:value-of select="color"/></td>
                <td style="color: white"><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:when test="color='Blanc'">
            <tr bgcolor="White">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:when test="color='rosa'">
            <tr bgcolor="Pink">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:when>
            <xsl:otherwise>
            <tr bgcolor="#989DE5">
                <td><xsl:value-of select="Id"/></td>
                <td><xsl:value-of select="nom"/></td>
                <td><xsl:value-of select="duressa"/></td>
                <td><xsl:value-of select="densitat"/></td>
                <td><xsl:value-of select="composicio"/></td>
                <td><xsl:value-of select="color"/></td>
                <td><xsl:value-of select="grup"/></td>
            </tr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>