
<%@ page import="demographic.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-person" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="gender" title="${message(code: 'person.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="birthDate" title="${message(code: 'person.birthDate.label', default: 'Birth Date')}" />
					
						<th><g:message code="person.personAddress.label" default="Person Address" /></th>
					
						<g:sortableColumn property="mobileNumber" title="${message(code: 'person.mobileNumber.label', default: 'Mobile Number')}" />
					
						<g:sortableColumn property="homeNumber" title="${message(code: 'person.homeNumber.label', default: 'Home Number')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'person.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "gender")}</g:link></td>
					
						<td><g:formatDate date="${personInstance.birthDate}" /></td>
					
						<td>${fieldValue(bean: personInstance, field: "personAddress")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "mobileNumber")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "homeNumber")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
