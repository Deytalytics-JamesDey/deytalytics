<?xml version="1.0" encoding="UTF-8" ?>

<html xmlns:iso20022="urn:iso:std:iso:20022:2013:ecore" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<body>
<h1 id="idx">Index</h1>

<xsl:for-each select="iso20022:Repository/dataDictionary/topLevelDictionaryEntry[@xsi:type='iso20022:BusinessComponent']">
    <xsl:sort select="@name" order="ascending" />
    <a href="#{@name}"> <xsl:value-of select="@name"/> </a>
    <br></br>
</xsl:for-each>

<xsl:for-each select="iso20022:Repository/dataDictionary/topLevelDictionaryEntry[@xsi:type='iso20022:BusinessComponent']">
    <h1 id="{@name}">Business Component: <xsl:value-of select="@name"/></h1>
    <a href="#idx">Return to index</a>
    <h2>Definition</h2>
    <xsl:value-of select="@definition"/>
    <h2>Business Elements</h2>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th {
	background-color: gray;
	color: white;
   }
</style>
    <table>
	<tr>
		<th>Name</th>
		<th>Definition</th>
		<th>Datatype</th>
		<th>MinOccurs</th>
		<th>MaxOccurs</th>
	</tr>
    <xsl:for-each select="./element[@xsi:type='iso20022:BusinessAttribute']">
        <tr>
		<td><xsl:value-of select="@name"/></td>
		<td><xsl:value-of select="@definition"/></td>
		<td><xsl:value-of select="@datatype"/></td>
		<td><xsl:value-of select="@minOccurs"/></td>
		<td><xsl:value-of select="@maxOccurs"/></td>
	</tr>
    </xsl:for-each>
    </table>
</xsl:for-each>
</body>
</html>
