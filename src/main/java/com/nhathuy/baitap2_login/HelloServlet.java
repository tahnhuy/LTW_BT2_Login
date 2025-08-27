package com.nhathuy.baitap2_login;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;
    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String messageToShow = "Hello " + (username != null ? username : "") + "!";

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + messageToShow + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}