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
		
  			<h1>whoCame</h1>
  		<a id="saveRecords" data-icon="gear" class="ui-btn-right" data-theme="${theme}">Options</a>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
			<g:form controller="login">
				<div class="ui-field-contain">
				 <label for="user">Grade:</label>
	   			  <select name="gradeId" id="gradeId" data-native-menu="false">
				    <g:each in="${grades}">
				      <option value="${it.id}">${it.gradeName}</option>
				    </g:each>  
				    </select>
				</div>
				<div class="ui-field-contain">
					<label for="password">Password:</label>
					  <input type="password" name="password" id="password" value="" data-clear-btn="true" style="text-align: center;"  maxlength="4">
				</div>
				<div style="text-align:center">
					<input type="submit" value="Start" data-theme="${theme}" data-inline="true" data-type="horizontal">
				</div>
		
			</g:form>		
		</div>
		
		<div data-role="footer" data-position="fixed">
		
  			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		
		</div>
	</div>
</body>
</html>