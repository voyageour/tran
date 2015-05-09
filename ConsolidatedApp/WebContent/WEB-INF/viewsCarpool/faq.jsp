<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<%@ include file="../../resources/includes/titleAndMeta.jsp" %>
		
		
		<!-- script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script> -->
		<script type="text/javascript" src="../resources/jQuery/jquery-1.7.2.js"></script>
		
		
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script> -->
		<script src="../resources/jQuery/jquery-ui-1.10.3.js"></script>
		
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	
	
		<link href="../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css" />
	
		<!-- MENUBAR STARTED -->
		<link rel="stylesheet" href="../../resources/SimplejQueryDropdowns/css/style.css" type="text/css" media="screen, projection"/>
		<script type="text/javascript" language="javascript" src="../../resources/SimplejQueryDropdowns/js/jquery.dropdownPlain.js"></script>
		<link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />	
		<!-- MENUBAR ENDED -->

		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
	    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
	    <!-- <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" /> -->
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
		
		<!-- FEEDBACK PLUGIN START -->
			<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
			<script>
			$(document).ready(function() {
			      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
			});
			</script>
			<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
		<!-- FEEDBACK PLUGIN END -->

	<!-- BUS FARE DIALOG START -->
	<script type="text/javascript">
	$(function(){			
		$("#dialog").dialog({ autoOpen: false });
		$("#busFare").click(function(){
			 $("#dialog").dialog('open');
                return false;
		});		    
	});
	</script>
	<!-- BUS FARE DIALOG END -->
	
		<script type="text/javascript">
        $(document).ready(function(){
            $(".dropdown").hover(            
                function() {
                    $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                    $(this).toggleClass('open');        
                },
                function() {
                    $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
                    $(this).toggleClass('open');       
                }
            );
        });
       </script>
        
        <style type="text/css">
        	.navbar-fixed-top{
        		background-color: #f8f8f8;
				border-color: #e7e7e7;
        	}
        </style>
        
        
    <script type="text/javascript">
    $(document).ready(function(){
		$("#appSelection").on('change', function() {
		   
		    if(this.value==0){ //TRANSPORT
		    	document.location.href = "../transport/home";		    	
		    }else{ //CARPOOL
		    	document.location.href = "../carpool/home";
		    }
		});
    });
	</script>
	
	
	<script type="text/javascript">
    $(document).ready(function(){
		if($("#appSelection").val()==0){
			$("#menuCarpool").css("display","none");
	    	$("#menuTransport").css("display","block");
	    	
	    	$("#header_right_transport").css("display","block");
	    	$("#header_right_carpool").css("display","none");
	    	
		}else{
			$("#menuCarpool").css("display","block");
	    	$("#menuTransport").css("display","none");
	    	
	    	$("#header_right_carpool").css("display","block");
	    	$("#header_right_transport").css("display","none");
	    	
		}
    });
	</script>
	
	
	
	<style type="text/css">
	.dropDownApp{	
		display: block;
		width: 100%;
		height: 34px;
		padding: 6px 12px;
		font-size: 14px;
		line-height: 1.428571429;
		color: #555;
		vertical-align: middle;
		background-color: #fff;
		background-image: none;
		border: 1px solid #ccc;
		border-radius: 4px;
		margin-top: 7px;
	}
	</style>
	
	</head>








	<body id="home">
		
<sec:authorize var="loggedIn" access="isAuthenticated()" />
	<nav class="navbar-default-custom navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#"></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right">
			  
			  		<c:choose>
						<c:when test="${loggedIn}">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%= request.getUserPrincipal().getName() %><span class="caret"></span></a>
					 			<ul class="dropdown-menu" role="menu">
				                  <li><a href="<c:url value="/j_spring_security_logout"/>">Sign Out</a></li>
				                </ul>	
			                </li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="../login.jsp" id="login" style="color: black;"> <b>Login</b> </a>
							</li>
						</c:otherwise>
					</c:choose>
           	
	       		<li>
		           	<select class="dropDownApp" name="appSelection" id="appSelection">
					  <option value="0">Transport</option>
					  <option value="1" selected="selected">Carpool</option>
					</select>
	           	</li>
          </ul>
          
        </div>
      </div>
    </nav>

	
		<%@ include file="../../resources/includes/busFareDialog.jsp" %>
		<div id="templatemo_wrapper">
    		<%@ include file="../../resources/includes/header.jsp" %> 
   	 		<%@ include file="../../resources/includes/userMenu.jsp" %>
    		<div style="margin: 20px;"></div>
			<div id="templatemo_main_top"></div>
    		<div id="templatemo_main">
       			<div id="content" style="width: 90%;">        
        			<table width="100%" border="0" align="center" style="padding: 10px 10px 10px 10px;" cellpadding="20">
				
					<tr>
						<td height="100px" style="padding: 10px; border-bottom: thin; border-bottom-color: green; border-bottom-width: 5px;">  
							<font style="font-weight: bold; line-height: 25px;">Q 1: What is Carpooling? </font><br/> 

							<font style="font-weight: bold;">Answer: </font>
								
							Carpooling (also known as car-sharing, ride-sharing, lift-sharing and covoiturage), is the sharing of car journeys so that more than one person travels in a car.
							By having more people using one vehicle, carpooling reduces each person's travel costs such as fuel costs, tolls, and the stress of driving. 
							Carpooling is also seen as a more environmentally friendly and sustainable way to travel as sharing journeys reduces carbon emissions, traffic congestion on the roads, and the need for parking spaces. 
							Authorities often encourage carpooling, especially during high pollution periods and high fuel prices.
							
						</td>
					</tr>
					
					<tr>
						<td>
							<hr>	
						</td>
					</tr>
					
					
					<tr>
						<td height="130px">
							<font style="font-weight: bold; line-height: 25px;">Q 2: What are the benefits of Carpooling? </font><br/>
						
							<font style="font-weight: bold;">Answer: </font> 				
						<ol>

							<li>
								<strong style="color: green">Carpooling will save YOU money </strong> as your travel expenses will be distributed among all the travellers travelling with you.  							 
							</li>
							<br>
							<li>
							<strong style="color: green">Carpooling is better for the environment </strong>as it helps in having fewer cars on the road which help decreasing CO2 Emission and improved air quality.  
							</li>
							<br>
							<li>
							<strong style="color: green">It's good for your health </strong> (According to Environment Canada, air pollution caused by vehicular travel is linked to a number of health concerns 
							including respiratory diseases, cardiovascular disease, allergies and neurological effects.
							</li>
							<br>
							<li>
							<strong style="color: green">Carpooling improves your commuting options </strong>
							Carpooling offers a commuter option that may work better than other methods of transportation. Carpooling works best for people who live where transit service may be limited or non-existent and compared to other options, carpooling may better fit your schedule.
							</li>
							<br>
							
							<li>
							<strong style="color: green">Make new friends</strong>
							</li>
							
							<li>
							<strong style="color: green">Carpooling saves from traffic chaos</strong>
							</li>
						</ol>
						</td>
					</tr>
					
					<tr>
						<td>
							<hr>	
						</td>
					</tr>

					
					<tr>
						<td height="70px">	
							<font style="font-weight: bold; line-height: 25px;">Q 3: I am in need of Carpooler, How do I search any carpooler on my route? </font><br/>
							<font style="font-weight: bold;">Answer: </font>
							
							At home page you have option to enter your Search criteria<br>
							<img alt="" src="../../images/faq/searchExplain_.png" width="800px" height="300px">
							 
						</td>
					</tr>						
				
					<tr>
						<td>
							<hr>	
						</td>
					</tr>
				
						
					<tr>
						<td height="70px"><font style="font-weight: bold; line-height: 25px;">	
							Q 4: I have Bike/Car and want to Carpool, How can I do? </font><br/>
							<font style="font-weight: bold;">Answer: </font> 
							At home page you will find Let's Pool It Button, click on it.<br>
							<img alt="" src="../../images/faq/i_am_carpooler_.png" width="800px" height="300px">
							<br><br>
								
								<strong>After clicking on Let's pool it Button, you will find below options,</strong>
								<br><br>
								
								
								When you want to Carpool?<br><br> 
								<img alt="" src="../../images/faq/carpoolingOn.PNG" width="800px" height="200px">
								<br>
								<ol>
									<li>
									<strong>Always On Specific Days. </strong> If you want to Carpool Daily, or say for Eg, only on Mon, Tue, Wed then just Select Always On Specific Days and specify days when you want to Carpool.
									</li>								
									<br>
									<li>
										<strong>On specific dates.</strong> If you want to Carpool on specific date <br>(this option will help you for long journeys, If you are going from Bangalore to Mysore on 28th March, 2013 and in need of Carpool at this route, for the purpose of fuel sharing as example.), <br>then just Select On specific dates and specify date where it prompt you. 
									</li>
								</ol>
								
								<br><br>
								
								<img alt="" src="../../images/faq/std1.png" width="800px" height="300px">
								
								<br><br>
								
								<img alt="" src="../../images/faq/returnStd.PNG" width="800px" height="300px">
								
								
							<br>
						</td>
					</tr>

					<tr>
						<td>
							<hr>	
						</td>
					</tr>
					
					
					<tr><td height="70px"><font style="font-weight: bold; line-height: 25px;">						
						Q 5: All Seats are filled in my Car and Still I am getting Request for Carpooling, How can I hide myself as a Carpooler.? </font><br/>
						<font style="font-weight: bold;">Answer: </font> 
						
						At home page you will see carpool Setting option like shown below.<br><br>
						
						<img alt="" src="../../images/faq/carpoolSetting_.png	" width="800px" height="300px">
						
						<br><br><br>
						then you will find option on that page like shown below,
						<br><br>
						
						<img alt="" src="../../images/faq/stdHide.PNG	" width="800px" height="300px">
					</td></tr>
					
					<tr>
						<td>
							<hr>	
						</td>
					</tr>
					
					
					<tr><td height="70px"><font style="font-weight: bold; line-height: 25px;">							
						Q 6: I found a Carpooler who is useful to me and I can travel with him/her, how can I contact Carpooler, where I can find details of Carpooler? </font><br/> 
						<font style="font-weight: bold;">Answer: </font> 
						You can search for Carpooler as shown on FAQ Question No 3.
						
						You will Land on page shown below,
						
						<br><br>
						<img alt="" src="../../images/faq/carpoolerDetails.PNG" width="800px" height="400px"> 
						<br><br>
						
					</td></tr>
				
					
					<tr>
						<td>
							<hr>	
						</td>
					</tr>
					
					
					<tr><td height="70px"><font style="font-weight: bold; line-height: 25px;">							
						Q 7: I want to change my profile Picture, Where I can find an option to change such? </font><br/> 
						<font style="font-weight: bold;">Answer: </font> 
			
						<br><br>
							<img alt="" src="../../images/faq/accountSetting_.png" width="800px" height="200px"> 
						<br><br>
						
					</td></tr>
			
					<tr>
						<td>
							<hr>	
						</td>
					</tr>
			
					
					<tr><td height="70px"><font style="font-weight: bold; line-height: 25px;">						
						Q 8: How to see Carpooler Details? </font><br/> 
						<font style="font-weight: bold;">Answer: </font>

						After clicking on Details link that you will find on Question No 6. 		
						
						There are 3 tabs. 
						<ol>
							<li>
							Carpooler Details.
							<br>
							This tab will provide you Carpooler Details.
							</li>
							<br>
							<li>
							Route Details.
							<br>
							This tab will provide you Carpooler Route Details like Carpooler Start PLace, Destination place, Start Timing, is Seat Vaccant on Carpooler Car etc.
							
							</li>
							<br>
							<li>
							 Contact Carpooler
							 <br>
							 With the help of this Tab yiu can contact Carpooler by providing subject and body of mail. 
							</li>
							
						</ol>
						<br><br>
							<img alt="" src="../../images/faq/carpoolerDetailsTomcat.PNG" width="800px" height="300px"> 
						<br><br>
						
					</td></tr>
			
					<tr>
						<td>
							<hr>	
						</td>
					</tr>
			
					
					<tr><td height="70px"><font style="font-weight: bold; line-height: 25px;">											
						Q 9: I have Questions and want to Contact Carpool Team? </font><br/>
						<font style="font-weight: bold;">Answer: </font> You can contact Carpool Team by clicking on Contact Us link on header.
						<br>
						You can also do Live Chat with Carpooler Team by clicking on Live Chat option under Contact Us link. 
						<br><br>
						
						
						If you have other questions, please feel free to contact us.						
					</td></tr>
					
			
				  		
				  	</table>
					
        		</div> <!-- END of content -->
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->
    
			<%@ include file="../../resources/includes/footer.jsp" %>
		</div>

	</body>
</html>
