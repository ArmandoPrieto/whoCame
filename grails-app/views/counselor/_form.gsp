<%@ page import="camp.Counselor" %>



<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="counselor.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${counselorInstance.constraints.gender.inList}" value="${counselorInstance?.gender}" valueMessagePrefix="counselor.gender" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="counselor.birthDate.label" default="Birth Date" />
		
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${counselorInstance?.birthDate}" default="none" noSelection="['': '']" />

</div>
<%-- 
<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="counselor.documents.label" default="Documents" />
		
	</label>
</div>
--%>
<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'personAddress', 'error')} ">
	<label for="personAddress">
		<g:message code="counselor.personAddress.label" default="Person Address" />
		
	</label>
	<g:select id="personAddress" name="personAddress.id" from="${demographic.Address.list()}" optionKey="id" value="${counselorInstance?.personAddress?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'mobileNumber', 'error')} ">
	<label for="mobileNumber">
		<g:message code="counselor.mobileNumber.label" default="Mobile Number" />
		
	</label>
	<g:textField name="mobileNumber" value="${counselorInstance?.mobileNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'homeNumber', 'error')} ">
	<label for="homeNumber">
		<g:message code="counselor.homeNumber.label" default="Home Number" />
		
	</label>
	<g:textField name="homeNumber" value="${counselorInstance?.homeNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="counselor.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${counselorInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'boardAttendance', 'error')} ">
	<label for="boardAttendance">
		<g:message code="counselor.boardAttendance.label" default="Board Attendance" />
		
	</label>
	<g:select id="boardAttendance" name="boardAttendance.id" from="${attendance.Board.list()}" optionKey="id" value="${counselorInstance?.boardAttendance?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'tshirt', 'error')} ">
	<label for="tshirt">
		<g:message code="counselor.tshirt.label" default="Tshirt" />
		
	</label>
	<g:select name="tshirt" from="${counselorInstance.constraints.tshirt.inList}" value="${counselorInstance?.tshirt}" valueMessagePrefix="counselor.tshirt" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'workTime', 'error')} ">
	<label for="workTime">
		<g:message code="counselor.workTime.label" default="Work Time" />
		
	</label>
	<g:select name="workTime" from="${counselorInstance.constraints.workTime.inList}" value="${counselorInstance?.workTime}" valueMessagePrefix="counselor.workTime" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'schoolSystem', 'error')} ">
	<label for="schoolSystem">
		<g:message code="counselor.schoolSystem.label" default="School System" />
		
	</label>
	<g:select name="schoolSystem" from="${counselorInstance.constraints.schoolSystem.inList}" value="${counselorInstance?.schoolSystem}" valueMessagePrefix="counselor.schoolSystem" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'team', 'error')} ">
	<label for="team">
		<g:message code="counselor.team.label" default="Team" />
		
	</label>
	<g:select id="team" name="team.id" from="${camp.CounselorTeam.list()}" optionKey="id" optionValue="grade" value="${counselorInstance?.team?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'picture', 'error')} ">
	<label for="picture">
		<g:message code="counselor.picture.label" default="Picture" />
		
	</label>
	<g:textField name="picture" value="${counselorInstance?.picture}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'school', 'error')} ">
	<label for="school">
		<g:message code="counselor.school.label" default="School" />
		
	</label>
	<g:textField name="school" value="${counselorInstance?.school}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'month', 'error')} ">
	<label for="month">
		<g:message code="counselor.month.label" default="Month" />
		
	</label>
	<g:textField name="month" value="${counselorInstance?.month}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'day', 'error')} required">
	<label for="day">
		<g:message code="counselor.day.label" default="Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="day" type="number" value="${counselorInstance.day}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'year', 'error')} ">
	<label for="year">
		<g:message code="counselor.year.label" default="Year" />
		
	</label>
	<g:textField name="year" value="${counselorInstance?.year}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'fatherName', 'error')} ">
	<label for="fatherName">
		<g:message code="counselor.fatherName.label" default="Father Name" />
		
	</label>
	<g:textField name="fatherName" value="${counselorInstance?.fatherName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'fatherPhone', 'error')} ">
	<label for="fatherPhone">
		<g:message code="counselor.fatherPhone.label" default="Father Phone" />
		
	</label>
	<g:textField name="fatherPhone" value="${counselorInstance?.fatherPhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'motherName', 'error')} ">
	<label for="motherName">
		<g:message code="counselor.motherName.label" default="Mother Name" />
		
	</label>
	<g:textField name="motherName" value="${counselorInstance?.motherName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'motherPhone', 'error')} ">
	<label for="motherPhone">
		<g:message code="counselor.motherPhone.label" default="Mother Phone" />
		
	</label>
	<g:textField name="motherPhone" value="${counselorInstance?.motherPhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'yearsWorked', 'error')} ">
	<label for="yearsWorked">
		<g:message code="counselor.yearsWorked.label" default="Years Worked" />
		
	</label>
	<g:textField name="yearsWorked" value="${counselorInstance?.yearsWorked}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="counselor.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${counselorInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'allergies', 'error')} ">
	<label for="allergies">
		<g:message code="counselor.allergies.label" default="Allergies" />
		
	</label>
	<g:textField name="allergies" value="${counselorInstance?.allergies}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'contract', 'error')} ">
	<label for="contract">
		<g:message code="counselor.contract.label" default="Contract" />
		
	</label>
	<g:textField name="contract" value="${counselorInstance?.contract}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'virtus', 'error')} ">
	<label for="virtus">
		<g:message code="counselor.virtus.label" default="Virtus" />
		
	</label>
	<g:textField name="virtus" value="${counselorInstance?.virtus}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'fingerPrinting', 'error')} ">
	<label for="fingerPrinting">
		<g:message code="counselor.fingerPrinting.label" default="Finger Printing" />
		
	</label>
	<g:textField name="fingerPrinting" value="${counselorInstance?.fingerPrinting}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'permissionSlip', 'error')} ">
	<label for="permissionSlip">
		<g:message code="counselor.permissionSlip.label" default="Permission Slip" />
		
	</label>
	<g:textField name="permissionSlip" value="${counselorInstance?.permissionSlip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'headStaff', 'error')} ">
	<label for="headStaff">
		<g:message code="counselor.headStaff.label" default="Head Staff" />
		
	</label>
	<g:textField name="headStaff" value="${counselorInstance?.headStaff}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'hmAward', 'error')} ">
	<label for="hmAward">
		<g:message code="counselor.hmAward.label" default="Hm Award" />
		
	</label>
	<g:textField name="hmAward" value="${counselorInstance?.hmAward}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'checked', 'error')} ">
	<label for="checked">
		<g:message code="counselor.checked.label" default="Checked" />
		
	</label>
	<g:textField name="checked" value="${counselorInstance?.checked}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'reflection', 'error')} ">
	<label for="reflection">
		<g:message code="counselor.reflection.label" default="Reflection" />
		
	</label>
	<g:textField name="reflection" value="${counselorInstance?.reflection}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: counselorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="counselor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${counselorInstance?.name}"/>

</div>

