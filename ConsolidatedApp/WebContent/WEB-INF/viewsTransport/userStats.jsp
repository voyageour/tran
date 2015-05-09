<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="../../resources/includes/titleAndMeta.jsp" %>
	
	<!-- script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script> -->
	<script type="text/javascript" src="../resources/jQuery/jquery-1.7.2.js"></script>
	
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script> -->
	<script src="../resources/jQuery/jquery-ui-1.10.3.js"></script>
	
	
	<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
	<link rel="stylesheet" href="../resources/jQuery/jquery-ui.min.css" />


	<link href="../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css" />

		
			<!-- MENUBAR STARTED -->
			<link rel="stylesheet" href="../../resources/SimplejQueryDropdowns/css/style.css" type="text/css" media="screen, projection"/>
			<script type="text/javascript" language="javascript" src="../../resources/SimplejQueryDropdowns/js/jquery.dropdownPlain.js"></script>
			<link href="../../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />	
			<!-- MENUBAR ENDED -->
			
		<!-- FEEDBACK PLUGIN START -->
			<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
			<script>
			$(document).ready(function() {
			      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
			});
			</script>
			<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
		<!-- FEEDBACK PLUGIN END -->
		

		<style>
			.myButton {
				-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
				-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
				box-shadow: inset 0px 1px 0px 0px #ffffff;
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff
					), color-stop(1, #f6f6f6) );
				background: -moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',
					endColorstr='#f6f6f6', GradientType=0 );
				background-color: #ffffff;
				-moz-border-radius: 6px;
				-webkit-border-radius: 6px;
				border-radius: 6px;
				border: 1px solid #dcdcdc;
				display: inline-block;
				color: #666666;
				font-family: arial;
				font-size: 15px;
				font-weight: bold;
				padding: 6px 24px;
				text-decoration: none;
				text-shadow: 0px 1px 0px #ffffff;
			}
			
			.myButton:hover {
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6
					), color-stop(1, #ffffff) );
				background: -moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6',
					endColorstr='#ffffff', GradientType=0 );
				background-color: #f6f6f6;
			}
			
			.myButton:active {
				position: relative;
				top: 1px;
			}
		</style>

		<style type="text/css">
			#search-box {
			    position: relative;
			    width: 100%;
			    margin: 0;
			}
			#search-form {
			    height: 40px;
			    border: 1px solid #999;
			    -webkit-border-radius: 5px;
			    -moz-border-radius: 5px;
			    border-radius: 5px;
			    background-color: #fff;
			    overflow: hidden;
			}
			
			#search-text {
			    font-size: 14px;
			    color: #ddd;
			    border-width: 0;
			    background: transparent;
			}
			
			#search-box input[type="text"] {
			    width: 90%;
			    padding: 11px 0 12px 1em;
			    color: #333;
			    outline: none;
			}
			
			#search-button {
			    position: absolute;
			    top: 0;
			    right: 0;
			    height: 42px;
			    width: 80px;
			    font-size: 14px;
			    color: #fff;
			    text-align: center;
			    line-height: 42px;
			    border-width: 0;
			    background-color: #999;
			    -webkit-border-radius: 0px 5px 5px 0px;
			    -moz-border-radius: 0px 5px 5px 0px;
			    border-radius: 0px 5px 5px 0px;
			    cursor: pointer;
			}
			.slidingDiv {
			    height:300px;
			   /*  background-color: #99CCFF; */
			    padding:20px;
			    margin-top:10px;
			    /* border-bottom:5px solid #3399FF; */
			}	 
			.show_hide {
			    display:none;
			}			
		</style>
		
		<!-- FOR DROPDOWN START -->
		<!--   <style>		 
		    ol li {list-style: decimal outside;}
		    ul li { margin-left: 1em; }
		    ol li { margin-left: 1.25em; }
		    div.side-by-side { width: 100%; margin-bottom: 1em; }
		    div.side-by-side > div { float: left; width: 50%; }
		    div.side-by-side > div > em { margin-bottom: 10px; display: block; }
		    .clearfix:after {
		      content: "\0020";
		      display: block;
		      height: 0;
		      clear: both;
		      overflow: hidden;
		      visibility: hidden;
		    }
  		</style>-->
  		<link rel="stylesheet" href="../resources/dropdown-charts/chosen.css" />      
  		<!-- FOR DROPDOWN END -->

		<!-- FOR LINE CHART START -->
		<script type="text/javascript">
			$(function () {
		        $('#container').highcharts({
		            chart: {
		                type: 'column'
		            },
		            title: {
		                text: '<%= request.getAttribute("chartTitle") %>'
		            },
		            subtitle: {
		                text: 'Source: <%= request.getAttribute("sourceName") %>'
		            },
		            xAxis: {
		                categories: <%= request.getAttribute("routeName") %>
		            },
		            yAxis: {
		                min: 0,
		                title: {
		                    text: 'Number Of Persons'
		                }
		            },
		            tooltip: {
		                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                    '<td style="padding:0"><b>{point.y:.0f} persons</b></td></tr>',
		                footerFormat: '</table>',
		                shared: true,
		                useHTML: true
		            },
		            plotOptions: {
		                column: {
		                    pointPadding: 0.2,
		                    borderWidth: 0
		                }
		            },		            
		            series: <%= request.getAttribute("barChart") %>
				});
			});
		</script>
		<script src="../../resources/chart/js/highcharts.js"></script>
		<script src="../../resources/chart/js/exporting.js"></script>
		<!-- FOR LINE CHART END -->	
		
		<!-- FOR BAR CHART START -->
		<script type="text/javascript">
			$(function () {
		    	// Radialize the colors
				Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
				    return {
				        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
				        stops: [
				            [0, color],
				            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
				        ]
				    };
				});
				
				// Build the chart
		        $('#container1').highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false
		            },
		            title: {
		                text: '<%= request.getAttribute("chartTitle") %>'
		            },
		            tooltip: {
		        	    pointFormat: ' <span style="color:{series.color}"></span>{point.y}<br/>',
		            	percentageDecimals: 0
		            },
		            plotOptions: {
		                pie: {
		                    allowPointSelect: true,
		                    cursor: 'pointer',
		                    dataLabels: {
		                        enabled: true,
		                        color: '#000000',
		                        connectorColor: '#000000',
		                        formatter: function() {
		                            return '<b>'+ this.point.name +'</b> '+ '<b> ' +this.point.y +'</b> ';
		                        }
		                    },
		                    showInLegend: false
		                }
		            },
		            series: <%= request.getAttribute("pieChart") %>
		        });
		    });
		</script> 
		<!-- FOR BAR CHART END -->



		
					
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
		    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" />
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
    	                
        		<div id="content" style="width: 96%;">
        		<h2>Statistics</h2>
		        	<div class="side-by-side clearfix">
						<form action="renderChart" method="get">
							<center>
								<table border="0">
				  					<tr>
				  						<td colspan="3"><em>Please choose the data and type of chart you want to see ... </em></td>
				  					</tr>		
					  				<tr>
					    				<td>
									    </td>
									    <td>				    
					    					<div>
												<select name="choiceOfDataAndChart" data-placeholder="Click Me ..." style="width: 550px;" class="chzn-select" multiple tabindex="6">
													<option value=""></option>
													<optgroup label="Data you want to see in chart">
														<option value="emp-bus">Employee-Bus Data</option>
													</optgroup>
													<optgroup label="Chart Type">
														<option value="bar">Bar Chart</option>
														<option value="pie">Pie Chart</option>
													</optgroup>
												</select>
											</div>
									    </td>
									    <td>
					    					<input class="myButton" type="submit" name="submit" value="submit" />
					    				</td>
					  				</tr>
								</table>
							</center>
						</form>
					</div>			

					<h2 style="font-size: 18px; padding-top: 50px;">Charts</h2>
					<div style="height: 20px;"></div>		
  					<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto; padding-bottom:50px; display: <c:if test="${barChartRender eq false}">none;</c:if>"></div>
      
        			<!-- <div style="height: 80px;"></div>		 -->
        	
        			<div id="container1" style="min-width: 400px; height: 400px; margin: 0 auto; display: <c:if test="${pieChartRender eq false}">none;</c:if>"></div> 
		    
		        </div> <!-- END of content -->
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->
    
			<%@ include file="../../resources/includes/footer.jsp" %>
      
		</div>

		<!-- DROPDOWN START -->		 
		<script src="../resources/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> 
			var config = {
			  '.chzn-select'           : {},
			  '.chzn-select-deselect'  : {allow_single_deselect:true},
			  '.chzn-select-no-single' : {disable_search_threshold:10},
			  '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
			  '.chzn-select-width'     : {width:"95%"}
			}
			for (var selector in config) {
			  $(selector).chosen(config[selector]);
			}
		</script>
		<!-- DROPDOWN END -->
 	
 	</body>
</html>