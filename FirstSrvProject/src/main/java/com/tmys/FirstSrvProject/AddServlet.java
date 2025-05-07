package com.tmys.FirstSrvProject;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class AddServlet extends HttpServlet {
    
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            // Retrieve the parameters from the request
            int value1 = Integer.parseInt(req.getParameter("num1"));
            int value2 = Integer.parseInt(req.getParameter("num2"));
            
            // Perform the addition
            int result = value1 + value2;
            
            // Set the content type to HTML
            res.setContentType("text/html");
            PrintWriter out = res.getWriter();
            
            // Generate the HTML response
            out.println("<html><body>");
            out.println("<h2>Result of Addition: " + result + "</h2>");
            out.println("<a href='index.jsp'>Back</a>");
            out.println("</body></html>");
        } catch (NumberFormatException e) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input values.");
        }
    }
}
