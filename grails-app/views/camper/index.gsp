
<%@ page import="camp.Camper" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camper.label', default: 'Camper')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-camper" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-camper" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'camper.name.label', default: 'Name')}" />
						<g:sortableColumn property="gender" title="${message(code: 'camper.gender.label', default: 'Gender')}" />
						<g:sortableColumn property="camperGrade" title="${message(code: 'camper.camperGrade.label', default: 'Grade')}" />
					
					
							
					</tr>
				</thead>
				<tbody>
				<g:each in="${camperInstanceList}" status="i" var="camperInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${camperInstance.id}">${fieldValue(bean: camperInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: camperInstance, field: "gender")}</td>
						<td>${fieldValue(bean: camperInstance, field: "camperGrade")}</td>
						
		
							
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${camperInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
