<%@ page import="camp.CounselorTeam" %>



<div class="fieldcontain ${hasErrors(bean: counselorTeamInstance, field: 'counselors', 'error')} ">
	<label for="counselors">
		<g:message code="counselorTeam.counselors.label" default="Counselors" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${counselorTeamInstance?.counselors?}" var="c">
    <li><g:link controller="counselor" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="counselor" action="create" params="['counselorTeam.id': counselorTeamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'counselor.label', default: 'Counselor')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: counselorTeamInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="counselorTeam.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="grade" name="grade.id" from="${camp.Grade.list()}" optionKey="id" required="" value="${counselorTeamInstance?.grade?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorTeamInstance, field: 'headCounselor', 'error')} ">
	<label for="headCounselor">
		<g:message code="counselorTeam.headCounselor.label" default="Head Counselor" />
		
	</label>
	<g:select id="headCounselor" name="headCounselor.id" from="${camp.HeadCounselor.list()}" optionKey="id" value="${counselorTeamInstance?.headCounselor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

