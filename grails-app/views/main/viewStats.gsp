<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
	
	 <link rel="stylesheet" href="https://rawgithub.com/arschmitz/jquery-mobile-datepicker-wrapper/v0.1.1/jquery.mobile.datepicker.css" />
	 <script src="https://rawgithub.com/jquery/jquery-ui/1.10.4/ui/jquery.ui.datepicker.js"></script>
    <script id="mobile-datepicker" src="https://rawgithub.com/arschmitz/jquery-mobile-datepicker-wrapper/v0.1.1/jquery.mobile.datepicker.js"></script>
  	
</head>
<body>

	<script>
			$( document ).ready(function() {
			
			});
			
	</script>
	
	<g:set var="theme" value="a" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
		
  			<h1>whoCame Stats</h1>
  			<g:link controller="main" action="mainBoard" data-icon="back" >Go back</g:link>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		<div class="ui-body ui-body-a ui-corner-all" style="margin-bottom:5px;">
			  			<p>
			  			<h2>Campers: ${campersAttendance}, Counselors: ${counselorsAttendance}</h2>
						<h2>Total: ${campersAttendance+counselorsAttendance}</h2> 	
     					 </p>
					</div>
		
<%--		
	<div data-role="popup" id="table-column-toggle-popup" class="ui-table-columntoggle-popup">
  <fieldset data-role="controlgroup">
    <label>Grade<input type="checkbox" checked data-cacheval="false" locked="true"></input></label>
    <label>Campers<input type="checkbox" checked data-cacheval="false" locked="true"></input></label>
    <label>Counselors<input type="checkbox" checked data-cacheval="false" locked="true"></input></label>
   
    
  </fieldset>
</div> 
<a href="#table-column-toggle-popup" class="ui-table-columntoggle-btn ui-btn ui-btn-b ui-corner-all ui-shadow ui-mini" data-rel="popup">Columns...</a>

--%>
<%-- <table data-role="table" id="table-column-toggle" data-mode="columntoggle" data-enhanced="true" class="ui-table ui-table-columntoggle" data-column-btn-theme="b">	
		--%>
		
			<table data-role="table" id="my-table" data-mode="reflow" class="ui-responsive table-stroke">
		  
		      <thead>
		        <tr>
		          <th data-priority="1" data-colstart="1" class="ui-table-cell-visible">Grade</th>
		         <th data-priority="1" data-colstart="4" class="ui-table-cell-visible centerText borderLeft" colspan=1 >Total Check In</th>
  			
		          <th data-priority="1" data-colstart="2" class="ui-table-cell-visible centerText borderLeft" colspan=4>Campers</th>
  				  <th data-priority="1" data-colstart="3" class="ui-table-cell-visible centerText borderLeft" colspan=4 >Counselors</th>
  				 	</tr>
  			 	<tr>
		          <th data-priority="1" data-colstart="1" class="ui-table-cell-visible"></th>
		             <th data-priority="1" data-colstart="4" class="ui-table-cell-visible"><abbr title="T# C+C">Total# C+C</abbr></th>
		       
		          <th data-priority="1" data-colstart="2" class="ui-table-cell-visible borderLeft"><abbr title="CheckIn">Check In</abbr></th>
		          <th data-priority="1" data-colstart="3" class="ui-table-cell-visible"><abbr title="CheckOut">Check Out</abbr></th>
		          <th data-priority="1" data-colstart="3" class="ui-table-cell-visible"><abbr title="Atte Percent">Attendance Percent</abbr></th>
		          <th data-priority="1" data-colstart="3" class="ui-table-cell-visible"><abbr title="T# Campers">Total# Campers</abbr></th>
		          <th data-priority="1" data-colstart="3" class="ui-table-cell-visible borderLeft"><abbr title="CheckIn">Check In</abbr></th>
		          <th data-priority="1" data-colstart="3" class="ui-table-cell-visible"><abbr title="CheckOut">Check Out</abbr></th>
		          <th data-priority="1" data-colstart="3" class="ui-table-cell-visible"><abbr title="Atte Percent">Attendance Percent</abbr></th>
		          <th data-priority="1" data-colstart="3" class="ui-table-cell-visible"><abbr title="T# Counselors">Total# Counselors</abbr></th>
		         
		        </tr>
			 </thead>
		      <tbody>
		       <g:each in="${gradeStats}">
		        <tr>
		          <th class="ui-table-priority-2 ui-table-cell-visible">${it.gradeName}</th>
		            <td class="ui-table-priority-2 ui-table-cell-visible">${it.campersCheckIn+it.counselorsCheckIn}</td>
		    
		          <td class="ui-table-priority-2 ui-table-cell-visible">${it.campersCheckIn}</td>
		          <td class="ui-table-priority-2 ui-table-cell-visible">${it.campersCheckOut}</td>
		           <td class="ui-table-priority-2 ui-table-cell-visible">${it.totalCampers!=0?(it.campersCheckIn*100).intdiv(it.totalCampers):0}%</td>
		           <td class="ui-table-priority-2 ui-table-cell-visible">${it.totalCampers}</td>
		          <td class="ui-table-priority-2 ui-table-cell-visible" >${it.counselorsCheckIn}</td>
		          <td class="ui-table-priority-2 ui-table-cell-visible">${it.counselorsCheckOut}</td>
		           <td class="ui-table-priority-2 ui-table-cell-visible">${it.totalCounselors!=0?(it.counselorsCheckIn*100).intdiv(it.totalCounselors):0}%</td>
		        <td class="ui-table-priority-2 ui-table-cell-visible">${it.totalCounselors}</td>
		         </tr>
		      </g:each>
		      </tbody>
	   		</table>
		</div>
		
		<div data-role="footer" data-position="fixed">
			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		</div>
	</div>
</body>
</html>