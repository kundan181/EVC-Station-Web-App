
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.rcpit.data.*"%>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Augment an Admin Panel Category Flat Bootstrap Responsive
	Web Template | Tables :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<link
	href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400'
	rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
<!-- /js -->
<script src="js/jquery-1.10.2.min.js"></script>
<!-- //js-->
</head>
<body>
	<div class="page-container">
		<!--/content-inner-->
		<div class="left-content">
			<div class="inner-content">
				<!-- header-starts -->
				<div class="header-section">
					<!--menu-left-->

					<!-- <div class="top_menu">
									<script type="text/javascript">
										 $('.main-search').hide();
										$('button').click(function (){
											$('.main-search').show();
											$('.main-search text').focus();
										}
										);
										$('.close').click(function(){
											$('.main-search').hide();
										});
									</script>
							/profile_details

							<div class="clearfix"></div>
							//profile_details
						</div> -->
					<!--//menu-right-->
					<div class="clearfix"></div>
				</div>
				<!-- //header-ends -->
				<!--outter-wp-->
				<div class="outter-wp">
					<!--sub-heard-part-->
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="userdashboard.html">Home</a></li>
							<li class="active">Show</li>
						</ol>
					</div>
					<!--//sub-heard-part-->
					<div class="graph-visual tables-main">
						<h3 class="inner-tittle two">All Charging Stations</h3>

						<table class="table table-bordered">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Address</th>
									<th>City</th>
									<th>Taluka</th>
									<th>District</th>
									<th>Open Time</th>
									<th>Close Time</th>
									<th>MobileNo</th>
									<th>Latitude</th>
									<th>Longitude</th>
									<th>Close Time</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>

							<!-- <div class="graph-form">
																	<div class="form-body">
																	
																		<form> 
																		<div class="form-group"> <label for="exampleInputEmail1">Enter the city</label> <input type="text" name="usercity" class="form-control" id="exampleInputEmail1" placeholder="City"> 
																	    </div> <div class="form-group"> <label for="exampleInputFile"></div> <button type="submit" class="btn btn-default">Submit</button> </form> 
																	</div>

																</div>
				 -->

							<%
																
																Connection con = ConnectDB.connect();
																try
																{
																	
																	System.out.println("hello");
																	//PreparedStatement ps = con.prepareStatement("select csname,csaddress,csopentime,csclosetime,csmobileno from csregdetail where cscity=?");
																	PreparedStatement ps = con.prepareStatement("select * from csregdetail");
																	
																	ResultSet rs = ps.executeQuery();
																	while(rs.next())
																	{
											%>
							<tr>
								<td><%=rs.getInt("csid")%></td>
								<td><%=rs.getString("csname")%></td>
								<td><%=rs.getString("csaddress")%></td>
								<td><%=rs.getString("cscity")%></td>
								<td><%=rs.getString("cstaluka")%></td>
								<td><%=rs.getString("csdistrict")%></td>
								<td><%=rs.getString("csopentime")%></td>
								<td><%=rs.getString("csclosetime")%></td>
								<td><%=rs.getString("csmobileno")%></td>
								<td><%=rs.getString("cslatitude")%></td>
								<td><%=rs.getString("cslongitutde")%></td>
								<td><%=rs.getInt("cspower")%></td>
								<td><%=rs.getString("status")%></td>
								<td><a href="appr.jsp?id=<%=rs.getInt("id") %>">Approve</a></td>
							</tr>
							<%						}	
																}
																catch(Exception e)
																{
																	e.printStackTrace();
																}
																
	%>
							</div>
							</div>
							</div>

							</div>

							</div>
							</div>

							<div class="sidebar-menu">
								<header class="logo">
									<a href="" class="sidebar-icon"> <span class="fa fa-bars"></span></a>
									<a href="index.html"> <span id="logo">
											<h1>EVC Station</h1>
									</span> <!--<img id="logo" src="" alt="Logo"/>-->
									</a>
								</header>
								<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
								<!--/down-->

								<!--//down-->
							</div>
							<div class="clearfix"></div>
							</div>
							<script>
							var toggle = true;

							$(".sidebar-icon").click(function() {
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }

											toggle = !toggle;
										});
							</script>
							<!--js -->
							<script src="js/jquery.nicescroll.js"></script>
							<script src="js/scripts.js"></script>
							<!-- Bootstrap Core JavaScript -->
							<script src="js/bootstrap.min.js"></script>
</body>
</html>