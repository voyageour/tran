<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../../resources/includes/titleAndMeta.jsp" %>

		

	<!--  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script> -->
	<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
		
	<!-- JQUERY -->
	<script type="text/javascript" src="../../resources/jQuery/jquery-1.7.2.js"></script>
	<script src="../../resources/jQuery/jquery-ui-1.10.3.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<link rel="stylesheet" href="../../resources/jQuery/jquery-ui.min.css" />
		
	

	<!-- BOOOTSTRAP -->
 	<!-- <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
	<link href="../../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />

	
	<!-- MENUBAR STARTED -->
	<link rel="stylesheet" href="../../resources/SimplejQueryDropdowns/css/style.css" type="text/css" media="screen, projection"/>
	<script type="text/javascript" language="javascript" src="../../resources/SimplejQueryDropdowns/js/jquery.dropdownPlain.js"></script>
	<link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />	
	<!-- MENUBAR ENDED -->
	
		
	<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
    <script type="text/javascript" src="../../resources/token-input/src/jquery.tokeninput.js"></script>
    <link rel="stylesheet" href="../../resources/token-input/styles/token-input.css" type="text/css" />
    <link rel="stylesheet" href="../../resources/token-input/styles/token-input-facebook.css" type="text/css" />
	<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
	
	
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


<body id="subpage">
	
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
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	
        <div id="sidebar" style="float: right;">
   	    <h3>Live Chat</h3>
            <ul class="sidebar_menu">
			    <!-- Start InstanteStore LiveChat -->

				<div class="live" id="InstanteStoreLiveChat">
					<a href="http://www.instantestore.com/livechat_software.cfm"
						target="_blank"> Live Chat Software </a>
				</div> <script defer="defer" type="text/javascript"
					src="//livechat.iestorechat.com/r/5348/536843CCBFF2FD75DF8469B9EB2E8FD1/"></script>
		
				<!-- End InstanteStore LiveChat -->
			</ul>
            <h3>Address</h3>
            <p></p>
            <div id="newsletter">
              <table width="300px" border="0" align="left">
				<tr style="padding: 20px;">
					<td align="left" valign="top" style="font-weight: bold; font-size: 14px;">Email</td>
					<td>patel286@avaya.com</td>
				</tr>
				<tr>
					<td align="left" valign="top" style="font-weight: bold; font-size: 14px;">Mob Num</td>
					<td>+91 9545211071</td>
				</tr>
			</table>					
            </div>
        </div> <!-- END of sidebar -->
        
        <div id="content" style="width: 550px;">
        	<h2>Contact Information</h2>
			
            <div class="col col_13" style="width: 500px;">
            <p>
            	The success of using Public/Company Transport depends upon the participation of the community. 
            	Be a active member in keeping environment green and clean.
            </p>
            <div id="contact_form">
               <form method="post" name="contact" action="#">
                    
                 <!--    <label for="author">Name:</label> <input type="text" id="author" name="author" class="required input_field" />
                    <div class="cleaner h10"></div> -->
						
<!--                     <label for="email">Email:</label> 
                    <input type="text" id="email" name="email" class="validate-email required input_field" />
                    <div class="cleaner h10"></div>
 -->                        
                   <!--  <label for="subject">Subject:</label> <input type="text" name="subject" id="subject" class="input_field" />
                    <div class="cleaner h10"></div> -->
        
                    <label for="text">Message:</label> 
                    	<textarea id="text" name="text" rows="0" cols="0" class="required" style="width: 450px;"></textarea>
                    <div class="cleaner h10"></div>
 					
					<input type="submit" value="Send" id="submit" name="submit" class="submit_btn float_l" />
					<!-- <input type="reset" value="Reset" id="reset" name="reset" class="submit_btn float_r" /> -->
					
                </form>
            </div>
		</div>
        
        <div class="cleaner h30"></div>
        
<!--         <iframe width="660" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
        	src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=new+york+central+park&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=60.158465,135.263672&amp;vpsrc=6&amp;ie=UTF8&amp;hq=&amp;hnear=Central+Park,+New+York&amp;t=m&amp;ll=40.769606,-73.973372&amp;spn=0.014284,0.033023&amp;z=14&amp;output=embed">
        </iframe>
 -->            
        </div> <!-- END of content -->
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
  	<%@ include file="../../resources/includes/footer.jsp" %>
   
</div>

</body>
</html>