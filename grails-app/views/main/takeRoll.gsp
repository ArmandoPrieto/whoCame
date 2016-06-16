<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		
</head>
<body>

	
	
	<div id="pageRoll" data-role="page"  data-theme="a">
		
		<div data-role="header" data-position="fixed">
		<g:link controller="main" action="mainBoard" data-icon="delete" >Cancel</g:link>
  			<h1>${personType} ${attendanceType} ${grade.gradeName}</h1>
  		<a href="#" id="saveAttendance" data-role="button" data-icon="check" >Save</a>
		</div>
		<div data-role="content" >
			
			<%-- <div class="ui-body ui-body-a ui-corner-all" >
			  <p> ${attendanceType} for ${grade.gradeName}. <g:formatDate format="EEE, MMM d" date="${date}"/>.
			   </p>   
			</div>
			--%>
			
			<g:form id="attendanceForm" name="attendanceForm" controller="main" action="saveTakeRoll">
			<input type="hidden" value="${attendanceType}" name="attendanceType">
			<input type="hidden" value="${personType}" name="personType">
			  <fieldset data-role="controlgroup" >
			
			 	<g:each in="${persons}">
			      <label>
			      
			      <g:if test="${attendanceMap[it.id]}">
			       		<g:set var="check" value="${' checked '}" />
			      </g:if>
			      <g:else>
			      		 <g:set var="check" value="${' '}" />
			      </g:else>
			      
			      <input class="attendance" 
			      				type="checkbox" id="checkbox${it.id}" 
			      				name="checkbox-attendance"  
			      				value="${it.id}" 
			      				data-iconpos="right"
			      				${check}
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