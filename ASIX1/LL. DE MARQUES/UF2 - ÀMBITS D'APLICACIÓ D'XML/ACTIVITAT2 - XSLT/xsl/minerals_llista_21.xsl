<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <table cellspacing="0">
    <tr bgcolor = "#d4e3e8">
      <th style="text-align:center; padding-right:0.3cm">Id</th>
      <th style="text-align:center;">Nom</th>
      <th style="text-align:center;">Duressa</th>
      <th style="text-align:center;">Densitat</th>
      <th style="text-align:center;">Composicio</th>
      <th style="text-align:center;">Color</th>
      <th style="text-align:center;">Grup</th>
    </tr>
    <xsl:for-each select="/Taller_XML/minerals">
      <xsl:sort select="Id" order="ascending"/>
      <xsl:sort select="grup" order="descending"/>
      
        <tr bgcolor = "#d4e3e8">
          <td><xsl:value-of select="Id"/></td>
          <td><xsl:value-of select="nom"/></td>
          <td><xsl:value-of select="duressa"/></td>
          <td><xsl:value-of select="densitat"/></td>
          <td><xsl:value-of select="composicio"/></td>
          <td><xsl:value-of select="color"/></td>
          <td><xsl:value-of select="grup"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
