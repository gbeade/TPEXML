<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	
		<head>
			<title>Climate Processing</title>
			<link href="TPE.css" rel="stylesheet" type="text/css"/>

		</head>

	<xsl:if test="count(./results/error)=1">
		<body>
			<h1>Error: <xsl:value-of select="./results/error"/></h1>
		</body>
	</xsl:if>
	<xsl:if test="count(./results/error)=0">
		<body>
			<h2>Weather status on <xsl:value-of select="count(//city)"/> cities around the world</h2>
			<xsl:for-each select="./results/country">
				<xsl:call-template name="GenerarTabla">
					<xsl:with-param name="country" select="."/>
				</xsl:call-template>
				<br/>
				<br/>
			</xsl:for-each>
		</body>
	</xsl:if>	
	</html>

</xsl:template>



	<xsl:template name="GenerarTabla">
		<xsl:param name="country"/>
		<h3>Weather on <xsl:value-of select="count($country//city)"/> Cities of <xsl:value-of select="$country/name"/></h3>

		<table width="80%" border="1px">
			        <tr style="background-color: #d1ac9b">
          				<td>City</td>
	       	        		<td>Temperature</td>
            				<td>Feels Like</td>
            				<td>Humidity</td>
            				<td>Pressure</td>
            				<td>Clouds</td>
            				<td>Weather</td>
            				<td>Symbol</td>
       				 </tr>
				<xsl:for-each select="$country/cities/city">
					<tr>
          					<td><xsl:value-of select="./name"/></td>
	       	        			<td><xsl:value-of select="./temperature"/><xsl:text> </xsl:text><xsl:value-of select="./temperature/@unit"/></td>
            					<td><xsl:value-of select="./feels_like"/><xsl:text> </xsl:text><xsl:value-of select="./feels_like/@unit"/></td>
            					<td><xsl:value-of select="./humidity"/><xsl:text> </xsl:text><xsl:value-of select="./humidity/@unit"/></td>
            					<td><xsl:value-of select="./pressure"/><xsl:text> </xsl:text><xsl:value-of select="./pressure/@unit"/></td>
            					<td><xsl:value-of select="./clouds"/></td>
            					<td><xsl:value-of select="./weather"/></td>
						<xsl:variable name="imagen"><xsl:value-of select="./weather/@icon"/></xsl:variable>
            					<td><img src="http://openweathermap.org/img/wn/{$imagen}@2x.png" width="50px"/></td>
       					 </tr>
				</xsl:for-each>
		</table>
					
		
	</xsl:template>



</xsl:stylesheet>
