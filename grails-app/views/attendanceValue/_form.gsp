<%@ page import="attendance.AttendanceValue" %>



<div class="fieldcontain ${hasErrors(bean: attendanceValueInstance, field: 'time', 'error')} ">
	<label for="time">
		<g:message code="attendanceValue.time.label" default="Time" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: attendanceValueInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="attendanceValue.value.label" default="Value" />
		
	</label>
	<g:checkBox name="value" value="${attendanceValueInstance?.value}" />

</div>

