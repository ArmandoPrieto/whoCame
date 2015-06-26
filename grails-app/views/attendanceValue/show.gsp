
<%@ page import="attendance.AttendanceValue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendanceValue.label', default: 'AttendanceValue')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attendanceValue" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-attendanceValue" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attendanceValue">
			
				<g:if test="${attendanceValueInstance?.time}">
				<li class="fieldcontain">
					<span id="time-label" class="property-label"><g:message code="attendanceValue.time.label" default="Time" /></span>
					
						<span class="property-value" aria-labelledby="time-label"><g:fieldValue bean="${attendanceValueInstance}" field="time"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceValueInstance?.attendance}">
				<li class="fieldcontain">
					<span id="attendance-label" class="property-label"><g:message code="attendanceValue.attendance.label" default="Attendance" /></span>
					
						<span class="property-value" aria-labelledby="attendance-label"><g:link controller="attendance" action="show" id="${attendanceValueInstance?.attendance?.id}">${attendanceValueInstance?.attendance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceValueInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="attendanceValue.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:formatBoolean boolean="${attendanceValueInstance?.value}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:attendanceValueInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${attendanceValueInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
