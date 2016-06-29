<%@ page import="camp.Grade" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		<style>
	
	
	</style>
	
	<script>
			$( document ).ready(function() {
			
			});
			$(document).on( "click", ".show-page-loading-msg", function() {
				  var $this = $( this ),
				  theme = $this.jqmData( "theme" ) || $.mobile.loader.prototype.options.theme,
				  msgText = $this.jqmData( "msgtext" ) || $.mobile.loader.prototype.options.text,
				  textVisible = $this.jqmData( "textvisible" ) || $.mobile.loader.prototype.options.textVisible,
				  textonly = !!$this.jqmData( "textonly" );
				  html = $this.jqmData( "html" ) || "";
				$.mobile.loading( 'show', {
				  text: msgText,
				  textVisible: textVisible,
				  theme: theme,
				  textonly: textonly,
				  html: html
				  });
				})
				.on( "click", ".hide-page-loading-msg", function() {
				  $.mobile.loading( "hide" );
				});
	</script>
</head>
<body>

	
	
	<g:set var="theme" value="a" />
	<g:set var="grades" value="${Grade.findAll()}" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
		
  			<h1>whoCame</h1>
  		<a id="saveRecords" data-icon="gear" class="ui-btn-right" data-theme="${theme}">Options</a>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
			
			<g:if test='${flash.error}'>
			<div><p class="bg-danger">${flash.error}</p></div>
			</g:if>
			
			<h1>Fail</h1>
		
    
</div>
				
		</div>
		
		<div data-role="footer" data-position="fixed">
		
  			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		
		</div>
	</div>
</body>
</html>

