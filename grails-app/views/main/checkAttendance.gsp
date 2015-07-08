<%@ page import="camp.Camper" %>
<%@ page import="camp.Counselor" %>
<%@ page import="camp.Grade" %>
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
	<g:set var="grades" value="${Grade.findAll()}" />
	<g:set var="theme" value="a" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
			<g:link controller="main" action="mainBoard" data-icon="back" >Go back</g:link>
  			<h1>whoCame ${grade.gradeName}</h1>
  		
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		<g:form action="checkAttendanceGrade" id="${grade.id}" method="get" >
      	
		<fieldset data-role="controlgroup">
			  <legend>Check attendance for:</legend>
			  <input type="radio" name="personType" id="radio-choice-1" value="camper" checked="checked">
			  <label for="radio-choice-1">Campers</label>
			 
			  <input type="radio" name="personType" id="radio-choice-2" value="counselor">
			  <label for="radio-choice-2">Counselors</label>
			 <sec:ifAnyGranted roles="ROLE_HEAD_MASTER,ROLE_SUPER_USER">
			 
			 	
			 
			 	<div class="ui-field-contain">
				 <label for="gradeOption">Grade:</label>
	   			  <select name="gradeOption" id="gradeOption" data-native-menu="false">
				    <g:each in="${grades}">
				      <option value="${it.id}">${it.gradeName}</option>
				    </g:each>  
				    </select>
				</div>
			 
			 </sec:ifAnyGranted>
			 
			 
			
			 
			  
		</fieldset>
		
			<input type="submit" value="Check">
		</g:form>
		
		
		
		
			
		</div>
		
		<div data-role="footer" data-position="fixed">
			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		</div>
	</div>
</body>
</html>