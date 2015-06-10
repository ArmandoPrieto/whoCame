<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
	
	
</head>
<body>

	
	
	<g:set var="theme" value="a" />
	
	<div id="page" data-role="page"  data-theme="${theme}">
		 <div data-role="panel" id="mypanel" data-position="right"  data-display="overlay">
        
       
        <g:link controller="logout" action="index" data-role="button" data-ajax='false'>Log Out</g:link> 
         
        <a href="#options" data-rel="close">Close panel</a>
    	</div><!-- /panel -->
		<div data-role="header" data-position="fixed" >
		
  			<h1>whoCame ${grade.gradeName}</h1>
  		<a href="#mypanel" id="options" data-icon="gear" class="ui-btn-right" data-theme="${theme}">Options</a>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		

						
			  	<g:if test="${flash.message}">
     				<div class="message ui-body ui-body-a ui-corner-all" >
			  			<p> 	
     					<g:message code="${flash.message}" args="${flash.args}" default="${flash.default}"/>
						 </p>
					</div>
				</g:if>
				<g:if test="${flash.error}">
     				<div class="message ui-body ui-body-a ui-corner-all" >
			  			<p> 	
     					<g:message code="${flash.error}" />
     					</p>
					</div>
				</g:if>
			  
			  
		
		
		
		<g:form action="attendanceInOrOut" id="${grade.id}" method="get"   >
      		<input type="submit" value="Take today's roll">
		</g:form>
		<g:form action="attendanceDate" id="${grade.id}" method="get">
      		<input type="submit" value="Check attendance">
		</g:form>
		<g:form action="statisticsDate" id="${grade.id}" method="get">
      		<input type="submit" value="Statistics">
		</g:form>
		
		
			
		</div>
		
		<div data-role="footer" data-position="fixed">
			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		</div>
	</div>

</body>
</html>