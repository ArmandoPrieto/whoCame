<%@ page import="camp.Camper" %>



<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="camper.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${camperInstance.constraints.gender.inList}" value="${camperInstance?.gender}" valueMessagePrefix="camper.gender" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="camper.birthDate.label" default="Birth Date" />
		
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${camperInstance?.birthDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'personAddress', 'error')} ">
	<label for="personAddress">
		<g:message code="camper.personAddress.label" default="Person Address" />
		
	</label>
	<g:select id="personAddress" name="personAddress.id" from="${demographic.Address.list()}" optionKey="id" value="${camperInstance?.personAddress?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'mobileNumber', 'error')} ">
	<label for="mobileNumber">
		<g:message code="camper.mobileNumber.label" default="Mobile Number" />
		
	</label>
	<g:textField name="mobileNumber" value="${camperInstance?.mobileNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'homeNumber', 'error')} ">
	<label for="homeNumber">
		<g:message code="camper.homeNumber.label" default="Home Number" />
		
	</label>
	<g:textField name="homeNumber" value="${camperInstance?.homeNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="camper.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${camperInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'boardAttendance', 'error')} ">
	<label for="boardAttendance">
		<g:message code="camper.boardAttendance.label" default="Board Attendance" />
		
	</label>
	<g:select id="boardAttendance" name="boardAttendance.id" from="${attendance.Board.list()}" optionKey="id" value="${camperInstance?.boardAttendance?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'camperGrade', 'error')} ">
	<label for="camperGrade">
		<g:message code="camper.camperGrade.label" default="Camper Grade" />
		
	</label>
	<g:select id="camperGrade" name="camperGrade.id" from="${camp.Grade.list()}" optionKey="id" value="${camperInstance?.camperGrade?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: camperInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="camper.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${camperInstance?.name}"/>

</div>

