package com.rcpit.evchargingstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcpit.data.ConnectDB;

/**
 * Servlet implementation class UpdatePower
 */
public class UpdatePower extends HttpServlet {

	int newpow = 0;
	int opow, npow;

	private static final long serialVersionUID = 1L;

	public UpdatePower() {
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

		npow = Integer.parseInt(request.getParameter("cspow")); // cspower- html
																// page name

		// check validation

		//System.out.println("hello");
		try 
		{
			Connection conn = ConnectDB.connect();
			PreparedStatement stmt3 = conn.prepareStatement("select cspower from csregdetail where csmobileno = ?");
			stmt3.setString(1,GetSet.getUsermob());
			ResultSet rs = stmt3.executeQuery();

			while (rs.next())
			{
				opow = rs.getInt("cspower"); // cspower - db name
			}

			newpow = opow + npow;
			PreparedStatement stmt4 = conn.prepareStatement("update csregdetail set cspower = ? where csmobileno = ?");
			stmt4.setInt(1, newpow);
			stmt4.setString(2,GetSet.getUsermob());
			int obj1 = stmt4.executeUpdate();

			if (obj1 < 0) {
				response.sendRedirect("404.html");
			} else {
				response.sendRedirect("powerupdate.html");
			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
	// changes
}
