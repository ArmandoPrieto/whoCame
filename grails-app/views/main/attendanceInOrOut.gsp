<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		<style>
	
	
	</style>
</head>
<body>

	<script>
			$( document ).ready(function() {
			
			});
			
	</script>
	
	<g:set var="theme" value="a" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
		
  			<h1>whoCame ${grade.gradeName}</h1>
  		<a id="saveRecords" data-icon="gear" class="ui-btn-right" data-theme="${theme}">Options</a>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		<g:form action="takeRoll" id="${grade.id}" method="get">
      	
		<fieldset data-role="controlgroup">
			  <legend>Take attendance for:</legend>
			  <input type="radio" name="personType" id="radio-choice-1" value="camper" checked="checked">
			  <label for="radio-choice-1">Campers</label>
			 
			  <input type="radio" name="personType" id="radio-choice-2" value="counselor">
			  <label for="radio-choice-2">Counselors</label>
			 
			  <input type="radio" name="personType" id="radio-choice-3" value="headStaff">
			  <label for="radio-choice-3">Head Staff</label>
			 
			  
		</fieldset>
		<fieldset data-role="controlgroup">
			<legend>Attendance type:</legend>
			  <input type="radio" name="type" id="radio-choice-4" value="checkIn" checked="checked">
			  <label for="radio-choice-4">Check In</label>
			 
			  <input type="radio" name="type" id="radio-choice-5" value="checkOut">
			  <label for="radio-choice-5">Check Out</label>
			 
		</fieldset>
			<input type="submit" value="Take Roll">
		</g:form>
		
		
		
		
			
		</div>
		
		<div data-role="footer" data-position="fixed">
			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		</div>
	</div>
</body>
</html>