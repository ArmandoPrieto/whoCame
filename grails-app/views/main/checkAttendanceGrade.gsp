<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		
</head>
<body>

	
	
	<div id="pageRoll" data-role="page"  data-theme="a">
		
		<div data-role="header" data-position="fixed">
		<g:link controller="main" action="mainBoard" data-icon="delete" >Cancel</g:link>
  			<h1>${personType} ${grade.gradeName}</h1>
  		<%--<a href="#" id="checkAttendance" data-role="button" data-icon="check" >Check</a>
		 --%>
		</div>
		<div data-role="content" >
			
			<g:form id="attendanceForm" name="attendanceForm" controller="main" action="attendanceDetail">
			  <fieldset data-role="controlgroup" >

			 	<div data-role="controlgroup">
			
			 	<g:each in="${persons}">
			 	
				<g:link style="text-align: left;" data-icon="arrow-r" data-iconpos="right" class="attendance" action="attendanceDetail" id="${it.id}" data-role="button">${it.name}</g:link>   
				</g:each>
			</div>
			    </fieldset>
			
			</g:form>
			
		</div>
		<div data-role="footer" data-position="fixed">
		
  			
  		
		</div>
	</div>
</body>
</html>