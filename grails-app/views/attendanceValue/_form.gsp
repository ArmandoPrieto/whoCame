<%@ page import="attendance.AttendanceValue" %>



<div class="fieldcontain ${hasErrors(bean: attendanceValueInstance, field: 'time', 'error')} ">
	<label for="time">
		<g:message code="attendanceValue.time.label" default="Time" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: attendanceValueInstance, field: 'attendance', 'error')} required">
	<label for="attendance">
		<g:message code="attendanceValue.attendance.label" default="Attendance" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="attendance" name="attendance.id" from="${attendance.Attendance.list()}" optionKey="id" required="" value="${attendanceValueInstance?.attendance?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendanceValueInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="attendanceValue.value.label" default="Value" />
		
	</label>
	<g:checkBox name="value" value="${attendanceValueInstance?.value}" />

</div>

