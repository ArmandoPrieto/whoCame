
<%@ page import="camp.CounselorTeam" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'counselorTeam.label', default: 'CounselorTeam')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-counselorTeam" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-counselorTeam" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="counselorTeam.grade.label" default="Grade" /></th>
					
						<th><g:message code="counselorTeam.headCounselor.label" default="Head Counselor" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${counselorTeamInstanceList}" status="i" var="counselorTeamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${counselorTeamInstance.id}">${fieldValue(bean: counselorTeamInstance, field: "grade")}</g:link></td>
					
						<td>${fieldValue(bean: counselorTeamInstance, field: "headCounselor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${counselorTeamInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
