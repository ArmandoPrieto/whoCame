<%@ page import="attendance.Attendance" %>



<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'date', 'error')} ">
	<label for="date">
		<g:message code="attendance.date.label" default="Date" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'board', 'error')} required">
	<label for="board">
		<g:message code="attendance.board.label" default="Board" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="board" name="board.id" from="${attendance.Board.list()}" optionKey="id" required="" value="${attendanceInstance?.board?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'checkIn', 'error')} required">
	<label for="checkIn">
		<g:message code="attendance.checkIn.label" default="Check In" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="checkIn" name="checkIn.id" from="${attendance.AttendanceValue.list()}" optionKey="id" required="" value="${attendanceInstance?.checkIn?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: attendanceInstance, field: 'checkOut', 'error')} required">
	<label for="checkOut">
		<g:message code="attendance.checkOut.label" default="Check Out" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="checkOut" name="checkOut.id" from="${attendance.AttendanceValue.list()}" optionKey="id" required="" value="${attendanceInstance?.checkOut?.id}" class="many-to-one"/>

</div>

