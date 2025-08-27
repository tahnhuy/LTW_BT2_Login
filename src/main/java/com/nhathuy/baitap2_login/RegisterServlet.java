package com.nhathuy.baitap2_login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "registerServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");

        if (username == null || username.isBlank() || password == null || confirm == null) {
            request.setAttribute("error", "Vui lòng nhập đủ username và mật khẩu");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }
        if (!password.equals(confirm)) {
            request.setAttribute("error", "Mật khẩu nhập lại không khớp");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        try (Connection con = new dataBaseConnection().getConnection()) {
            // Kiểm tra trùng username
            try (PreparedStatement check = con.prepareStatement("SELECT 1 FROM Users WHERE username = ?")) {
                check.setString(1, username);
                try (ResultSet rs = check.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("error", "Username đã tồn tại");
                        request.getRequestDispatcher("/register.jsp").forward(request, response);
                        return;
                    }
                }
            }

            // Thêm người dùng
            String insertSql = "INSERT INTO Users(username, password, full_name, email, phone) VALUES(?,?,?,?,?)";
            try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                ps.setString(1, username);
                ps.setString(2, password);
                ps.setString(3, fullName);
                ps.setString(4, email);
                ps.setString(5, phone);
                ps.executeUpdate();
            }
            // Thành công: chuyển về login với thông báo
            request.setAttribute("success", "Đăng ký thành công. Vui lòng đăng nhập.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}


