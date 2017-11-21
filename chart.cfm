<!doctype html>
<html>
	<head>
		<title>
			Chart Sample
		</title>
	</head>
	<body>
	<!---<cfchart  format="jpg" chartwidth="400" chartheight="300" xaxistitle="Name" yaxistitle="Age" yaxistype="scale" xaxistype="category" >
		<cfchartseries  type="Bar" seriescolor="##ff9933" paintstyle="plain" >
			<cfchartdata item="Pravin" value="54" />
			<cfchartdata item="Daksha" value="49" />
			<cfchartdata item="Ami" value="18" />
		</cfchartseries>
	</cfchart>--->

<style type="text/css">
* { font-size: 12px;}

.table-wrapper { 
    overflow-x:scroll;
    overflow-y:visible;
    width:1000px;
    margin-left: 150px;
}


td, th {
    padding: 5px 15px;
    width: 50px;
    min-width: 50px;
}

th:first-child {
    position: fixed;
    left: 105px;
    width: 120px;
}
</style>
<cfset rowCnt=20/>
<cfset colCnt=25/>
<h1>HEADER</h1>
<div style="padding-left: 100px; padding-top: 100px;">
	<div class="table-wrapper">
	  <table border="1" cellpadding="5" cellspacing="0">
	    <thead>
	      <tr>
	        <th>&nbsp;</th>
	        <cfloop index="cx" from="1" to="#colCnt#">
	        	<cfoutput><td style="background-color:##cfcfcf; color:##fff;">Col #cx#</td></cfoutput>
	        </cfloop>
	      </tr>
	    </thead>
	    <tbody>
	      <cfloop index="rx" from="1" to="#rowCnt#">
	      	<cfset bkColor="white"/>
	      	<cfif (rx %2) eq 0>
	      		<cfset bkColor="##cfcfcf"/>
	      	</cfif>
	      	<tr>
	      		<cfoutput><th style="background-color:#bkColor#">Row #rx#</th></cfoutput>
	      		<cfloop index="cx" from="1" to="#colCnt#">
		        	<cfoutput><td>R#rx# C#cx#</td></cfoutput>
	      		</cfloop>
	      	</tr>
	      </cfloop>
	    </tbody>
	  </table>
	</div>
</div>

<h1>FOOTER</h1>
</body>
</html>
