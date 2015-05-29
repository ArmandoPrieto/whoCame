
<%@ page import="attendance.Attendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'attendance.label', default: 'Attendance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-attendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-attendance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list attendance">
			
				<g:if test="${attendanceInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="attendance.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:fieldValue bean="${attendanceInstance}" field="date"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.board}">
				<li class="fieldcontain">
					<span id="board-label" class="property-label"><g:message code="attendance.board.label" default="Board" /></span>
					
						<span class="property-value" aria-labelledby="board-label"><g:link controller="board" action="show" id="${attendanceInstance?.board?.id}">${attendanceInstance?.board?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.checkIn}">
				<li class="fieldcontain">
					<span id="checkIn-label" class="property-label"><g:message code="attendance.checkIn.label" default="Check In" /></span>
					
						<span class="property-value" aria-labelledby="checkIn-label"><g:link controller="attendanceValue" action="show" id="${attendanceInstance?.checkIn?.id}">${attendanceInstance?.checkIn?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${attendanceInstance?.checkOut}">
				<li class="fieldcontain">
					<span id="checkOut-label" class="property-label"><g:message code="attendance.checkOut.label" default="Check Out" /></span>
					
						<span class="property-value" aria-labelledby="checkOut-label"><g:link controller="attendanceValue" action="show" id="${attendanceInstance?.checkOut?.id}">${attendanceInstance?.checkOut?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:attendanceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${attendanceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
