<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
	
	
  	 <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.mobile.datepicker.css')}"/>
	 <script src="${resource(dir: 'js', file: 'jquery.ui.datepicker.js')}"></script>
    <script  src="${resource(dir: 'js', file: 'jquery.mobile.datepicker.js')}"></script>
  	
</head>
<body>

		
	<g:set var="theme" value="a" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
		
  			<h1>whoCame Download</h1>
  		
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		<g:form action="downloadData"  data-ajax="false">
			<input name="date" data-role="date" data-inline="true" type="text">
			<input type="submit" value="Download">
		</g:form>		
		</div>
		
		<div data-role="footer" data-position="fixed">
			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		</div>
	</div>
</body>
</html>