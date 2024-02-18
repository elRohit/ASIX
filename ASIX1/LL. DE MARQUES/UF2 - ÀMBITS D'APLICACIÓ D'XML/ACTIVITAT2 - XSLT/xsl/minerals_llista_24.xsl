<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
    <table cellspacing="0">
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
        <tr>
            <xsl:apply-templates select="Id"/>
            <xsl:apply-templates select="nom"/>
            <xsl:apply-templates select="duressa"/>
            <xsl:apply-templates select="densitat"/>
            <xsl:apply-templates select="composicio"/>
            <xsl:apply-templates select="color"/>
            <xsl:apply-templates select="grup"/>
        </tr>
        </xsl:for-each>
    </table>
</body>
</html>
</xsl:template>

<xsl:template match="Id">
    <td bgcolor="#F26A6A"><font color="black"><xsl:value-of select="."/></font></td>
</xsl:template>

<xsl:template match="nom">
    <td bgcolor="#FFA500"><font color="black"><xsl:value-of select="."/></font></td>
</xsl:template>

<xsl:template match="duressa">
    <td bgcolor="#5ACEF3"><font color="black"><xsl:value-of select="."/></font></td>
</xsl:template>

<xsl:template match="densitat">
    <td bgcolor="#F3EE5A"><font color="black"><xsl:value-of select="."/></font></td>
</xsl:template>

<xsl:template match="composicio">
    <td bgcolor="#E27AF7"><font color="black"><xsl:value-of select="."/></font></td>
</xsl:template>

<xsl:template match="color">
    <td bgcolor="#FCB857"><font color="black"><xsl:value-of select="."/></font></td>
</xsl:template>

<xsl:template match="grup">
    <td bgcolor="#9BD34F"><font color="black"><xsl:value-of select="."/></font></td>
</xsl:template>

</xsl:stylesheet>