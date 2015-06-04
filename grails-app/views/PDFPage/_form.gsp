<%@ page import="file.PDFPage" %>



<div class="fieldcontain ${hasErrors(bean: PDFPageInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="PDFPage.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="url" required="" value="${PDFPageInstance?.url}"/>

</div>

