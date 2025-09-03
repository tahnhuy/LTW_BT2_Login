package com.nhathuy.baitap2_login.controller;

import com.nhathuy.baitap2_login.model.Category;
import com.nhathuy.baitap2_login.service.CategoryService;
import com.nhathuy.baitap2_login.service.impl.CategoryServiceImpl;
import com.nhathuy.baitap2_login.util.Constant;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(urlPatterns = { "/admin/category/add" })
@MultipartConfig
public class CategoryAddController extends HttpServlet {
    CategoryService categoryService = new CategoryServiceImpl();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/add-category.jsp");
        dispatcher.forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        Part iconPart = req.getPart("icon");

        Category category = new Category();
        category.setName(name);

        if (iconPart != null && iconPart.getSize() > 0) {
            String submitted = iconPart.getSubmittedFileName();
            String ext = "";
            int idx = submitted != null ? submitted.lastIndexOf('.') : -1;
            if (idx >= 0) ext = submitted.substring(idx);
            String fileName = System.currentTimeMillis() + ext;
            File file = new File(Constant.DIR + "/category/" + fileName);
            File parent = file.getParentFile();
            if (!parent.exists()) parent.mkdirs();
            try (InputStream in = iconPart.getInputStream(); FileOutputStream out = new FileOutputStream(file)) {
                byte[] buf = new byte[8192];
                int r;
                while ((r = in.read(buf)) != -1) {
                    out.write(buf, 0, r);
                }
            }
            category.setIcon("category/" + fileName);
        }

        categoryService.insert(category);
        resp.sendRedirect(req.getContextPath() + "/admin/category/list");
    }
}
