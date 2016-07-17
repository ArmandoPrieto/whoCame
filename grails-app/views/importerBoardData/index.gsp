<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		<style>
	
	
	</style>
</head>
<body>

<body>

		
	<g:set var="theme" value="a" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
		
  			<h1>whoCame import attendance</h1>
  			<g:link controller="main" action="mainBoard" data-icon="back" >Go back</g:link>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		<g:form action="process" method='post' data-ajax="false" enctype="multipart/form-data">
			<input name="date" data-role="date" data-inline="true" type="text">
			<div style="text-align:center">
					<input type="file"  name="zipFile" data-theme="${theme}" data-inline="true" data-type="horizontal" data-icon="arrow-r">
			</div>
			<input type="submit" value="Upload data">
		</g:form>		
		</div>
		
		<div data-role="footer" data-position="fixed">
			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		</div>
	</div>
</body>
</body>
</html>