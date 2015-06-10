<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${resource(dir: 'css/themes', file: 'whoCameToCamp.min.css')}" />
<link rel="stylesheet"
	href="${resource(dir: 'css/themes',file: 'jquery.mobile.icons.min.css' )}" />
<link rel="stylesheet"
	href="${resource(dir: 'css/themes',file: 'jquery.mobile.structure-1.4.5.min.css' )}" />
<script src="${resource(dir: 'js',file: 'jquery-1.11.3.min.js' )}"></script>
<script src="${resource(dir: 'js',file: 'jquery.mobile-1.4.5.min.js' )}"></script>

<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.mobile.datepicker.css')}" />
<script src="${resource(dir: 'js', file: 'jquery.ui.datepicker.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.mobile.datepicker.js')}"></script>

<%--	<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		 --%>
<script>
	$(document).on("pagecreate", function(event) {
		// alert("pagecreate event fired!");
		$('#saveAttendance').bind('click', function() {
			//Place code here
			alert("I am an alert box!");
			$("#attendanceForm").submit();
		});

		setTimeout(function() {
			$('.message').slideUp('slow');

			// $("#successMessage").hide('blind', {}, 500)
		}, 3000);
	});
</script>

<g:layoutHead />
</head>
<body>
	<g:layoutBody />


</body>
</html>
