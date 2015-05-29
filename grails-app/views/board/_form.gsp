<%@ page import="attendance.Board" %>



<div class="fieldcontain ${hasErrors(bean: boardInstance, field: 'attendanceRecords', 'error')} ">
	<label for="attendanceRecords">
		<g:message code="board.attendanceRecords.label" default="Attendance Records" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${boardInstance?.attendanceRecords?}" var="a">
    <li><g:link controller="attendance" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="attendance" action="create" params="['board.id': boardInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'attendance.label', default: 'Attendance')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: boardInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="board.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${demographic.Person.list()}" optionKey="id" required="" value="${boardInstance?.person?.id}" class="many-to-one"/>

</div>

