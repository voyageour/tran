 <div id="menuTransport"  style="display: none;">
 	<ul class="dropdown" >
        	<li><a href="/ConsolidatedApp/jsp/transport/home" class="selected">Home</a></li>
        	<!-- <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li> -->
            
            <li><a href="#" class="selected">Transport</a>
        		<ul class="sub_menu">
        			 <li><a href="transportTeam">Team</a></li>
                    <li><a href="#" id="busFare">Bus Fare</a></li>
                    <li><a href="transportTeam" id="">Request Bus Pass</a></li>
                    <li><a href="cabBooking" id="">Request Cab Booking</a></li>
        		</ul>
        	</li>
        	<li><a href="userStats">Statistics</a></li>
			<li><a href="faq">FAQs</a></li>
			<li><a href="contactUs">Contact</a></li>
           	<sec:authorize access="hasRole('ROLE_ADMIN')">
		   		<li style="float: right">
		   			<a href="admin/ae/adminHome">Admin Panel</a>
           		</li>
			</sec:authorize>
            <li style="float: right">
		   		<a href="myDashboard">
           			Inbox
           		</a>
			</li>
       	</ul>
 </div>
 
 <!-- <div id="menuTransport">
 <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="/ConsolidatedApp/jsp/transport/home" class="selected">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transport<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
					<li><a href="transportTeam">Team</a></li>
                    <li><a href="#" id="busFare">Bus Fare</a></li>
                    <li><a href="transportTeam" id="">Request Bus Pass</a></li>
                    <li><a href="cabBooking" id="">Request Cab Booking</a></li>
                </ul>
              </li>
			  <li><a href="userStats">Statistics</a></li>
			  <li><a href="faq">FAQs</a></li>
			  <li><a href="contactUs">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
	            <li>
	            	<sec:authorize access="hasRole('ROLE_ADMIN')">
				   		<a href="admin/adminHome">
	            			Admin Panel
	            		</a>
					</sec:authorize>
	            </li>
	            <li>
			   		<a href="myDashboard">
	           			Inbox
	           		</a>
				</li>
            </ul>
          </div>
        </div>
      </nav>
  </div>
 -->  
  
<%--    <div id="menuCarpool" style="display: none;">
 <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="/ConsolidatedApp/jsp/carpool/home" class="selected">Home</a></li>
              <li><a href="faq.jsp">FAQ</a></li>
              <sec:authorize access="isAuthenticated()">
	              <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My Account<span class="caret"></span></a>
	                <ul class="dropdown-menu" role="menu">
						<li><a href="profileSettings.jsp">Account Settings</a></li>
						<li><a href="carpoolSettings.jsp">Carpool Settings</a></li>
	                </ul>
	              </li>
              </sec:authorize> 
            </ul>
            <ul class="nav navbar-nav navbar-right">	            
            	<c:choose>
				  		<c:when test="${ providingCarpool ne true }">
					    	<li><a href="letspoolit.jsp" class="classname1">I have Car & want to Pool</a></li>
				  		</c:when>
				  		<c:otherwise>
			  				<li><img width="110px"  height="90px" src="../images/good_job/9089039-3d-good-job-crossword-on-white-background.jpg" alt="" ></li>	
				  		</c:otherwise>
			  	</c:choose>
            </ul>
          </div>
        </div>
      </nav>
  </div>
   --%>
  
  
  
   <div id="menuCarpool"  class="navbar navbar-default" style="display: none;">
 	<ul class="dropdown" >
        	<li><a href="/ConsolidatedApp/jsp/carpool/home" class="selected">Home</a></li>
       		<li><a href="faq.jsp">FAQ</a></li>
            <sec:authorize access="isAuthenticated()">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle">My Account</a>
                <ul>
					<li><a href="profileSettings.jsp">Account Settings</a></li>
					<li><a href="carpoolSettings.jsp">Carpool Settings</a></li>
                </ul>
              </li>
            </sec:authorize>
            	<c:choose>
				  		<c:when test="${ providingCarpool ne true }">
					    	<li><a href="letspoolit.jsp" class="classname1">I have Car & want to Pool</a></li>
				  		</c:when>
				  		<c:otherwise>
			  				<li><img width="110px"  height="90px" src="../images/good_job/9089039-3d-good-job-crossword-on-white-background.jpg" alt="" ></li>	
				  		</c:otherwise>
			  	</c:choose>
            

       	</ul>
 </div>
  