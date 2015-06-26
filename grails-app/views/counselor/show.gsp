
<%@ page import="camp.Counselor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'counselor.label', default: 'Counselor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-counselor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-counselor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list counselor">
			
				<g:if test="${counselorInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="counselor.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${counselorInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.birthDate}">
				<li class="fieldcontain">
					<span id="birthDate-label" class="property-label"><g:message code="counselor.birthDate.label" default="Birth Date" /></span>
					
						<span class="property-value" aria-labelledby="birthDate-label"><g:formatDate date="${counselorInstance?.birthDate}" /></span>
					
				</li>
				</g:if>
			
			<%--	<g:if test="${counselorInstance?.documents}">
				<li class="fieldcontain">
					<span id="documents-label" class="property-label"><g:message code="counselor.documents.label" default="Documents" /></span>
					
						<span class="property-value" aria-labelledby="documents-label"><g:fieldValue bean="${counselorInstance}" field="documents"/></span>
					
				</li>
				</g:if>
			 --%>
				<g:if test="${counselorInstance?.personAddress}">
				<li class="fieldcontain">
					<span id="personAddress-label" class="property-label"><g:message code="counselor.personAddress.label" default="Person Address" /></span>
					
						<span class="property-value" aria-labelledby="personAddress-label"><g:link controller="address" action="show" id="${counselorInstance?.personAddress?.id}">${counselorInstance?.personAddress?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.mobileNumber}">
				<li class="fieldcontain">
					<span id="mobileNumber-label" class="property-label"><g:message code="counselor.mobileNumber.label" default="Mobile Number" /></span>
					
						<span class="property-value" aria-labelledby="mobileNumber-label"><g:fieldValue bean="${counselorInstance}" field="mobileNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.homeNumber}">
				<li class="fieldcontain">
					<span id="homeNumber-label" class="property-label"><g:message code="counselor.homeNumber.label" default="Home Number" /></span>
					
						<span class="property-value" aria-labelledby="homeNumber-label"><g:fieldValue bean="${counselorInstance}" field="homeNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="counselor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${counselorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.boardAttendance}">
				<li class="fieldcontain">
					<span id="boardAttendance-label" class="property-label"><g:message code="counselor.boardAttendance.label" default="Board Attendance" /></span>
					
						<span class="property-value" aria-labelledby="boardAttendance-label"><g:link controller="board" action="show" id="${counselorInstance?.boardAttendance?.id}">${counselorInstance?.boardAttendance?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.tshirt}">
				<li class="fieldcontain">
					<span id="tshirt-label" class="property-label"><g:message code="counselor.tshirt.label" default="Tshirt" /></span>
					
						<span class="property-value" aria-labelledby="tshirt-label"><g:fieldValue bean="${counselorInstance}" field="tshirt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.workTime}">
				<li class="fieldcontain">
					<span id="workTime-label" class="property-label"><g:message code="counselor.workTime.label" default="Work Time" /></span>
					
						<span class="property-value" aria-labelledby="workTime-label"><g:fieldValue bean="${counselorInstance}" field="workTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.schoolSystem}">
				<li class="fieldcontain">
					<span id="schoolSystem-label" class="property-label"><g:message code="counselor.schoolSystem.label" default="School System" /></span>
					
						<span class="property-value" aria-labelledby="schoolSystem-label"><g:fieldValue bean="${counselorInstance}" field="schoolSystem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.team}">
				<li class="fieldcontain">
					<span id="team-label" class="property-label"><g:message code="counselor.team.label" default="Team" /></span>
					
						<span class="property-value" aria-labelledby="team-label"><g:link controller="counselorTeam" action="show" id="${counselorInstance?.team?.id}">${counselorInstance?.team?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.picture}">
				<li class="fieldcontain">
					<span id="picture-label" class="property-label"><g:message code="counselor.picture.label" default="Picture" /></span>
					
						<span class="property-value" aria-labelledby="picture-label"><g:fieldValue bean="${counselorInstance}" field="picture"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.school}">
				<li class="fieldcontain">
					<span id="school-label" class="property-label"><g:message code="counselor.school.label" default="School" /></span>
					
						<span class="property-value" aria-labelledby="school-label"><g:fieldValue bean="${counselorInstance}" field="school"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.month}">
				<li class="fieldcontain">
					<span id="month-label" class="property-label"><g:message code="counselor.month.label" default="Month" /></span>
					
						<span class="property-value" aria-labelledby="month-label"><g:fieldValue bean="${counselorInstance}" field="month"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.day}">
				<li class="fieldcontain">
					<span id="day-label" class="property-label"><g:message code="counselor.day.label" default="Day" /></span>
					
						<span class="property-value" aria-labelledby="day-label"><g:fieldValue bean="${counselorInstance}" field="day"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="counselor.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${counselorInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.fatherName}">
				<li class="fieldcontain">
					<span id="fatherName-label" class="property-label"><g:message code="counselor.fatherName.label" default="Father Name" /></span>
					
						<span class="property-value" aria-labelledby="fatherName-label"><g:fieldValue bean="${counselorInstance}" field="fatherName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.fatherPhone}">
				<li class="fieldcontain">
					<span id="fatherPhone-label" class="property-label"><g:message code="counselor.fatherPhone.label" default="Father Phone" /></span>
					
						<span class="property-value" aria-labelledby="fatherPhone-label"><g:fieldValue bean="${counselorInstance}" field="fatherPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.motherName}">
				<li class="fieldcontain">
					<span id="motherName-label" class="property-label"><g:message code="counselor.motherName.label" default="Mother Name" /></span>
					
						<span class="property-value" aria-labelledby="motherName-label"><g:fieldValue bean="${counselorInstance}" field="motherName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.motherPhone}">
				<li class="fieldcontain">
					<span id="motherPhone-label" class="property-label"><g:message code="counselor.motherPhone.label" default="Mother Phone" /></span>
					
						<span class="property-value" aria-labelledby="motherPhone-label"><g:fieldValue bean="${counselorInstance}" field="motherPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.yearsWorked}">
				<li class="fieldcontain">
					<span id="yearsWorked-label" class="property-label"><g:message code="counselor.yearsWorked.label" default="Years Worked" /></span>
					
						<span class="property-value" aria-labelledby="yearsWorked-label"><g:fieldValue bean="${counselorInstance}" field="yearsWorked"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="counselor.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${counselorInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.allergies}">
				<li class="fieldcontain">
					<span id="allergies-label" class="property-label"><g:message code="counselor.allergies.label" default="Allergies" /></span>
					
						<span class="property-value" aria-labelledby="allergies-label"><g:fieldValue bean="${counselorInstance}" field="allergies"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.contract}">
				<li class="fieldcontain">
					<span id="contract-label" class="property-label"><g:message code="counselor.contract.label" default="Contract" /></span>
					
						<span class="property-value" aria-labelledby="contract-label"><g:fieldValue bean="${counselorInstance}" field="contract"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.virtus}">
				<li class="fieldcontain">
					<span id="virtus-label" class="property-label"><g:message code="counselor.virtus.label" default="Virtus" /></span>
					
						<span class="property-value" aria-labelledby="virtus-label"><g:fieldValue bean="${counselorInstance}" field="virtus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.fingerPrinting}">
				<li class="fieldcontain">
					<span id="fingerPrinting-label" class="property-label"><g:message code="counselor.fingerPrinting.label" default="Finger Printing" /></span>
					
						<span class="property-value" aria-labelledby="fingerPrinting-label"><g:fieldValue bean="${counselorInstance}" field="fingerPrinting"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.permissionSlip}">
				<li class="fieldcontain">
					<span id="permissionSlip-label" class="property-label"><g:message code="counselor.permissionSlip.label" default="Permission Slip" /></span>
					
						<span class="property-value" aria-labelledby="permissionSlip-label"><g:fieldValue bean="${counselorInstance}" field="permissionSlip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.headStaff}">
				<li class="fieldcontain">
					<span id="headStaff-label" class="property-label"><g:message code="counselor.headStaff.label" default="Head Staff" /></span>
					
						<span class="property-value" aria-labelledby="headStaff-label"><g:fieldValue bean="${counselorInstance}" field="headStaff"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.hmAward}">
				<li class="fieldcontain">
					<span id="hmAward-label" class="property-label"><g:message code="counselor.hmAward.label" default="Hm Award" /></span>
					
						<span class="property-value" aria-labelledby="hmAward-label"><g:fieldValue bean="${counselorInstance}" field="hmAward"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.checked}">
				<li class="fieldcontain">
					<span id="checked-label" class="property-label"><g:message code="counselor.checked.label" default="Checked" /></span>
					
						<span class="property-value" aria-labelledby="checked-label"><g:fieldValue bean="${counselorInstance}" field="checked"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.reflection}">
				<li class="fieldcontain">
					<span id="reflection-label" class="property-label"><g:message code="counselor.reflection.label" default="Reflection" /></span>
					
						<span class="property-value" aria-labelledby="reflection-label"><g:fieldValue bean="${counselorInstance}" field="reflection"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counselorInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="counselor.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${counselorInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:counselorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${counselorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
