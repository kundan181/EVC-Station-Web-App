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

/**
 * Servlet implementation class UserLoginEV
 */
public class UserLoginEV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLoginEV() {
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

		String uemail = request.getParameter("userlogemail");// cslogemail-html
																// page
		String upass = request.getParameter("userlogpass");

		try {

			Connection con = ConnectDB.connect();
			PreparedStatement ps1 = con
					.prepareStatement("select * from  userregdetail where useremail =? and userpassword =?");
			ps1.setString(1, uemail);
			ps1.setString(2, upass);
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) {

				String tempem = rs.getString("useremail"); // useremail-from
															// database
				String temppass = rs.getString("userpassword");

				if (uemail.equals(tempem) && upass.equals(temppass)) {
					response.sendRedirect("userdashboard.html");
				}
			} else {
				response.sendRedirect("404.html");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
