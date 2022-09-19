package com.rcpit.evchargingstation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rcpit.data.ConnectDB;

/**
 * Servlet implementation class CSDelete
 */
public class CSDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CSDelete() {
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

		int csdel = Integer.parseInt(request.getParameter("csdel"));

		if (csdel > 0) {
			try {
				Connection con = ConnectDB.connect();

				PreparedStatement ps2 = con.prepareStatement("delete from csregdetail where csid=?");
				ps2.setInt(1, csdel);
				int rs = ps2.executeUpdate();
				if (rs > 0) {

					response.sendRedirect("csdelete.html");

				} else {
					response.sendRedirect("404.html");

				}

			}

			catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect("404.html");
		}
	}
}
