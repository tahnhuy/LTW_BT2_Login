<%--
  Created by IntelliJ IDEA.
  User: ngnha
  Date: 9/3/2025
  Time: 1:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quên mật khẩu</title>
    <style>
        * { box-sizing: border-box; }
        html, body { height: 100%; }
        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f5f7fb;
            color: #2d3748;
        }
        .page {
            min-height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }
        .card {
            width: 100%;
            max-width: 480px;
            background: #fff;
            border: 1px solid #e6e9ef;
            border-radius: 6px;
            padding: 32px 28px;
            box-shadow: 0 6px 18px rgba(26, 35, 126, 0.06);
        }
        .title { text-align:center; font-size: 28px; font-weight: 600; color:#4a5568; margin: 4px 0 24px; }
        .form { display: grid; gap: 16px; }
        .input-group { display:grid; grid-template-columns:56px 1fr; align-items:center; border:1px solid #dbe2ef; border-radius:4px; overflow:hidden; background:#eef5ff; }
        .input-icon { display:flex; align-items:center; justify-content:center; height:48px; color:#8aa0c4; background:#f5f9ff; border-right:1px solid #dbe2ef; font-size:18px; }
        .input { height:48px; border:none; padding:0 14px; font-size:16px; background:transparent; outline:none; width:100%; color:#2d3748; }
        .btn { display:inline-block; width:100%; height:48px; border:none; border-radius:4px; background:#4a90e2; color:#fff; font-size:16px; font-weight:600; cursor:pointer; transition:background-color .15s ease-in-out; }
        .btn:hover { background:#3a7ccc; }
        .footer-note { text-align:center; margin-top: 20px; font-size:14px; color:#718096; }
        .error { margin-top:12px; color:#e53e3e; text-align:center; font-size:14px; }
        .success { margin-top:12px; color:#2f855a; text-align:center; font-size:14px; }
        .link { font-size: 14px; color: #2b6cb0; text-decoration: none; }
        .link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="page">
        <div class="card">
            <div class="title">Quên mật khẩu</div>
            <% String step = request.getParameter("step");
               if (step == null || step.equals("1")) { %>
                <!-- Bước 1: Nhập email -->
                <form class="form" action="forgetPassword" method="post">
                    <input type="hidden" name="step" value="1" />
                    <div class="input-group">
                        <div class="input-icon" aria-hidden="true">✉️</div>
                        <input class="input" type="email" name="email" placeholder="Nhập email của bạn" required />
                    </div>
                    <button type="submit" class="btn">Kiểm tra email</button>
                </form>
            <% } else if (step.equals("2")) { %>
                <!-- Bước 2: Nhập mật khẩu mới -->
                <form class="form" action="forgetPassword" method="post">
                    <input type="hidden" name="step" value="2" />
                    <input type="hidden" name="email" value="<%= request.getParameter("email") %>" />
                    <div class="input-group">
                        <div class="input-icon" aria-hidden="true">🔒</div>
                        <input class="input" type="password" name="newPassword" placeholder="Mật khẩu mới" required />
                    </div>
                    <div class="input-group">
                        <div class="input-icon" aria-hidden="true">🔒</div>
                        <input class="input" type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu mới" required />
                    </div>
                    <button type="submit" class="btn">Cập nhật mật khẩu</button>
                </form>
            <% } %>
            
            <% String error = (String) request.getAttribute("error");
               String success = (String) request.getAttribute("success");
               if (error != null) { %>
                <div class="error"><%= error %></div>
            <% } else if (success != null) { %>
                <div class="success"><%= success %></div>
            <% } %>
            
            <div class="footer-note">
                <a class="link" href="login.jsp">Quay lại đăng nhập</a>
            </div>
        </div>
    </div>
</body>
</html>
