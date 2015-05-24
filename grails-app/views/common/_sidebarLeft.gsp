  <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="#"><img src="${resource(dir: 'img', file: 'ui-sam.jpg')}" class="img-circle" width="60"></a></p>
              	  <h5 class="centered">Dominic Savio Admin</h5>
              	  	
                  <li class="mt">
                      <g:link class="active" controller="administration" action="index">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                       </g:link>
                  </li>
				   <%-- <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-tasks"></i>
                          <span>Menu</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="form_component.html">Menu 1</a></li>
                          <li><a  href="form_component.html">Menu 2</a></li>
                      </ul>
                  </li>
                   --%>
                    <li class="sub-menu">
                  	<g:link controller="banner" action="index">
                          <i class="fa fa-tasks"></i>
                          <span>Banner</span>
                      </g:link>
                  </li>
                  <li class="sub-menu">
                  	<g:link controller="ministry" action="index">
                          <i class="fa fa-tasks"></i>
                          <span>Ministries</span>
                      </g:link>
                  </li>
                   <li class="sub-menu">
                  	<g:link controller="resource" action="index">
                          <i class="fa fa-tasks"></i>
                          <span>Resources</span>
                      </g:link>
                  </li>
                    <li class="sub-menu">
                  	<g:link controller="quote" action="index">
                          <i class="fa fa-tasks"></i>
                          <span>Quotes</span>
                      </g:link>
                  </li>
                   
                 
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->