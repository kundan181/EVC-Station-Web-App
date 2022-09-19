<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.rcpit.data.ConnectDB"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%

	int id=Integer.parseInt(request.getParameter("id"));
	try
	{
		Connection con = ConnectDB.connect();
		PreparedStatement ps2 = con.prepareStatement("update csregdetail set status=? where csid=?");
		ps2.setString(1,"Approved");
		ps2.setInt(2,id);
		int res = ps2.executeUpdate();
		if(res > 0)
		{
			response.sendRedirect("appr.jsp");
		}
		else
		{
			response.sendRedirect("404.html");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>

</body>
</html>