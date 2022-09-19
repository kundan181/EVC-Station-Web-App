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

public class CSLoginEV extends HttpServlet {
	String usermob;
	private static final long serialVersionUID = 1L;

	public CSLoginEV() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String usermob = request.getParameter("csmobileno");// cslogemail-html page
		String userpass = request.getParameter("cspassword");

		System.out.println("hellos");
		try {

			Connection con = ConnectDB.connect();
			PreparedStatement ps1 = con.prepareStatement("select * from csregdetail where csmobileno=?");
			ps1.setString(1, usermob);
			ResultSet rs1 = ps1.executeQuery();
			System.out.println("hellosquery");
			while (rs1.next()) {
				String pen = rs1.getString("status");
				if (pen == "pending") {
					response.sendRedirect("404.html");
				} else {
					PreparedStatement ps2 = con
							.prepareStatement("select * from  csregdetail where csmobileno =? and cspassword =?");
					ps2.setString(1, usermob);
					ps2.setString(2, userpass);
					ResultSet rs = ps2.executeQuery();
					System.out.println("hellosappr");
					if (rs.next()) {

						String tempmo = rs.getString("csmobileno"); // mobile-from
																	// database
						String temppass = rs.getString("cspassword");

						if (usermob.equals(tempmo) && userpass.equals(temppass)) {
							GetSet.setUsermob(usermob);
							response.sendRedirect("subadmindashboard.html");
						}

					} else {
						response.sendRedirect("404.html");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
