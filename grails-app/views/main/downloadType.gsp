<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		<style>
	
	
	</style>
</head>
<body>

	<script>
			$( document ).ready(function() {
			
			});
			
			
	</script>
	
	<g:set var="theme" value="a" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
			<g:link controller="main" action="mainBoard" data-icon="back" >Go back</g:link>
  			<h1>whoCame</h1>
  		
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
	
      	
		<fieldset data-role="controlgroup">
			  <legend>Download Type:</legend>
			   <sec:ifAnyGranted roles="ROLE_HEAD_MASTER,ROLE_SUPER_USER">
			 

			 	<g:link style="text-align: left;" 
			 	data-icon="arrow-r" 
			 	data-iconpos="right" 
			 	class="attendance" 
			 	action="downloadDataDate" 
			 	data-role="button">Daily</g:link>   
			
			 

				<g:link style="text-align: left;" 
				data-icon="arrow-r" 
				data-iconpos="right" 
				class="attendance" 
				action="downloadComplete" 
				data-role="button">Whole Calendar</g:link>   
			
			 
			
			 
			 </sec:ifAnyGranted>
			 
		</fieldset>
			
		</div>
		
		<div data-role="footer" data-position="fixed">
			
  		</div>
	</div>
</body>
</html>