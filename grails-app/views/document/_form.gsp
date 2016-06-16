<%@ page import="file.Document" %>



<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="document.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${file.DocumentType.list()}" optionKey="id" required="" value="${documentInstance?.type?.id}" class="many-to-one"/>

</div>

