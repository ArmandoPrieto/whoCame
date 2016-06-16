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
		
  			<h1>Attendance details</h1>
  			<g:link controller="main" action="checkAttendanceGrade" params="[id:personGrade.id, personType:personType]" data-icon="back" >Go back</g:link>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		
		
		<h2>${person.name}, ${personGrade}</h2>
		<g:each in="${weeks}" var="week">
		<p>${week.key}</p>
		<table data-role="table" id="my-table" data-mode="reflow" class="ui-responsive">
		  
		      <thead>
		       
  			 	<tr>
  			 	  <g:each in="${week.value}" var="date">
		          <th class="ui-table-cell-visible" style="max-width:50px;"><abbr title=""><g:formatDate format="EEE, MMM d" date="${date.toDate()}"/></abbr></th>
		           </g:each>
		       
		        </tr>
			 </thead>
		      <tbody>
		       
		     
		        <tr>
		        
		        <g:each in="${week.value}" var="date">
		       
		        <g:if test="${attendanceDetail[date] == true}">
		           <td class="ui-table-priority-2 ui-table-cell-visible green">
		        </g:if>
		        <g:else>
		           <td class="ui-table-priority-2 ui-table-cell-visible red">
		        </g:else>
		           <b class="ui-table-cell-label"><g:formatDate format="EEE, MMM d" date="${date.toDate()}"/></b>
		           ${attendanceDetail[date]?"YES":"NO"}
		        </td>
		           
		           
		         </g:each>
		         </tr>
		     
		      </tbody>
	   		</table>
	   	 </g:each>
		</div>
		
		<div data-role="footer" data-position="fixed">
			
  		</div>
	</div>
</body>
</html>