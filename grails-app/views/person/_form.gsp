<%@ page import="demographic.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="person.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${personInstance.constraints.gender.inList}" value="${personInstance?.gender}" valueMessagePrefix="person.gender" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="person.birthDate.label" default="Birth Date" />
		
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${personInstance?.birthDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="person.documents.label" default="Documents" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'personAddress', 'error')} ">
	<label for="personAddress">
		<g:message code="person.personAddress.label" default="Person Address" />
		
	</label>
	<g:select id="personAddress" name="personAddress.id" from="${demographic.Address.list()}" optionKey="id" value="${personInstance?.personAddress?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'mobileNumber', 'error')} ">
	<label for="mobileNumber">
		<g:message code="person.mobileNumber.label" default="Mobile Number" />
		
	</label>
	<g:textField name="mobileNumber" value="${personInstance?.mobileNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'homeNumber', 'error')} ">
	<label for="homeNumber">
		<g:message code="person.homeNumber.label" default="Home Number" />
		
	</label>
	<g:textField name="homeNumber" value="${personInstance?.homeNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${personInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'boardAttendance', 'error')} ">
	<label for="boardAttendance">
		<g:message code="person.boardAttendance.label" default="Board Attendance" />
		
	</label>
	<g:select id="boardAttendance" name="boardAttendance.id" from="${attendance.Board.list()}" optionKey="id" value="${personInstance?.boardAttendance?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${personInstance?.name}"/>

</div>

