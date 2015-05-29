<%@ page import="file.DocumentType" %>



<div class="fieldcontain ${hasErrors(bean: documentTypeInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="documentType.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${documentTypeInstance?.description}"/>

</div>

