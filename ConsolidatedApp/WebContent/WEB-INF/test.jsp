

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--APPLICATION WIDE INCLUSION-->
<?php include("shared_files/applicationInclusion.php"); ?>

<!-- APPLICATION WIDE CSS -->
<link rel="stylesheet" href="shared_files/applicationCSS.css"
	type="text/css" />

<link rel="stylesheet" href="support_files/menubar/menu.css"
	type="text/css" media="screen" />

<!-- LOGIN SLIDER
<link rel="stylesheet" type="text/css" href="support_files/slider/style.css" />
<script type="text/javascript" src="support_files/slider/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="support_files/slider/slide_help.js"></script>
-->
<script type="text/javascript"
	src="support_files/LoginSlider/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="support_files/LoginSlider/custom.js"></script>
<link rel="stylesheet" type="text/css"
	href="support_files/LoginSlider/style.css" />


<!--For Suggestion Box
<link rel="stylesheet" type="text/css" href="support_files/suggestion_ajax/css/style.css" />
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="support_files/suggestion_ajax/js/script.js"></script>
-->


<!-- For Tabs -->
<link href="support_files/kendoUI/examples/shared/styles/examples.css"
	rel="stylesheet" />
<link
	href="support_files/kendoUI/examples/shared/styles/examples-offline.css"
	rel="stylesheet" />
<link href="support_files/kendoUI/source/styles/kendo.common.css"
	rel="stylesheet" />
<link href="support_files/kendoUI/source/styles/kendo.default.css"
	rel="stylesheet" />
<script src="support_files/kendoUI/source/js/jquery.min.js"></script>

<script src="support_files/kendoUI/source/js/kendo.core.js"></script>
<script src="support_files/kendoUI/source/js/kendo.fx.js"></script>
<script src="support_files/kendoUI/source/js/kendo.tabstrip.js"></script>

<script src="support_files/kendoUI/source/js/kendo.popup.js"></script>
<script src="support_files/kendoUI/source/js/kendo.calendar.js"></script>
<script src="support_files/kendoUI/source/js/kendo.datepicker.js"></script>


<script>
	$(document)
			.ready(
					function() {
						var today = new Date(), birthdays = [
								+new Date(today.getFullYear(),
										today.getMonth(), 11),
								+new Date(today.getFullYear(),
										today.getMonth() + 1, 6),
								+new Date(today.getFullYear(),
										today.getMonth() + 1, 27),
								+new Date(today.getFullYear(),
										today.getMonth() - 1, 3),
								+new Date(today.getFullYear(),
										today.getMonth() - 2, 22) ];

						$("#datepicker1")
								.kendoDatePicker(
										{

											month : {
												// template for dates in month view
												content : '# if ($.inArray(+data.date, ['
														+ birthdays
														+ ']) != -1) { #'
														+ '<div class="birthday"></div>'
														+ '# } #'
														+ '#= data.value #'
											},
											footer : "Today - #=kendo.toString(data, 'd') #"

										});

						$("#datepicker1").data("kendoDatePicker").dateView.calendar.element
								.width(300);
					});
</script>

<script>
	$(document).ready(function() {
		$("#tabstrip1").kendoTabStrip({
			animation : {
				open : {
					effects : "fadeIn"
				}
			}

		});
	});
</script>

<script type="text/javascript">
	function assign_relationship() {
		alert("Inside Relation");
		Window.submit("/relation.php")
	}
</script>



<!--For Form Data-->
<style type="text/css">
._label {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 14px;
	color: #494949;
}

._label_add {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 12px;
	color: #494949;
}

.Headings {
	font-family: Tahoma, Geneva, sans-serif;
	font-size: 24px;
	color: #424242;
}
</style>


<!--TO Display Date & Time    Ref:http://www.quackit.com/javascript/tutorial/javascript_date_and_time.cfm  -->
<script src="shared_files/dateAndTime.js" type="text/javascript"></script>



<link href="support_files/LoadingBar/style/style.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript">
	function startUpload() {

		document.getElementById('f1_upload_form').style.visibility = 'hidden';
		document.getElementById('sliderWrap').style.visibility = 'hidden';
		document.getElementById('f1_upload_process').style.visibility = 'visible';

		return true;
	}

	function stopUpload(success, param1, param2, param3, param4) {
		var result = '';

		if (success == 1) {

			var url1 = param1 + "?" + param2 + "&" + param3 + "&" + param4;

			window.location = url1;

			document.getElementById('f1_upload_process').style.visibility = 'hidden';

		} else {
			alert("Server Error ...Please try Later");
		}
		return true;
	}

	function copyText() {
		window.location = "relation.php";
	}
</script>


</head>

<body>


	<form method="post" action="insert_user_details.php" name="form"
		enctype="multipart/form-data" target="upload_target"
		onsubmit="startUpload();">

		<center>

			<!--LOGIN SLIDER START-->
			<?php //include("shared_files/loginSlider.php"); ?>
			<?php //include("support_files/LoginSlider/signout.php"); ?>

			<a href="logout.php">Logouhjhjt</a>
			<!--LOGIN SLIDER END-->


			<div id="f1_upload_process">
				Loading...<br />
				<img src="../images/loading/loader.gif" alt="not found" /><br />
			</div>

			<?php			
	if(isset($_GET['data_insertion_status'])){
		if(isset($_GET['data_insertion_status'])=="1"){
			echo "<br/><br/>Data Inserted Successfully";
		}else{
			echo "<br/><br/>Data Insertion Failed...Please try again later...";
		}
	}

	if(isset($_GET['eventAddStatus'])){
		if(isset($_GET['eventAddStatus'])=="1"){
			echo "<br/><br/>Event Added Successfully";
		}else{
			echo "<br/><br/>Event Insertion Failed...Please try again later...";
		}
	}
	
	if(isset($_GET['relationAssignStatus'])){
		if(isset($_GET['relationAssignStatus'])=="1"){
			echo "<br/><br/>Relationship Assigned Successfully";
		}else{
			echo "<br/><br/>Error in Relationship Assignment..Please try again later...";
		}
	}
		
	?>

			<!--<form method="post" action="temp1.php"  name="form" enctype="multipart/form-data"  >-->

			<div id="f1_upload_form">

				<table width="100%" height="100%" align="left" border=0>

					<tr border="1" align="center" valign="middle" bordercolor="#000000">
						<td align="center" valign="top" bordercolor="#000000" border="0">

							<!--HEADER WORDS START--> <?php include("shared_files/headerWords.php"); ?>
							<!--HEADER WORDS END-->


							<table border="0" align="center" bordercolor="#000000"
								bgcolor="#FFFFFF">
								<tr bgcolor="#FFFFFF">
									<td align="center" valign="middle">



										<table bgcolor="#FFFFFF" bordercolor="#000000" border=0>


											<tr>
												<td width="911" align="right" valign="top" bgcolor="#FFFFFF">

													<table width="895" border="0" align="center">

														<tr>
															<td align="left">
																<!--WEATHER WIDGET START--> <?php  include("shared_files/weather_google.php"); ?>
																<!--WEATHER WIDGET END-->

															</td>

															<td align="right">
																<div id='ct'
																	style="color: #424242; font-family: 'Myriad Pro', Arial, Helvetica, sans-serif; font-size: 14px;">
																</div>

															</td>

														</tr>
														<tr>

															<td align="center" valign="top" colspan="2">
																<!--SUGGESTION AJAX START--> <?php //include("shared_files/suggestionAjax.php"); ?>
																<!--SUGGESTION AJAX END-->


															</td>

														</tr>

														<tr>
															<td align="right"></td>
														</tr>


														<tr>
															<td colspan="2" align="center" valign="top">
																<!--MENUBAR START HERE--> <?php include("shared_files/menu_item_blue_admin.php"); ?>
																<!--MENUBAR END HERE-->


															</td>
														</tr>
													</table>
													<table width="897" border="0" align="center">
														<tr>
															<td height="10" align="center" valign="top"><label
																class="Headings">Add Your Details</label></td>
														</tr>


														<tr>
															<td height="135" align="center" valign="top">

																<table width="100%" border="0" id="detailsTbl">
																	<tr>
																		<td>
																			<!--DATA START FOR KENDOUI TABSTRIP --> <?php include("shared_files/family_details/fmly_details0.php"); ?>
																			<!--DATA END FOR KENDOUI TABSTRIP -->
																		</td>
																	</tr>
																</table>


															</td>
														</tr>

														<tr>
															<td align="left" valign="top"><iframe
																	id="upload_target" name="upload_target" src="#"
																	style="width: 0; height: 0; border: 0px solid #fff;"></iframe>
															</td>
														</tr>

														<tr>
															<td>

																<center>
																	<input type="submit" id="submit1" value="Submit">
																	<input type="button" id="submit"
																		value="Assign Relationship" onclick="copyText()">
																</center> <br />
															<br />

															</td>
														</tr>

													</table>
												</td>
											</tr>
											<tr>
												<td align="center" valign="top" bgcolor="#FFFFFF"
													class="_label"><span class="_label_add">
														<?php include("shared_files/footerText.php"); ?>
												</span></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<p>&nbsp;</p>
						</td>
					</tr>
				</table>
			</div>

		</center>

	</form>

</body>
</html>