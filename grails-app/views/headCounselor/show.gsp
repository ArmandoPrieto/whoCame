
<%@ page import="camp.HeadCounselor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'headCounselor.label', default: 'HeadCounselor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-headCounselor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-headCounselor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list headCounselor">
			
				<g:if test="${headCounselorInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="headCounselor.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${headCounselorInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="headCounselor.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${headCounselorInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.documents}">
				<li class="fieldcontain">
					<span id="documents-label" class="property-label"><g:message code="headCounselor.documents.label" default="Documents" /></span>
					
						<span class="property-value" aria-labelledby="documents-label"><g:fieldValue bean="${headCounselorInstance}" field="documents"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.personAddress}">
				<li class="fieldcontain">
					<span id="personAddress-label" class="property-label"><g:message code="headCounselor.personAddress.label" default="Person Address" /></span>
					
						<span class="property-value" aria-labelledby="personAddress-label"><g:link controller="address" action="show" id="${headCounselorInstance?.personAddress?.id}">${headCounselorInstance?.personAddress?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.mobileNumber}">
				<li class="fieldcontain">
					<span id="mobileNumber-label" class="property-label"><g:message code="headCounselor.mobileNumber.label" default="Mobile Number" /></span>
					
						<span class="property-value" aria-labelledby="mobileNumber-label"><g:fieldValue bean="${headCounselorInstance}" field="mobileNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.homeNumber}">
				<li class="fieldcontain">
					<span id="homeNumber-label" class="property-label"><g:message code="headCounselor.homeNumber.label" default="Home Number" /></span>
					
						<span class="property-value" aria-labelledby="homeNumber-label"><g:fieldValue bean="${headCounselorInstance}" field="homeNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="headCounselor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${headCounselorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.boardAttendance}">
				<li class="fieldcontain">
					<span id="boardAttendance-label" class="property-label"><g:message code="headCounselor.boardAttendance.label" default="Board Attendance" /></span>
					
						<span class="property-value" aria-labelledby="boardAttendance-label"><g:link controller="board" action="show" id="${headCounselorInstance?.boardAttendance?.id}">${headCounselorInstance?.boardAttendance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.tshirt}">
				<li class="fieldcontain">
					<span id="tshirt-label" class="property-label"><g:message code="headCounselor.tshirt.label" default="Tshirt" /></span>
					
						<span class="property-value" aria-labelledby="tshirt-label"><g:fieldValue bean="${headCounselorInstance}" field="tshirt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.workTime}">
				<li class="fieldcontain">
					<span id="workTime-label" class="property-label"><g:message code="headCounselor.workTime.label" default="Work Time" /></span>
					
						<span class="property-value" aria-labelledby="workTime-label"><g:fieldValue bean="${headCounselorInstance}" field="workTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.schoolSystem}">
				<li class="fieldcontain">
					<span id="schoolSystem-label" class="property-label"><g:message code="headCounselor.schoolSystem.label" default="School System" /></span>
					
						<span class="property-value" aria-labelledby="schoolSystem-label"><g:fieldValue bean="${headCounselorInstance}" field="schoolSystem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.team}">
				<li class="fieldcontain">
					<span id="team-label" class="property-label"><g:message code="headCounselor.team.label" default="Team" /></span>
					
						<span class="property-value" aria-labelledby="team-label"><g:link controller="counselorTeam" action="show" id="${headCounselorInstance?.team?.id}">${headCounselorInstance?.team?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.picture}">
				<li class="fieldcontain">
					<span id="picture-label" class="property-label"><g:message code="headCounselor.picture.label" default="Picture" /></span>
					
						<span class="property-value" aria-labelledby="picture-label"><g:fieldValue bean="${headCounselorInstance}" field="picture"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.school}">
				<li class="fieldcontain">
					<span id="school-label" class="property-label"><g:message code="headCounselor.school.label" default="School" /></span>
					
						<span class="property-value" aria-labelledby="school-label"><g:fieldValue bean="${headCounselorInstance}" field="school"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.month}">
				<li class="fieldcontain">
					<span id="month-label" class="property-label"><g:message code="headCounselor.month.label" default="Month" /></span>
					
						<span class="property-value" aria-labelledby="month-label"><g:fieldValue bean="${headCounselorInstance}" field="month"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.day}">
				<li class="fieldcontain">
					<span id="day-label" class="property-label"><g:message code="headCounselor.day.label" default="Day" /></span>
					
						<span class="property-value" aria-labelledby="day-label"><g:fieldValue bean="${headCounselorInstance}" field="day"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="headCounselor.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${headCounselorInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.fatherName}">
				<li class="fieldcontain">
					<span id="fatherName-label" class="property-label"><g:message code="headCounselor.fatherName.label" default="Father Name" /></span>
					
						<span class="property-value" aria-labelledby="fatherName-label"><g:fieldValue bean="${headCounselorInstance}" field="fatherName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.fatherPhone}">
				<li class="fieldcontain">
					<span id="fatherPhone-label" class="property-label"><g:message code="headCounselor.fatherPhone.label" default="Father Phone" /></span>
					
						<span class="property-value" aria-labelledby="fatherPhone-label"><g:fieldValue bean="${headCounselorInstance}" field="fatherPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.motherName}">
				<li class="fieldcontain">
					<span id="motherName-label" class="property-label"><g:message code="headCounselor.motherName.label" default="Mother Name" /></span>
					
						<span class="property-value" aria-labelledby="motherName-label"><g:fieldValue bean="${headCounselorInstance}" field="motherName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.motherPhone}">
				<li class="fieldcontain">
					<span id="motherPhone-label" class="property-label"><g:message code="headCounselor.motherPhone.label" default="Mother Phone" /></span>
					
						<span class="property-value" aria-labelledby="motherPhone-label"><g:fieldValue bean="${headCounselorInstance}" field="motherPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.yearsWorked}">
				<li class="fieldcontain">
					<span id="yearsWorked-label" class="property-label"><g:message code="headCounselor.yearsWorked.label" default="Years Worked" /></span>
					
						<span class="property-value" aria-labelledby="yearsWorked-label"><g:fieldValue bean="${headCounselorInstance}" field="yearsWorked"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="headCounselor.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${headCounselorInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.allergies}">
				<li class="fieldcontain">
					<span id="allergies-label" class="property-label"><g:message code="headCounselor.allergies.label" default="Allergies" /></span>
					
						<span class="property-value" aria-labelledby="allergies-label"><g:fieldValue bean="${headCounselorInstance}" field="allergies"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.contract}">
				<li class="fieldcontain">
					<span id="contract-label" class="property-label"><g:message code="headCounselor.contract.label" default="Contract" /></span>
					
						<span class="property-value" aria-labelledby="contract-label"><g:fieldValue bean="${headCounselorInstance}" field="contract"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.virtus}">
				<li class="fieldcontain">
					<span id="virtus-label" class="property-label"><g:message code="headCounselor.virtus.label" default="Virtus" /></span>
					
						<span class="property-value" aria-labelledby="virtus-label"><g:fieldValue bean="${headCounselorInstance}" field="virtus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.fingerPrinting}">
				<li class="fieldcontain">
					<span id="fingerPrinting-label" class="property-label"><g:message code="headCounselor.fingerPrinting.label" default="Finger Printing" /></span>
					
						<span class="property-value" aria-labelledby="fingerPrinting-label"><g:fieldValue bean="${headCounselorInstance}" field="fingerPrinting"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.permissionSlip}">
				<li class="fieldcontain">
					<span id="permissionSlip-label" class="property-label"><g:message code="headCounselor.permissionSlip.label" default="Permission Slip" /></span>
					
						<span class="property-value" aria-labelledby="permissionSlip-label"><g:fieldValue bean="${headCounselorInstance}" field="permissionSlip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.headStaff}">
				<li class="fieldcontain">
					<span id="headStaff-label" class="property-label"><g:message code="headCounselor.headStaff.label" default="Head Staff" /></span>
					
						<span class="property-value" aria-labelledby="headStaff-label"><g:fieldValue bean="${headCounselorInstance}" field="headStaff"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.hmAward}">
				<li class="fieldcontain">
					<span id="hmAward-label" class="property-label"><g:message code="headCounselor.hmAward.label" default="Hm Award" /></span>
					
						<span class="property-value" aria-labelledby="hmAward-label"><g:fieldValue bean="${headCounselorInstance}" field="hmAward"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.checked}">
				<li class="fieldcontain">
					<span id="checked-label" class="property-label"><g:message code="headCounselor.checked.label" default="Checked" /></span>
					
						<span class="property-value" aria-labelledby="checked-label"><g:fieldValue bean="${headCounselorInstance}" field="checked"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.reflection}">
				<li class="fieldcontain">
					<span id="reflection-label" class="property-label"><g:message code="headCounselor.reflection.label" default="Reflection" /></span>
					
						<span class="property-value" aria-labelledby="reflection-label"><g:fieldValue bean="${headCounselorInstance}" field="reflection"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${headCounselorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="headCounselor.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${headCounselorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:headCounselorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${headCounselorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
