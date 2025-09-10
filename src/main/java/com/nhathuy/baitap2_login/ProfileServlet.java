package com.nhathuy.baitap2_login;

import com.nhathuy.baitap2_login.util.Constant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(urlPatterns = "/profile")
@MultipartConfig
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("authUser") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        String username = (String) session.getAttribute("authUser");
        String foundImage = null;
        try (Connection con = new dataBaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT username, full_name, phone FROM Users WHERE username=?")) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // detect avatar on filesystem using naming convention
                    foundImage = findExistingAvatarFile(username);
                    req.setAttribute("user", new UserView(
                            rs.getString("username"),
                            rs.getString("full_name"),
                            rs.getString("phone"),
                            foundImage
                    ));
                }
            }
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
        }
        req.getRequestDispatcher("/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("authUser") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        String username = (String) session.getAttribute("authUser");
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");

        String savedFileName = null;
        try {
            Part imagePart = null;
            try { imagePart = req.getPart("image"); } catch (Exception ignore) {}
            if (imagePart != null && imagePart.getSize() > 0) {
                File dir = new File(Constant.DIR);
                if (!dir.exists()) dir.mkdirs();
                String submitted = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
                String ext = "";
                int dot = submitted.lastIndexOf('.');
                if (dot > -1) ext = submitted.substring(dot);
                savedFileName = username + "_avatar" + ext;
                Path target = Path.of(Constant.DIR, savedFileName);
                Files.copy(imagePart.getInputStream(), target, StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (Exception e) {
            req.setAttribute("error", "Upload lỗi: " + e.getMessage());
            doGet(req, resp);
            return;
        }

        String sql = "UPDATE Users SET full_name=?, phone=? WHERE username=?";
        try (Connection con = new dataBaseConnection().getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setString(3, username);
            ps.executeUpdate();
            req.setAttribute("success", "Cập nhật thành công");
        } catch (Exception e) {
            req.setAttribute("error", "Lỗi cập nhật: " + e.getMessage());
        }
        doGet(req, resp);
    }

    private String findExistingAvatarFile(String username) {
        String[] exts = new String[]{".jpg", ".jpeg", ".png", ".gif"};
        for (String ext : exts) {
            File f = new File(Constant.DIR, username + "_avatar" + ext);
            if (f.exists()) return f.getName();
        }
        return null;
    }

    public static class UserView {
        public final String username;
        public final String fullName;
        public final String phone;
        public final String image;

        public UserView(String username, String fullName, String phone, String image) {
            this.username = username;
            this.fullName = fullName;
            this.phone = phone;
            this.image = image;
        }
        public String getUsername() { return username; }
        public String getFullName() { return fullName; }
        public String getPhone() { return phone; }
        public String getImage() { return image; }
    }
}


