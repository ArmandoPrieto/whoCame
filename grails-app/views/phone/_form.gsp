<%@ page import="demographic.Phone" %>



<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'phoneType', 'error')} required">
	<label for="phoneType">
		<g:message code="phone.phoneType.label" default="Phone Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="phoneType" from="${phoneInstance.constraints.phoneType.inList}" required="" value="${phoneInstance?.phoneType}" valueMessagePrefix="phone.phoneType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: phoneInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="phone.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="number" required="" value="${phoneInstance?.number}"/>

</div>

