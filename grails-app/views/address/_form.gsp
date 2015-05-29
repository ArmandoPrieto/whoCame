<%@ page import="demographic.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="address.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${addressInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${addressInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${addressInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zip', 'error')} ">
	<label for="zip">
		<g:message code="address.zip.label" default="Zip" />
		
	</label>
	<g:textField name="zip" value="${addressInstance?.zip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="address.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${demographic.Person.list()}" optionKey="id" required="" value="${addressInstance?.person?.id}" class="many-to-one"/>

</div>

