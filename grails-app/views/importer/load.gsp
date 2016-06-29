<%@ page import="camp.Grade" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
		<style>
	
	
	</style>
	
	<script>
			$( document ).ready(function() {
				
				$("#submmitFileButton").click(function(){
					//if($("#append").is(':checked')){
						//$("#dialogLink").click();
						$("#loadFile").submit();
					//	alert('Hola');
					//submmitForm
					//}
					
				});
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
			
			<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>
			
			<g:form name='loadFile' action='loadFile' method='post' data-ajax="false" enctype="multipart/form-data">
			<fieldset data-role="controlgroup">
			  <legend>Choose type of file:</legend>
			  <input type="radio" name="radio-choice" id="radio-choice-1" value="choice-1" checked="checked">
			  <label for="radio-choice-1">Counselors</label>
			 
			  <input type="radio" name="radio-choice" id="radio-choice-2" value="choice-2">
			  <label for="radio-choice-2">Campers</label>
			 
			
			</fieldset>
          	
			<div style="text-align:center">
					<input type="file"  name="file" data-theme="${theme}" data-inline="true" data-type="horizontal" data-icon="arrow-r">
			</div>
			<label><input id="append" type="checkbox" name="checkbox-0"> Append database </label>
			
				<div style="text-align:center">
					<input id="submmitFileButton" type="button" value="Load file" data-theme="${theme}" data-inline="true" data-type="horizontal" data-icon="arrow-u">
			</div>
			
	
			
			</g:form>
			
				
		</div>
		
		<div data-role="footer" data-position="fixed">
		
  			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		
		</div>
	</div>
	<a href="#dialogPage" data-rel="dialog" id="dialogLink"  style="display:none;" >Open dialog</a>
	<div data-role="page" id="dialogPage">
  <div data-role="header">
    <h2>Dialog</h2>
  </div>
  <div role="main" class="ui-content">
    <p>I am a dialog</p>
  </div>
</div>
</body>
</html>

