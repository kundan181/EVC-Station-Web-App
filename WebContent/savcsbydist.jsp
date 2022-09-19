
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "com.rcpit.data.*" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Augment an Admin Panel Category Flat Bootstrap Responsive Web Template | Tables :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
	<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
	<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet">
	<!-- jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'>
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
											<li><a href="subadmindashboard.html">Home</a></li>
											<li class="active">Show</li>
										</ol>
									   </div>
								  <!--//sub-heard-part-->
									<div class="graph-visual tables-main">
													<h3 class="inner-tittle two">Available Charging Stations </h3>
														  <div class="graph">
															<div class="tables">

																<table class="table table-bordered"> 
																<thead> <tr>
																 <th>Name</th> 
																<th>Address</th> 
																<th>Open Time</th>
																<th>Close Time</th>
																<th>MobileNo</th> 
																</tr> </thead>
																
																<div class="graph-form">
																	<div class="form-body">
																		<form action="savcsbydist.jsp"> 
																		<div class="form-group"> <label for="exampleInputEmail1">Enter the district</label> <input type="text" name="subadmindist" class="form-control" id="exampleInputEmail1" placeholder="District"> 
																	    </div> <div class="form-group"> <label for="exampleInputFile"></div> <button type="submit" class="btn btn-default">Find</button> </form> 
																	</div>

																</div>
				
																
	<%
																String dist=request.getParameter("subadmindist");
																Connection con = ConnectDB.connect();
																try
																{
																	
										
																	//PreparedStatement ps = con.prepareStatement("select csname,csaddress,csopentime,csclosetime,csmobileno from csregdetail where cscity=?");
																	PreparedStatement ps = con.prepareStatement("select * from csregdetail where csdistrict=?");
																	ps.setString(1,dist);
																	ResultSet rs = ps.executeQuery();
																	while(rs.next())
																	{
											%>										
																		<tr>
																			<td><%=rs.getString("csname")%></td>
																			<td><%=rs.getString("csaddress")%></td>
																			<td><%=rs.getString("csopentime")%></td>
																			<td><%=rs.getInt("csclosetime")%></td>
																			<td><%=rs.getInt("csmobileno")%></td>
																		</tr>	
											<%						}	
																}
																catch(Exception e)
																{
																	e.printStackTrace();
																}
																
	%>
			
				<div class="sidebar-menu">
					<header class="logo">
									<a href="" class="sidebar-icon"> <span class="fa fa-bars"></span></a>
									<a href="index.html"> <span id="logo">
											<h1>EVC Station</h1>
									</span>

									</a>
								</header>
								<div class="menu">
									<ul id="menu">
										<li><a href="index.html"><i class="fa fa-tachometer"></i>
												<span>Dashboard</span></a></li>
										<li id="menu-comunicacao"><a href="#"><i
												class="fa fa-smile-o"></i> <span>View CS</span><span
												class="fa fa-angle-double-right" style="float: right"></span></a>
											<ul id="menu-comunicacao-sub">
												<li id="menu-mensagens" style="width: 120px"><a
													href="savcsbycity.jsp">View by<i
														class="fa fa-angle-right"
														style="float: right; margin-right: -8px; margin-top: 2px;"></i></a>
													<ul id="menu-mensagens-sub">
														<li id="menu-mensagens-enviadas" style="width: 130px"><a
															href="savcsbycity.jsp">City</a></li>
														<li id="menu-mensagens-recebidas" style="width: 130px"><a
															href="savcsbytaluka.jsp">Taluka</a></li>
														<li id="menu-mensagens-recebidas" style="width: 130px"><a
															href="savcsbydist.jsp">District</a></li>
													</ul></li>

											</ul></li>
										<li id="menu-comunicacao"><a href="#"><i
												class="fa fa-smile-o"></i> <span>Update Data CS</span><span
												class="fa fa-angle-double-right" style="float: right"></span></a>
											<ul id="menu-comunicacao-sub">
												<li id="menu-mensagens" style="width: 120px"><a
													href="powerupdate.html">Update<i
														class="fa fa-angle-right"
														style="float: right; margin-right: -8px; margin-top: 2px;"></i></a>
													<ul id="menu-mensagens-sub">
														<li id="menu-mensagens-enviadas" style="width: 130px"><a
															href="powerupdate.html">Power</a></li>
													</ul></li>

											</ul></li>
										</li>

										<li id="menu-comunicacao"><a href="index.html"><i
												class="fa fa-smile-o"></i> <span>Logout</span><span
												class="fa fa-angle-double-right" style="float: right"></span></a></li>


									</ul>
								</div>

			<div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>
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