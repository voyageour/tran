

<?php



$action = $_GET['action'];		
$profileId = $_GET['profileId'];		

if($action != null && $profileId !=null){

	if($action == "modify"){
	
		?>



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
		//alert("UPLOADING");
//		document.getElementById('f1_upload_form').style.visibility = 'hidden';
//		document.getElementById('sliderWrap').style.visibility = 'hidden';
//		document.getElementById('f1_upload_process').style.visibility = 'visible';
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




<script type="text/javascript">
    function show_alert() {
    var msg = "Relationship Assigned Successfully";
    alert(msg);
    }
</script>



<script type="text/javascript">
    function validateForm() {
	
		var fname = document.getElementById("fname").value.replace(/^\s+|\s+$/g,'');
		
		var mname = document.getElementById("mname").value.replace(/^\s+|\s+$/g,'');
		var lname = document.getElementById("lname").value.replace(/^\s+|\s+$/g,'');
		var datepicker1 = document.getElementById("datepicker1").value.replace(/^\s+|\s+$/g,'');
		var mobile_no = document.getElementById("mobile_no").value.replace(/^\s+|\s+$/g,'');
		var landline_no = document.getElementById("landline_no").value.replace(/^\s+|\s+$/g,'');
		
		var address = document.getElementById("address").value.replace(/^\s+|\s+$/g,'');
		var email_id = document.getElementById("email_id").value.replace(/^\s+|\s+$/g,'');
		var occupation = document.getElementById("occupation").value.replace(/^\s+|\s+$/g,'');
		var occupation_desc = document.getElementById("occupation_desc").value.replace(/^\s+|\s+$/g,'');
		var qualification = document.getElementById("qualification").value.replace(/^\s+|\s+$/g,'');
		
		
		if(fname==null || fname==''){
			alert("Please enter first name.");
			document.getElementById("fname").value="";
			document.getElementById("fname").focus();
				
			return false;
		}

		
		if(/[\d]/.test(fname)){
			alert("First name should not contain numbers.");
			document.getElementById("fname").value="";
			document.getElementById("fname").focus();
				
			return false;		
		}

		if(mname==null || mname==''){
			alert("Please enter middle name.");
			document.getElementById("mname").value="";
			document.getElementById("mname").focus();

			return false;
		}

		
		if(/[\d]/.test(mname)){
			alert("Miiddle name should not contain numbers.");
			document.getElementById("mname").value="";
			document.getElementById("mname").focus();
				
			return false;		
		}

		if(lname==null || lname==''){
			alert("Please enter last name.");
			document.getElementById("lname").value="";
			document.getElementById("lname").focus();

			return false;
		}
		
		
		if(/[\d]/.test(lname)){
			alert("Last name should not contain numbers.");
			document.getElementById("lname").value="";
			document.getElementById("lname").focus();
				
			return false;		
		}
		
		if(datepicker1==null || datepicker1==''){
			alert("Please enter Date of birth.");
			document.getElementById("datepicker1").value="";
			document.getElementById("datepicker1").focus();

			return false;
		}

		
		
		
		if(mobile_no != ""){
			
			if (isNaN(mobile_no)) { 
				alert("Mobile number contains illegal characters."); 
				document.getElementById("mobile_no").value="";
				document.getElementById("mobile_no").focus();

				return false; 
			} 
			
			if (!(mobile_no.length == 10)) { 
				alert("Mobile number is of wrong length. \nPlease enter 10 digit mobile no."); 
				document.getElementById("mobile_no").value="";
				document.getElementById("mobile_no").focus();
				return false; 
			} 	
		}

		
		if(landline_no!=null || landline_no!=''){
			
			if (isNaN(landline_no)) { 
				alert("Landline number contains illegal characters."); 
				document.getElementById("landline_no").value="";
				document.getElementById("landline_no").focus();

				return false; 
			} 
			
		}		

		if(address==null || address==''){
			alert("Please enter Address.");
			document.getElementById("address").value="";
			document.getElementById("address").focus();

			return false;
		}


		if(email_id != ""){
			var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;  
			if(reg.test(email_id) == false) { 
				alert('Invalid Email Address'); 
				document.getElementById("email_id").value="";
				document.getElementById("email_id").focus();
				return false; 
			} 
		} 

		if(occupation==null || occupation == ""){
			alert("Please enter Occupation.");
			document.getElementById("occupation").value="";
			document.getElementById("occupation").focus();

			return false;
		}


		if(occupation_desc==null || occupation_desc == ""){
			alert("Please enter Occupation Description.");
			document.getElementById("occupation_desc").value="";
			document.getElementById("occupation_desc").focus();

			return false;
		}		
		
		if(qualification==null || qualification == ""){
			alert("Please enter Qualification.");
			document.getElementById("qualification").value="";
			document.getElementById("qualification").focus();

			return false;
		}
		
		return true;
    }
</script>



</head>

<body>

	<!--
	<form method="post" action="insert_user_details.php" name="form"
		enctype="multipart/form-data" target="upload_target"
		onsubmit="startUpload()">
-->
	<form method="post" action="updateUserDetails.php" name="form"
		enctype="multipart/form-data" onsubmit="return validateForm()">

		<input type="hidden" name="profile_id"
			value="<?php echo $_GET['profileId'] ?>">
		<center>

			<!--LOGIN SLIDER START-->
			<?php //include("shared_files/loginSlider.php"); ?>
			<?php //include("support_files/LoginSlider/signout.php"); ?>

			<a href="logout.php"
				style="position: relative; text-align: right; left: 450px; color: red;">Logout</a>
			<!--LOGIN SLIDER END-->


			<div id="f1_upload_process">
				Loading...<br /> <img src="../images/loading/loader.gif"
					alt="not found" /><br />
			</div>

			<?php			
	if(isset($_GET['data_insertion_status'])){
		
	
		if(($_GET['data_insertion_status'])=="0"){
			echo "<label style=\"color:red;\">Data Inserted Successfully</label><br><br>";
		} 
		
		if(($_GET['data_insertion_status'])=="2"){
			echo "<label style=\"color:red;\">Data Insertion Failed...Image uploaded size is greater 1 MB. Please try again later...</label><br><br>";
		
		}
		
		if(($_GET['data_insertion_status'])=="1"){
			echo "<label style=\"color:red;\">Data Insertion Failed...Image extension is not among jpg, jpeg, png, gif. Please try again later...</label><br><br>";
		
		}
		
		if(($_GET['data_insertion_status'])=="3"){
			echo "<label style=\"color:red;\">Data Insertion Failed...Technical error. Please try again later...</label><br><br>";
		
		}
		
		if(($_GET['data_insertion_status'])=="4"){
			echo "<label style=\"color:red;\">Data Insertion Failed....Technical error, while saving data in DB, Please try again later...</label><br><br>";
		
		}
		
		if(($_GET['data_insertion_status'])=="5"){
			echo "<label style=\"color:red;\">Data Insertion Failed....User with same name and nokh is already present...</label><br><br>";
		
		}
		
	}

	if(isset($_GET['eventAddStatus'])){
		if(($_GET['eventAddStatus'])=="1"){
			echo "<br/><br/>Event Added Successfully";
		}else{
			echo "<br/><br/>Event Insertion Failed...Please try again later...";
		}
	}
	
	if(isset($_GET['relationAssignStatus'])){
		if(($_GET['relationAssignStatus'])=="1"){
			//echo "<br/><br/>Relationship Assigned Successfully";				
			echo '<script type="text/javascript"> show_alert(); </script>';
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
																			<!--DATA START FOR KENDOUI TABSTRIP --> <?php include("shared_files/family_details/fmly_details0_edit.php"); ?>
																			<!--DATA END FOR KENDOUI TABSTRIP -->
																		</td>
																	</tr>
																</table>


															</td>
														</tr>

														<tr>
															<td align="left" valign="top">
																<!--<iframe
																	id="upload_target" name="upload_target" src="#"
																	style="width: 0; height: 0; border: 0px solid #fff;">
															</iframe>
															-->
															</td>
														</tr>

														<tr>
															<td>

																<center>
																	<input type="submit" id="submit1" value="Submit"
																		name="submit"> <input type="button"
																		id="submit" value="Assign Relationship"
																		onclick="copyText()">
																</center> <br /> <br />

															</td>
														</tr>

													</table>
												</td>
											</tr>
											<tr>
												<td align="center" valign="top" bgcolor="#FFFFFF"
													class="_label"><span class="_label_add"> <?php include("shared_files/footerText.php"); ?>
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

<?php
		 	
	}
		
	if($action == "delete"){				
		$deleteUserQuery = "DELETE FROM user_profile_info WHERE profile_id=$profileId";		 
		 if(mysql_query($deleteUserQuery)){
			header("location: home_ForEdit.php?data_deletion_status=0");	
		 }else{
			header("location: home_ForEdit.php?data_deletion_status=1");	
		 }	 
	}
}else{
	header("location: home_ForEdit.php?data_modification_status=0");	
}
?>
