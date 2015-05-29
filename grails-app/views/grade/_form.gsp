<%@ page import="camp.Grade" %>



<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'team', 'error')} ">
	<label for="team">
		<g:message code="grade.team.label" default="Team" />
		
	</label>
	<g:select id="team" name="team.id" from="${camp.CounselorTeam.list()}" optionKey="id" value="${gradeInstance?.team?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'campers', 'error')} ">
	<label for="campers">
		<g:message code="grade.campers.label" default="Campers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${gradeInstance?.campers?}" var="c">
    <li><g:link controller="camper" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="camper" action="create" params="['grade.id': gradeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'camper.label', default: 'Camper')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: gradeInstance, field: 'gradeName', 'error')} required">
	<label for="gradeName">
		<g:message code="grade.gradeName.label" default="Grade Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="gradeName" from="${gradeInstance.constraints.gradeName.inList}" required="" value="${gradeInstance?.gradeName}" valueMessagePrefix="grade.gradeName"/>

</div>

