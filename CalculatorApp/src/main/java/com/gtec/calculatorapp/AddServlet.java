package com.gtec.calculatorapp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddServlet extends HttpServlet{
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int value1 = Integer.parseInt(req.getParameter("num1"));
		int value2 = Integer.parseInt(req.getParameter("num2"));
		int result = value1 + value2;
		
		System.out.println(result);
		req.setAttribute("finalresult", result);
		
		req.getRequestDispatcher("Result.jsp").forward(req, res);
		
	}
	
	
	

}


