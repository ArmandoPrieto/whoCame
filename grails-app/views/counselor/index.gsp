
<%@ page import="camp.Counselor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'counselor.label', default: 'Counselor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-counselor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-counselor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="gender" title="${message(code: 'counselor.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="birthDate" title="${message(code: 'counselor.birthDate.label', default: 'Birth Date')}" />
					
						<th><g:message code="counselor.personAddress.label" default="Person Address" /></th>
					
						<g:sortableColumn property="mobileNumber" title="${message(code: 'counselor.mobileNumber.label', default: 'Mobile Number')}" />
					
						<g:sortableColumn property="homeNumber" title="${message(code: 'counselor.homeNumber.label', default: 'Home Number')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'counselor.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${counselorInstanceList}" status="i" var="counselorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${counselorInstance.id}">${fieldValue(bean: counselorInstance, field: "gender")}</g:link></td>
					
						<td><g:formatDate date="${counselorInstance.birthDate}" /></td>
					
						<td>${fieldValue(bean: counselorInstance, field: "personAddress")}</td>
					
						<td>${fieldValue(bean: counselorInstance, field: "mobileNumber")}</td>
					
						<td>${fieldValue(bean: counselorInstance, field: "homeNumber")}</td>
					
						<td>${fieldValue(bean: counselorInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${counselorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
