
<%@ page import="camp.CounselorTeam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'counselorTeam.label', default: 'CounselorTeam')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-counselorTeam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-counselorTeam" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list counselorTeam">
			
				<g:if test="${counselorTeamInstance?.counselors}">
				<li class="fieldcontain">
					<span id="counselors-label" class="property-label"><g:message code="counselorTeam.counselors.label" default="Counselors" /></span>
					
						<g:each in="${counselorTeamInstance.counselors}" var="c">
						<span class="property-value" aria-labelledby="counselors-label"><g:link controller="counselor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${counselorTeamInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="counselorTeam.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:link controller="grade" action="show" id="${counselorTeamInstance?.grade?.id}">${counselorTeamInstance?.grade?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorTeamInstance?.headCounselor}">
				<li class="fieldcontain">
					<span id="headCounselor-label" class="property-label"><g:message code="counselorTeam.headCounselor.label" default="Head Counselor" /></span>
					
						<span class="property-value" aria-labelledby="headCounselor-label"><g:link controller="headCounselor" action="show" id="${counselorTeamInstance?.headCounselor?.id}">${counselorTeamInstance?.headCounselor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:counselorTeamInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${counselorTeamInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
