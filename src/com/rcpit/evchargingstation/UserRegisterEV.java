package com.rcpit.evchargingstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcpit.data.ConnectDB;

public class UserRegisterEV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public UserRegisterEV() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		int uid = 0;
		String name = request.getParameter("username");
		String email = request.getParameter("useremail");
		String mobno = request.getParameter("usermobno");
		String password = request.getParameter("userpassword");
		String city = request.getParameter("usercity");

		try
		{
			System.out.println("hello");
			Connection conn = ConnectDB.connect();
			PreparedStatement stmt2 = conn.prepareStatement("insert into userregdetail values(?,?,?,?,?,?)");
			stmt2.setInt(1, uid);
			stmt2.setString(2, name);
			stmt2.setString(3, email);
			stmt2.setString(4, mobno);
			stmt2.setString(5, password);
			stmt2.setString(6, city);

			int i = stmt2.executeUpdate();

			if (i > 0) {
				response.sendRedirect("reguser.html");
			} else
			{
				response.sendRedirect("404.html");
			}
		} 
		catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		
	}
}