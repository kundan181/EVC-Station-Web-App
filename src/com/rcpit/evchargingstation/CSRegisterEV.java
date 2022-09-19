package com.rcpit.evchargingstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcpit.data.ConnectDB;

public class CSRegisterEV extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CSRegisterEV() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		int csid = 0;
		String name = request.getParameter("csrname");
		String address = request.getParameter("csraddr");
		String city = request.getParameter("csrcity");
		String taluka = request.getParameter("csrtel");
		String district = request.getParameter("csrdist");
		String opentime = request.getParameter("csrotime");
		String closetime = request.getParameter("csrctime");
		String mobileno = request.getParameter("csrmobno");
		String latitude = request.getParameter("csrlat");
		String longitude = request.getParameter("csrlon");
		String password = request.getParameter("csrpassword");
		String csrpower = request.getParameter("csrpower");
		int cspow = Integer.parseInt(csrpower);

		String status = "pending";
		try {
			System.out.println("hello");
			Connection conn = ConnectDB.connect();
			PreparedStatement stmt1 = conn
					.prepareStatement("insert into csregdetail values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			stmt1.setInt(1, csid);
			stmt1.setString(2, name);
			stmt1.setString(3, address);
			stmt1.setString(4, city);
			stmt1.setString(5, taluka);
			stmt1.setString(6, district);
			stmt1.setString(7, opentime);
			stmt1.setString(8, closetime);
			stmt1.setString(9, mobileno);
			stmt1.setString(10, latitude);
			stmt1.setString(11, longitude);
			stmt1.setString(12, password);
			stmt1.setInt(13, cspow);
			stmt1.setString(14, status);

			int i = stmt1.executeUpdate();

			if (i > 0) {
				response.sendRedirect("subadmindashboard.html");
			} else {
				response.sendRedirect("404.html");

			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
}