<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		
</head>
<body>

	<script>
			$( document ).ready(function() {
			//	$('.attendance').prop('checked', false).checkboxradio('refresh');

				   $("#saveRecords").click(function(){

				$("#attendanceForm").submit();
				 
				   });
			});
	</script>
	
	<div data-role="page"  data-theme="b">
		
		<div data-role="header" data-position="fixed">
		<a href="index.html" data-icon="delete" data-theme="c">Cancel</a>
  			<h1>${personType} ${attendanceType} ${grade.gradeName}</h1>
  		<a id="saveRecords" data-icon="check" data-theme="a">Save</a>
		</div>
		<div data-role="content" data-theme="a">
			
			<div class="ui-body ui-body-a ui-corner-all" >
			  <p> ${attendanceType} for ${grade}. <g:formatDate format="EEE, MMM d" date="${date}"/>.
			   </p>   
			</div>
			
			<g:form id="attendanceForm" name="attendanceForm" controller="attendance" action="saveTakeRoll">
			<input type="hidden" value="${attendanceType}" name="attendanceType">
			  <fieldset data-role="controlgroup" >
			 
			 	<g:each in="${persons}">
			      <label><input class="attendance" 
			      				type="checkbox" id="checkbox${it.id}" 
			      				name="checkbox-attendance"  
			      				value="${it.id}" 
			      				data-iconpos="right"
			      				checked="checked" 
			      				> ${it.name} </label>
			       
				</g:each>
			    </fieldset>
			
			</g:form>
			
		</div>
		<div data-role="footer" data-position="fixed">
		
  			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		
		</div>
	</div>
</body>
</html>