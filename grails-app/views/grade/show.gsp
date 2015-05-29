
<%@ page import="camp.Grade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grade.label', default: 'Grade')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-grade" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-grade" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list grade">
			
				<g:if test="${gradeInstance?.team}">
				<li class="fieldcontain">
					<span id="team-label" class="property-label"><g:message code="grade.team.label" default="Team" /></span>
					
						<span class="property-value" aria-labelledby="team-label"><g:link controller="counselorTeam" action="show" id="${gradeInstance?.team?.id}">${gradeInstance?.team?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradeInstance?.campers}">
				<li class="fieldcontain">
					<span id="campers-label" class="property-label"><g:message code="grade.campers.label" default="Campers" /></span>
					
						<g:each in="${gradeInstance.campers}" var="c">
						<span class="property-value" aria-labelledby="campers-label"><g:link controller="camper" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${gradeInstance?.gradeName}">
				<li class="fieldcontain">
					<span id="gradeName-label" class="property-label"><g:message code="grade.gradeName.label" default="Grade Name" /></span>
					
						<span class="property-value" aria-labelledby="gradeName-label"><g:fieldValue bean="${gradeInstance}" field="gradeName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:gradeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${gradeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
