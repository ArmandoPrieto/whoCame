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
  		<a id="saveRecords" data-icon="gear" class="ui-btn-right" data-theme="${theme}">Options</a>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		<h1>campers: ${campersAttendance} counselors: ${counselorsAttendance}</h1>
		
		
		
		
			<table data-role="table" id="my-table" data-mode="reflow" class="ui-responsive table-stroke">
		  
		      <thead>
		        <tr>
		          <th>Grade</th>
		          <th colspan="4" class="centerText borderLeft">Campers</th>
  				  <th colspan="4" class="centerText borderLeft">Counselors</th>
  				</tr>
  				<tr>
		          <th></th>
		          <th class="borderLeft"><abbr title="CheckIn">Check In</abbr></th>
		          <th><abbr title="CheckOut">Check Out</abbr></th>
		          <th><abbr title="Atte Percent">Attendance Percent</abbr></th>
		          <th><abbr title="T# Campers">Total# Campers</abbr></th>
		          <th class="borderLeft"><abbr title="CheckIn">Check In</abbr></th>
		          <th><abbr title="CheckOut">Check Out</abbr></th>
		          <th><abbr title="Atte Percent">Attendance Percent</abbr></th>
		        	<th><abbr title="T# Counselors">Total# Counselors</abbr></th>
		          
		        </tr>
  			 </thead>
		      

		     
		      <tbody>
		        
		       <g:each in="${gradeStats}">
		        <tr>
		          <th >${it.gradeName}</th>
		          <td class="borderLeft">${it.campersCheckIn}</td>
		          <td>${it.campersCheckOut}</td>
		           <td>${it.totalCampers!=0?(it.campersCheckIn*100).intdiv(it.totalCampers):0}%</td>
		           <td>${it.totalCampers}</td>
		          <td class="borderLeft">${it.counselorsCheckIn}</td>
		          <td>${it.counselorsCheckOut}</td>
		           <td>${it.totalCounselors!=0?(it.counselorsCheckIn*100).intdiv(it.totalCounselors):0}%</td>
		        <td>${it.totalCounselors}</td>
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