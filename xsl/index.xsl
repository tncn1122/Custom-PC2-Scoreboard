<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:decimal-format decimal-separator="." grouping-separator="," />

<xsl:template match="contestStandings">
    <HTML>
        <HEAD>
            <TITLE>Standing</TITLE>
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600&amp;display=swap&amp;subset=vietnamese" rel="stylesheet"/>
            <link rel="stylesheet" type="text/css" href="CSS/standings.css"/>
            <META HTTP-EQUIV="REFRESH" CONTENT="60;"/>
            <META HTTP-EQUIV="EXPIRES" CONTENT="0"/>
            <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE"/>
            <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE"/>
            <link rel="icon" href="img/favicon.png" type="image/png"/>
            <link rel="stylesheet" href="CSS/bootstrap.min.css"/>
            <link rel="stylesheet" href="CSS/style.css"/>
        </HEAD>
        <BODY>

        <!--================ Header    =================-->
            <header class="header_area">
                    <div class="main_menu">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <div>
                                <!-- Logo -->
                                <a class="navbar-brand logo_h" href="index.html"><img src="img/logo.svg" alt="" class="logo_pad"/></a>
                                <!-- Clock-->
                                <a class="nav-link navbar-nav  clock" style="float:right" id="countdown"></a>
                            </div>
                        </nav>
                    </div>
                </header>
        <!--================ Header    =================-->

        <!--================ Title     =================-->
        <div>
            <font face="verdana, arial, helvetica" align="right">           
                    <br/>
                    <br/>
                    <br/>
                    <div class="main_title"><h2><xsl:value-of select="/contestStandings/standingsHeader/@title"/></h2>
                        <p id = "status">Current Standing</p>
                    </div> 
            </font>
        </div>
        <!--================ Title     =================-->

        <!--================ Progress  =================-->
        <center>
            <div class="container">
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" id = "timeBar" style="width:0%"></div>
                </div>
            </div>
        </center>

        <!--================ Scoreboard =================-->
        <center class = "scoreboard">
            <div>
                <TABLE cellspacing="0">
                    <tr>
                        <th><strong>Rank</strong></th>
                        <th><strong>Name</strong></th>
                        <th><strong>Solved</strong></th>
                        <th><strong>Time</strong></th>
                        <xsl:call-template name="problemTitle"/>
                        <th><strong>Total att/solv</strong></th>
                    </tr>
                        <xsl:call-template name="teamStanding"/>
                        <xsl:call-template name="summary"/>
                </TABLE>
            </div>
        </center>
        <!--================ Scoreboard =================-->

        <!--================ Taik       =================-->
        <div class="tail">
            <span class="right">
            <A HREF="http://www.ecs.csus.edu/pc2/">PC^2 Homepage</A><br/>
            CSS by Duong Quoc Bao and tncnhan
            </span>
                Created by <A HREF="http://www.ecs.csus.edu/pc2">CSUS PC^2</A> version <xsl:value-of select="/contestStandings/standingsHeader/@systemVersion"/>
            <br/>
            Last updated
            <xsl:value-of select="/contestStandings/standingsHeader/@currentDate"/>
        </div>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/theme.js"></script>
        <script src="js/time.js"></script>
        </BODY>
        <!--================ Taik       =================-->
    </HTML>
</xsl:template>



<!-- =========================== Template ====================================  -->
<xsl:template name="summary">
    <xsl:for-each select="standingsHeader">
    <tr>
        <td></td>
        <td>Submitted/Total Accepted</td>
        <td></td>
        <td></td>
        <xsl:call-template name="problemsummary"/>
        <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@totalAttempts"/>/<xsl:value-of select="@totalSolved"/></td>
    </tr>
    </xsl:for-each>
</xsl:template>

<!-- <problemsummary attempts="246" bestSolutionTime="25" id="1" lastsolutionTime="283" numberSolved="81" title="A+ Consanguine Calculations"/> -->
<xsl:template name="problemsummary">
    <xsl:for-each select="/contestStandings/standingsHeader/problem">
        <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@attempts"/>/<xsl:value-of select="@numberSolved"/>
        </td>
    </xsl:for-each>
</xsl:template>

<xsl:template name="teamStanding">
    <xsl:for-each select="teamStanding">
		<!-- index is 0 based  header and 1st team seperated by colors -->
		<xsl:choose>
		    <xsl:when test="@index mod 2 = 0">
                <tr class="even">
                    <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@rank"/></td>
                    <td><xsl:attribute name="class">left</xsl:attribute><xsl:value-of select="@teamName"/></td>
                    <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@solved"/></td>
                    <td><xsl:attribute name="class">right</xsl:attribute><xsl:value-of select="@points"/></td>
                    <xsl:call-template name="problemSummaryInfo"/>
                    <!-- <teamStanding index="1" solved="8" problemsattempted="8" rank="1" score="1405" teamName="Warsaw University" timefirstsolved="13" timelastsolved="272" totalAttempts="19" userid="84" usersiteid="1"> -->
                    <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@totalAttempts"/>/<xsl:value-of select="@solved"/></td>
                </tr>
		    </xsl:when>

            <xsl:otherwise>
                <tr class="odd">
                    <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@rank"/></td>
                    <td><xsl:attribute name="class">left</xsl:attribute><xsl:value-of select="@teamName"/></td>
                    <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@solved"/></td>
                    <td><xsl:attribute name="class">right</xsl:attribute><xsl:value-of select="@points"/></td>
                        <xsl:call-template name="problemSummaryInfo"/>
                    <!-- <teamStanding index="1" solved="8" problemsattempted="8" rank="1" score="1405" teamName="Warsaw University" timefirstsolved="13" timelastsolved="272" totalAttempts="19" userid="84" usersiteid="1"> -->
                    <td><xsl:attribute name="class">center</xsl:attribute><xsl:value-of select="@totalAttempts"/>/<xsl:value-of select="@solved"/></td>
                </tr>
		    </xsl:otherwise>
		</xsl:choose>
    </xsl:for-each>
</xsl:template>

<!-- <problemSummaryInfo attempts="1" index="1" problemid="1" score="73" solutionTime="73"/> -->
<xsl:template name="problemSummaryInfo">
    <xsl:for-each select="problemSummaryInfo">
        <td><xsl:if test="@isSolved = 'true'">
            <xsl:variable name="solTime" select="@solutionTime"/>
            <xsl:variable name="pID" select="@index"/>
            <xsl:variable name="firstTime" select="/contestStandings/standingsHeader/problem[@id = $pID]/@bestSolutionTime"/>
            <xsl:choose>
                <xsl:when test="$solTime = $firstTime">
                    <xsl:attribute name="class">firstSolve</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="class">yes</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            </xsl:if>

            <xsl:if test="@isSolved = 'false' and @isPending = 'true'">
                <xsl:attribute name="class">pending</xsl:attribute></xsl:if>

            <xsl:if test="@isSolved = 'false' and @attempts &gt; '0' and @isPending = 'false'">
                <xsl:attribute name="class">no</xsl:attribute></xsl:if>

            <xsl:if test="@isSolved = 'false' and @attempts = '0' and @isPending = 'false'">
                <xsl:attribute name="class">center</xsl:attribute></xsl:if>

            <xsl:value-of select="@attempts"/>/<xsl:if test="@isSolved = 'false'">--</xsl:if>

            <xsl:if test="@isSolved = 'true'"><xsl:value-of select="@solutionTime"/></xsl:if>
        </td>
    </xsl:for-each>
</xsl:template>

<xsl:template name="problemTitle">
    <xsl:for-each select="/contestStandings/standingsHeader/problem">
        <th>&#160;&#160;&#160;&#160;<strong><xsl:number format="A" value="@id"/></strong>&#160;&#160;&#160;&#160;</th>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
