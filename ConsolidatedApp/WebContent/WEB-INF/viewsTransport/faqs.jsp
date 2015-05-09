<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
	
		<!-- SCROLLING EVENTS STARTED -->	 
		 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
		<link rel="stylesheet" href="../resources/scrollingNews/style.css" type="text/css" media="screen" />
		<script src="../resources/scrollingNews/jcarousellite_1.0.1c4.js" type="text/javascript"></script>
		<script src="../resources/scrollingNews/action.js" type="text/javascript"></script>	
		<!-- SCROLLING EVENTS ENDED -->	
		
		<!-- Start WOWSlider.com HEAD section -->
			<link rel="stylesheet" type="text/css" href="../resources/imageSliderAtTestimonialPage/engine1/style.css" />
		<!-- End WOWSlider.com HEAD section -->
	
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
		    <!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> -->
		    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" />
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
	
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
		<script type="text/javascript">
		$(function(){
			
			$("#dialog").dialog({ autoOpen: false });
			
			$("#busFare").click(function(){
				 $("#dialog").dialog('open');
	                return false;
			});	
					    
		});
		</script>
	
			<!-- FEEDBACK PLUGIN START -->
			<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
			<script>
			$(document).ready(function() {
			      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
			});
			</script>
			<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
		<!-- FEEDBACK PLUGIN END -->
	
	
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
		}else{
			$("#menuCarpool").css("display","block");
	    	$("#menuTransport").css("display","none");
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
					
              
<!--               <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transport <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Carpool</a></li>
                </ul>
              </li> -->
           	
	           	<li>
		           	<select class="dropDownApp" name="appSelection" id="appSelection">
					  <option value="0" selected="selected">Transport</option>
					  <option value="1">Carpool</option>
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
   	 		
   	 		 <div class="cleaner h20"></div>
    		<div style="margin: 20px;"></div>
			<div id="templatemo_main_top"></div>
    		<div id="templatemo_main">
       			<div id="content" style="width: 90%;">        
        			<table width="100%" border="0" align="center">
				  		<tr>
				    		<td width="20px" rowspan="3" valign="top">
				    			1.
				    		</td>
				    		<td><b>What is OnMobile Transport Website Regarding ?</b></td>
				  		</tr>
				  		<tr>
				   	 		<td>It is regarding one stop solution for all Transport Related facilities.</td>
				  		</tr>
				  		<tr style="height: 50px;">
				    		<td><hr></hr></td>
						</tr>
						<tr>
				    		<td width="20px" rowspan="3" valign="top">
				    			2.
				    		</td>
				    		<td><b>What is OnMobile Transport Website Regarding ?</b></td>
				  		</tr>
				  		<tr>
				   	 		<td>It is regarding one stop solution for all Transport Related facilities.</td>
				  		</tr>
				  		<tr style="height: 50px;">
				    		<td><hr></hr></td>
						</tr>
					</table>
					
        		</div> <!-- END of content -->
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->
    
			<%@ include file="../../resources/includes/footer.jsp" %>
		</div>

	</body>
	
</html>