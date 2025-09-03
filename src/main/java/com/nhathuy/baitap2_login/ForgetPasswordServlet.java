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

@WebServlet(name = "forgetPasswordServlet", value = "/forgetPassword")
public class ForgetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String step = request.getParameter("step");
        
        if ("1".equals(step)) {
            handleStep1(request, response);
        } else if ("2".equals(step)) {
            handleStep2(request, response);
        } else {
            response.sendRedirect("forget_pass.jsp");
        }
    }

    private void handleStep1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        
        if (email == null || email.isBlank()) {
            request.setAttribute("error", "Vui lòng nhập email");
            request.getRequestDispatcher("/forget_pass.jsp").forward(request, response);
            return;
        }

        try (Connection con = new dataBaseConnection().getConnection()) {
            // Kiểm tra email có tồn tại trong database không
            String checkSql = "SELECT 1 FROM Users WHERE email = ?";
            try (PreparedStatement ps = con.prepareStatement(checkSql)) {
                ps.setString(1, email);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Email tồn tại, chuyển sang bước 2
                        response.sendRedirect("forget_pass.jsp?step=2&email=" + email);
                    } else {
                        // Email không tồn tại
                        request.setAttribute("error", "Email không tồn tại trong hệ thống");
                        request.getRequestDispatcher("/forget_pass.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("/forget_pass.jsp").forward(request, response);
        }
    }

    private void handleStep2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (email == null || email.isBlank()) {
            request.setAttribute("error", "Email không hợp lệ");
            request.getRequestDispatcher("/forget_pass.jsp").forward(request, response);
            return;
        }
        
        if (newPassword == null || newPassword.isBlank()) {
            request.setAttribute("error", "Vui lòng nhập mật khẩu mới");
            request.getRequestDispatcher("/forget_pass.jsp?step=2&email=" + email).forward(request, response);
            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu nhập lại không khớp");
            request.getRequestDispatcher("/forget_pass.jsp?step=2&email=" + email).forward(request, response);
            return;
        }

        try (Connection con = new dataBaseConnection().getConnection()) {
            // Cập nhật mật khẩu mới
            String updateSql = "UPDATE Users SET password = ? WHERE email = ?";
            try (PreparedStatement ps = con.prepareStatement(updateSql)) {
                ps.setString(1, newPassword);
                ps.setString(2, email);
                int rowsAffected = ps.executeUpdate();
                
                if (rowsAffected > 0) {
                    // Cập nhật thành công
                    request.setAttribute("success", "Mật khẩu đã được cập nhật thành công");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Không thể cập nhật mật khẩu");
                    request.getRequestDispatcher("/forget_pass.jsp?step=2&email=" + email).forward(request, response);
                }
            }
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("/forget_pass.jsp?step=2&email=" + email).forward(request, response);
        }
    }
}
