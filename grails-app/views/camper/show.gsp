
<%@ page import="camp.Camper" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camper.label', default: 'Camper')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-camper" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-camper" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list camper">
			
				<g:if test="${camperInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="camper.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${camperInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="camper.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${camperInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.documents}">
				<li class="fieldcontain">
					<span id="documents-label" class="property-label"><g:message code="camper.documents.label" default="Documents" /></span>
					
						<span class="property-value" aria-labelledby="documents-label"><g:fieldValue bean="${camperInstance}" field="documents"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.personAddress}">
				<li class="fieldcontain">
					<span id="personAddress-label" class="property-label"><g:message code="camper.personAddress.label" default="Person Address" /></span>
					
						<span class="property-value" aria-labelledby="personAddress-label"><g:link controller="address" action="show" id="${camperInstance?.personAddress?.id}">${camperInstance?.personAddress?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.mobileNumber}">
				<li class="fieldcontain">
					<span id="mobileNumber-label" class="property-label"><g:message code="camper.mobileNumber.label" default="Mobile Number" /></span>
					
						<span class="property-value" aria-labelledby="mobileNumber-label"><g:fieldValue bean="${camperInstance}" field="mobileNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.homeNumber}">
				<li class="fieldcontain">
					<span id="homeNumber-label" class="property-label"><g:message code="camper.homeNumber.label" default="Home Number" /></span>
					
						<span class="property-value" aria-labelledby="homeNumber-label"><g:fieldValue bean="${camperInstance}" field="homeNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="camper.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${camperInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.boardAttendance}">
				<li class="fieldcontain">
					<span id="boardAttendance-label" class="property-label"><g:message code="camper.boardAttendance.label" default="Board Attendance" /></span>
					
						<span class="property-value" aria-labelledby="boardAttendance-label"><g:link controller="board" action="show" id="${camperInstance?.boardAttendance?.id}">${camperInstance?.boardAttendance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.camperGrade}">
				<li class="fieldcontain">
					<span id="camperGrade-label" class="property-label"><g:message code="camper.camperGrade.label" default="Camper Grade" /></span>
					
						<span class="property-value" aria-labelledby="camperGrade-label"><g:link controller="grade" action="show" id="${camperInstance?.camperGrade?.id}">${camperInstance?.camperGrade?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${camperInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="camper.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${camperInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:camperInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${camperInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
