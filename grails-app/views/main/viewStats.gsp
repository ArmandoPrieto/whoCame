<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="jqueryMobile">
	
	 <link rel="stylesheet" href="https://rawgithub.com/arschmitz/jquery-mobile-datepicker-wrapper/v0.1.1/jquery.mobile.datepicker.css" />
	 <script src="https://rawgithub.com/jquery/jquery-ui/1.10.4/ui/jquery.ui.datepicker.js"></script>
    <script id="mobile-datepicker" src="https://rawgithub.com/arschmitz/jquery-mobile-datepicker-wrapper/v0.1.1/jquery.mobile.datepicker.js"></script>
  	
</head>
<body>

	<script>
			$( document ).ready(function() {
			
			});
			
	</script>
	
	<g:set var="theme" value="a" />
	<div id="page" data-role="page"  data-theme="${theme}">
		
		<div data-role="header" data-position="fixed" >
		
  			<h1>whoCame Stats</h1>
  		<a id="saveRecords" data-icon="gear" class="ui-btn-right" data-theme="${theme}">Options</a>
		</div>
		<div id="page-content" data-role="content" data-theme="${theme}">
		<h1>campers: ${campersAttendance} counselors: ${counselorsAttendance}</h1>
			<table data-role="table" id="my-table" data-mode="reflow">
		      <thead>
		        <tr>
		          <th>Rank</th>
		          <th>Movie Title</th>
		          <th>Year</th>
		          <th><abbr title="Rotten Tomato Rating">Rating</abbr></th>
		          <th>Reviews</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr>
		          <th>1</th>
		          <td><a href="foo.com" data-rel="external">Citizen Kane</a></td>
		          <td>1941</td>
		          <td>100%</td>
		          <td>74</td>
		        </tr>
		      </tbody>
	   		</table>
		</div>
		
		<div data-role="footer" data-position="fixed">
			<h1><g:formatDate format="EEE, MMM d" date="${date}"/></h1>
  		</div>
	</div>
</body>
</html>