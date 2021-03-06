<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Savio Youth Ministry</title>

    <!-- Bootstrap core CSS -->
     <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" />
     <link rel="stylesheet" href="${resource(dir: 'font-awesome/css', file: 'font-awesome.css')}" />
     <link rel="stylesheet" href="${resource(dir: 'css', file: 'zabuto_calendar.css')}" />
     <link rel="stylesheet" href="${resource(dir: 'js/gritter/css', file: 'jquery.gritter.css')}" />
     <link rel="stylesheet" href="${resource(dir: 'lineicons', file: 'style.css')}" />
     
    
      <!-- Custom styles for this template -->
       <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" />
   	  <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-responsive.css')}" />
     
     
     <script src="${resource(dir: 'js/chart-master', file: 'Chart.js')}"></script>
      <asset:javascript src="application.js"/>
     
  
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    	
      <g:layoutHead />
       
   
  </head>
  
  <body>
   <section id="container" >
   
   
     <g:render template="/common/header" />
      
    <g:render template="/common/sidebarLeft" />
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <div class="row">
                  <div class="col-lg-12 main-chart">
                  
  						 <g:layoutBody/>
   
   			
                  </div><!-- /col-lg-12 END SECTION MIDDLE -->
                  
   			
  
              </div><! --/row -->
          </section>
      </section>

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Prieto.io
              <a href="index.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>
  
  
     <!-- js placed at the end of the document so the pages load faster -->
    <%-- <script src="../assets/js/jquery.js"></script>
   <script src="../assets/js/jquery-1.8.3.min.js"></script>--%>
     <link rel="stylesheet" href="${resource(dir: 'css', file: 'style-responsive.css')}" />
     
     
     <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
   <script class="include" src="${resource(dir: 'js', file: 'jquery.dcjqaccordion.2.7.js')}"></script>
   <script src="${resource(dir: 'js', file: 'jquery.scrollTo.min.js')}"></script>
   <script src="${resource(dir: 'js', file: 'jquery.nicescroll.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.sparkline.js')}"></script>
    
     <!--common script for all pages-->
     <script src="${resource(dir: 'js', file: 'common-scripts.js')}"></script>
    
     <script src="${resource(dir: 'js/gritter/js', file: 'jquery.gritter.js')}"></script>
      <script src="${resource(dir: 'js', file: 'gritter-conf.js')}"></script>
      
       <!--script for this page-->
       <script src="${resource(dir: 'js', file: 'sparkline-chart.js')}"></script>
     <script src="${resource(dir: 'js', file: 'zabuto_calendar.js')}"></script>
     
     
  
   
   <%-- 
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.sparkline.js"></script>

 
    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>
    
    <script type="text/javascript" src="../assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="../assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="../assets/js/sparkline-chart.js"></script>    
	<script src="../assets/js/zabuto_calendar.js"></script>	
	--%>
	<script>	
        $(document).ready(function () {
      /*  var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Welcome to Dashgum!',
            // (string | mandatory) the text inside the notification
            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="http://blacktie.co" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
            // (string | optional) the image to display on the left
            image: '../assets/img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });
	*/
        return false;
        });
	</script>
	
	<script type="application/javascript">
	$(document).ready(function () {

  	  
      	    
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
  

  </body>
</html>