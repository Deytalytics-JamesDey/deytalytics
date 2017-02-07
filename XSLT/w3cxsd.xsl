<?xml version="1.0" encoding="UTF-8" ?>

<html xmlns:xmi="http://www.omg.org/XMI" xmlns:xs="http://www.w3.org/2001/XMLSchema" xsl:version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<body>
<h1 id="idx">Index</h1>

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

<h2>Complex Types</h2>
<xsl:for-each select="xs:schema/xs:complexType">
    <xsl:sort select="@name" order="ascending" />
    <a href="#{@name}"> <xsl:value-of select="@name"/> </a>
    <br></br>
</xsl:for-each>

<h2>Simple Types</h2>
<xsl:for-each select="xs:schema/xs:simpleType">
    <xsl:sort select="@name" order="ascending" />
    <a href="#{@name}"> <xsl:value-of select="@name"/> </a>
    <br></br>
</xsl:for-each>

<xsl:for-each select="xs:schema/xs:complexType">

    <h1 id="{@name}">ComplexType: <xsl:value-of select="@name"/></h1>
    <a href="#idx">Return to index</a>
    <h2>Definition</h2>
    <xsl:value-of select="./xs:annotation/xs:documentation"/>

    <xsl:if test="./xs:choice">
    <h2>Message Elements</h2>

    <table>
	<tr>
		<th>Name</th>
		<th>Definition</th>
		<th>Datatype</th>
	</tr>
	<xsl:for-each select="./xs:choice/xs:element">
        <tr>
		<td><xsl:value-of select="@name"/></td>
		<td><xsl:value-of select="./xs:annotation/xs:documentation"/></td>
		<td><a href="#{@type}"> <xsl:value-of select="@type"/></a></td>
	</tr>

        </xsl:for-each>
    </table>
    </xsl:if>

    <xsl:if test="./xs:sequence">
    <h2>Message Elements</h2>

    <table>
	<tr>
		<th>Name</th>
		<th>Definition</th>
		<th>Datatype</th>
		<th>MinOccurs</th>
		<th>MaxOccurs</th>
	</tr>
	<xsl:for-each select="./xs:sequence/xs:element">
        <tr>
		<td><xsl:value-of select="@name"/></td>
		<td><xsl:value-of select="./xs:annotation/xs:documentation"/></td>
		<td><a href="#{@type}"> <xsl:value-of select="@type"/></a></td>
		<td><xsl:value-of select="@minOccurs"/></td>
		<td><xsl:value-of select="@maxOccurs"/></td>
	</tr>

        </xsl:for-each>
    </table>
    </xsl:if>
</xsl:for-each>

<xsl:for-each select="xs:schema/xs:simpleType">

    <h1 id="{@name}">SimpleType: <xsl:value-of select="@name"/></h1>
    <a href="#idx">Return to index</a>
    <h2>Definition</h2>
    <xsl:value-of select="./xs:annotation/xs:documentation"/>

    <xsl:if test="./xs:restriction/@base='xs:string'">
    <p>
    <b>Datatype:</b> <xsl:value-of select="./xs:restriction/@base"/>
    <br></br>
    <b>Pattern:</b>  <xsl:value-of select="./xs:restriction/xs:pattern/@value"/>
    <br></br>
    <b>Minimum Length:</b>  <xsl:value-of select="./xs:restriction/xs:minLength/@value"/>
    <br></br>
    <b>Maximum Length:</b>  <xsl:value-of select="./xs:restriction/xs:maxLength/@value"/>
    </p> 
    </xsl:if>

    <xsl:if test="./xs:restriction/@base='xs:decimal'">
    <p>
    <b>Datatype:</b> <xsl:value-of select="./xs:restriction/@base"/>
    <br></br>
    <b>Total digits:</b>  <xsl:value-of select="./xs:restriction/xs:totalDigits/@value"/>
    <br></br>
    <b>Fraction digits:</b>  <xsl:value-of select="./xs:restriction/xs:fractionDigits/@value"/>
    </p> 
    </xsl:if>

    <xsl:if test="./xs:restriction/xs:enumeration">
    <h2>Codes</h2>

    <table>
	<tr>
		<th>Code</th>
		<th>Name</th>
		<th>Definition</th>
	</tr>
	<xsl:for-each select="./xs:restriction/xs:enumeration">
        <tr>
		<td><xsl:value-of select="@value"/></td>
		<td><xsl:value-of select="./xs:annotation/xs:documentation[@source='Name']"/></td>
		<td><xsl:value-of select="./xs:annotation/xs:documentation[@source='EnhancedDefinition']"/></td>
	</tr>

        </xsl:for-each>
    </table>
    </xsl:if>
</xsl:for-each>


</body>
</html>
