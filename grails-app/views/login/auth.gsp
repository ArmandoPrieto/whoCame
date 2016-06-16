<%@ page import="camp.Grade" %>
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
			
			<form action='${postUrl}' method='POST' id='loginForm'  autocomplete='off' data-ajax="false" >
			
			<div class="ui-field-contain">
				 <label for="username">Grade:</label>
	   			  <select name="j_username" id="username" data-native-menu="false">
				    <g:each in="${grades}">
				      <option value="${it.gradeName}">${it.gradeName}</option>
				    </g:each>  
				    </select>
				</div>
			
			<div class="ui-field-contain">
					<label for="password">Password:</label>
					  <input type="password" name="j_password" id="password" data-clear-btn="true" style="text-align: center;"  maxlength="4">
			</div>
			<div style="text-align:center">
					<input type="submit" value="Start" data-theme="${theme}" data-inline="true" data-type="horizontal">
			</div>
			
		<%--	<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>
		 --%>
			
		</form>
			
				
		</div>
		
		<div data-role="footer" data-position="fixed">
		
  			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		
		</div>
	</div>
</body>
</html>

