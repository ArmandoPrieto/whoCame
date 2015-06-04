
<%@ page import="camp.HeadCounselor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'headCounselor.label', default: 'HeadCounselor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-headCounselor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-headCounselor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="gender" title="${message(code: 'headCounselor.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="birthDate" title="${message(code: 'headCounselor.birthDate.label', default: 'Birth Date')}" />
					
						<th><g:message code="headCounselor.personAddress.label" default="Person Address" /></th>
					
						<g:sortableColumn property="mobileNumber" title="${message(code: 'headCounselor.mobileNumber.label', default: 'Mobile Number')}" />
					
						<g:sortableColumn property="homeNumber" title="${message(code: 'headCounselor.homeNumber.label', default: 'Home Number')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'headCounselor.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${headCounselorInstanceList}" status="i" var="headCounselorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${headCounselorInstance.id}">${fieldValue(bean: headCounselorInstance, field: "gender")}</g:link></td>
					
						<td><g:formatDate date="${headCounselorInstance.birthDate}" /></td>
					
						<td>${fieldValue(bean: headCounselorInstance, field: "personAddress")}</td>
					
						<td>${fieldValue(bean: headCounselorInstance, field: "mobileNumber")}</td>
					
						<td>${fieldValue(bean: headCounselorInstance, field: "homeNumber")}</td>
					
						<td>${fieldValue(bean: headCounselorInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${headCounselorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
