<%@ page import="camp.HeadCounselor" %>



<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="headCounselor.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${headCounselorInstance.constraints.gender.inList}" value="${headCounselorInstance?.gender}" valueMessagePrefix="headCounselor.gender" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'birthDate', 'error')} ">
	<label for="birthDate">
		<g:message code="headCounselor.birthDate.label" default="Birth Date" />
		
	</label>
	<g:datePicker name="birthDate" precision="day"  value="${headCounselorInstance?.birthDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="headCounselor.documents.label" default="Documents" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'personAddress', 'error')} ">
	<label for="personAddress">
		<g:message code="headCounselor.personAddress.label" default="Person Address" />
		
	</label>
	<g:select id="personAddress" name="personAddress.id" from="${demographic.Address.list()}" optionKey="id" value="${headCounselorInstance?.personAddress?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'mobileNumber', 'error')} ">
	<label for="mobileNumber">
		<g:message code="headCounselor.mobileNumber.label" default="Mobile Number" />
		
	</label>
	<g:textField name="mobileNumber" value="${headCounselorInstance?.mobileNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'homeNumber', 'error')} ">
	<label for="homeNumber">
		<g:message code="headCounselor.homeNumber.label" default="Home Number" />
		
	</label>
	<g:textField name="homeNumber" value="${headCounselorInstance?.homeNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="headCounselor.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${headCounselorInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'boardAttendance', 'error')} ">
	<label for="boardAttendance">
		<g:message code="headCounselor.boardAttendance.label" default="Board Attendance" />
		
	</label>
	<g:select id="boardAttendance" name="boardAttendance.id" from="${attendance.Board.list()}" optionKey="id" value="${headCounselorInstance?.boardAttendance?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'tshirt', 'error')} ">
	<label for="tshirt">
		<g:message code="headCounselor.tshirt.label" default="Tshirt" />
		
	</label>
	<g:select name="tshirt" from="${headCounselorInstance.constraints.tshirt.inList}" value="${headCounselorInstance?.tshirt}" valueMessagePrefix="headCounselor.tshirt" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'workTime', 'error')} ">
	<label for="workTime">
		<g:message code="headCounselor.workTime.label" default="Work Time" />
		
	</label>
	<g:select name="workTime" from="${headCounselorInstance.constraints.workTime.inList}" value="${headCounselorInstance?.workTime}" valueMessagePrefix="headCounselor.workTime" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'schoolSystem', 'error')} ">
	<label for="schoolSystem">
		<g:message code="headCounselor.schoolSystem.label" default="School System" />
		
	</label>
	<g:select name="schoolSystem" from="${headCounselorInstance.constraints.schoolSystem.inList}" value="${headCounselorInstance?.schoolSystem}" valueMessagePrefix="headCounselor.schoolSystem" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'team', 'error')} ">
	<label for="team">
		<g:message code="headCounselor.team.label" default="Team" />
		
	</label>
	<g:select id="team" name="team.id" from="${camp.CounselorTeam.list()}" optionKey="id" value="${headCounselorInstance?.team?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'picture', 'error')} ">
	<label for="picture">
		<g:message code="headCounselor.picture.label" default="Picture" />
		
	</label>
	<g:textField name="picture" value="${headCounselorInstance?.picture}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'school', 'error')} ">
	<label for="school">
		<g:message code="headCounselor.school.label" default="School" />
		
	</label>
	<g:textField name="school" value="${headCounselorInstance?.school}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'month', 'error')} ">
	<label for="month">
		<g:message code="headCounselor.month.label" default="Month" />
		
	</label>
	<g:textField name="month" value="${headCounselorInstance?.month}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'day', 'error')} required">
	<label for="day">
		<g:message code="headCounselor.day.label" default="Day" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="day" type="number" value="${headCounselorInstance.day}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'year', 'error')} ">
	<label for="year">
		<g:message code="headCounselor.year.label" default="Year" />
		
	</label>
	<g:textField name="year" value="${headCounselorInstance?.year}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'fatherName', 'error')} ">
	<label for="fatherName">
		<g:message code="headCounselor.fatherName.label" default="Father Name" />
		
	</label>
	<g:textField name="fatherName" value="${headCounselorInstance?.fatherName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'fatherPhone', 'error')} ">
	<label for="fatherPhone">
		<g:message code="headCounselor.fatherPhone.label" default="Father Phone" />
		
	</label>
	<g:textField name="fatherPhone" value="${headCounselorInstance?.fatherPhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'motherName', 'error')} ">
	<label for="motherName">
		<g:message code="headCounselor.motherName.label" default="Mother Name" />
		
	</label>
	<g:textField name="motherName" value="${headCounselorInstance?.motherName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'motherPhone', 'error')} ">
	<label for="motherPhone">
		<g:message code="headCounselor.motherPhone.label" default="Mother Phone" />
		
	</label>
	<g:textField name="motherPhone" value="${headCounselorInstance?.motherPhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'yearsWorked', 'error')} ">
	<label for="yearsWorked">
		<g:message code="headCounselor.yearsWorked.label" default="Years Worked" />
		
	</label>
	<g:textField name="yearsWorked" value="${headCounselorInstance?.yearsWorked}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="headCounselor.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${headCounselorInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'allergies', 'error')} ">
	<label for="allergies">
		<g:message code="headCounselor.allergies.label" default="Allergies" />
		
	</label>
	<g:textField name="allergies" value="${headCounselorInstance?.allergies}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'contract', 'error')} ">
	<label for="contract">
		<g:message code="headCounselor.contract.label" default="Contract" />
		
	</label>
	<g:textField name="contract" value="${headCounselorInstance?.contract}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'virtus', 'error')} ">
	<label for="virtus">
		<g:message code="headCounselor.virtus.label" default="Virtus" />
		
	</label>
	<g:textField name="virtus" value="${headCounselorInstance?.virtus}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'fingerPrinting', 'error')} ">
	<label for="fingerPrinting">
		<g:message code="headCounselor.fingerPrinting.label" default="Finger Printing" />
		
	</label>
	<g:textField name="fingerPrinting" value="${headCounselorInstance?.fingerPrinting}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'permissionSlip', 'error')} ">
	<label for="permissionSlip">
		<g:message code="headCounselor.permissionSlip.label" default="Permission Slip" />
		
	</label>
	<g:textField name="permissionSlip" value="${headCounselorInstance?.permissionSlip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'headStaff', 'error')} ">
	<label for="headStaff">
		<g:message code="headCounselor.headStaff.label" default="Head Staff" />
		
	</label>
	<g:textField name="headStaff" value="${headCounselorInstance?.headStaff}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'hmAward', 'error')} ">
	<label for="hmAward">
		<g:message code="headCounselor.hmAward.label" default="Hm Award" />
		
	</label>
	<g:textField name="hmAward" value="${headCounselorInstance?.hmAward}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'checked', 'error')} ">
	<label for="checked">
		<g:message code="headCounselor.checked.label" default="Checked" />
		
	</label>
	<g:textField name="checked" value="${headCounselorInstance?.checked}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'reflection', 'error')} ">
	<label for="reflection">
		<g:message code="headCounselor.reflection.label" default="Reflection" />
		
	</label>
	<g:textField name="reflection" value="${headCounselorInstance?.reflection}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: headCounselorInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="headCounselor.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${headCounselorInstance?.name}"/>

</div>

