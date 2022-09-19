package com.rcpit.evchargingstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcpit.data.ConnectDB;

public class AdminLoginEV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminLoginEV() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String useremail = request.getParameter("alogemail");// alogemail-html
																// page
		String userpass = request.getParameter("alogpass");

		try 
		{
			// System.out.println("hellos");
			Connection con = ConnectDB.connect();
			PreparedStatement ps1 = con
					.prepareStatement("select * from admindetail where adminemail =? and adminpass =?");
			ps1.setString(1, useremail);
			ps1.setString(2, userpass);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {
				String tempem = rs.getString("adminemail"); // email-from
															// database
				String temppass = rs.getString("adminpass");
				// response.sendRedirect("welcome.html");

				if (useremail.equals(tempem) && userpass.equals(temppass)) {
					response.sendRedirect("admindashboard.html");
				}
			} 
			else {
				response.sendRedirect("404.html");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

	}

}
