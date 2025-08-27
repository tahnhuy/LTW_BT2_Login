<%--
  Created by IntelliJ IDEA.
  User: ngnha
  Date: 8/27/2025
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
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
            max-width: 720px;
            background: #fff;
            border: 1px solid #e6e9ef;
            border-radius: 6px;
            padding: 32px 28px;
            box-shadow: 0 6px 18px rgba(26, 35, 126, 0.06);
        }
        .title {
            text-align: center;
            font-size: 28px;
            font-weight: 600;
            color: #4a5568;
            margin: 4px 0 24px;
        }
        .form { display: grid; gap: 16px; }
        .input-group {
            display: grid;
            grid-template-columns: 56px 1fr;
            align-items: center;
            border: 1px solid #dbe2ef;
            border-radius: 4px;
            overflow: hidden;
            background: #eef5ff;
        }
        .input-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 48px;
            color: #8aa0c4;
            background: #f5f9ff;
            border-right: 1px solid #dbe2ef;
            font-size: 18px;
        }
        .input {
            height: 48px;
            border: none;
            padding: 0 14px;
            font-size: 16px;
            background: transparent;
            outline: none;
            width: 100%;
            color: #2d3748;
        }
        .row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 4px;
        }
        .remember { display: inline-flex; align-items: center; gap: 8px; font-size: 14px; color: #4a5568; }
        .link { font-size: 14px; color: #2b6cb0; text-decoration: none; }
        .link:hover { text-decoration: underline; }
        .btn {
            display: inline-block;
            width: 100%;
            height: 48px;
            border: none;
            border-radius: 4px;
            background: #4a90e2;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color .15s ease-in-out;
        }
        .btn:hover { background: #3a7ccc; }
        .footer-note { text-align: center; margin-top: 20px; font-size: 14px; color: #718096; }
    </style>
</head>
<body>
    <div class="page">
        <div class="card">
            <div class="title">Đăng Nhập Vào Hệ Thống</div>
            <form class="form" action="login" method="post">
                <div class="input-group">
                    <div class="input-icon" aria-hidden="true">👤</div>
                    <input class="input" type="text" name="username" placeholder="username" autocomplete="username" />
                </div>
                <div class="input-group">
                    <div class="input-icon" aria-hidden="true">🔒</div>
                    <input class="input" type="password" name="password" placeholder="•••••" autocomplete="current-password" />
                </div>
                <div class="row">
                    <label class="remember">
                        <input type="checkbox" name="remember" />
                        Nhớ mật khẩu
                    </label>
                    <a class="link" href="#">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="btn">Đăng nhập</button>
            </form>
            <% String error = (String) request.getAttribute("error");
               if (error != null && !error.isEmpty()) { %>
                <div style="margin-top:12px;color:#e53e3e;text-align:center;font-size:14px;">
                    <%= error %>
                </div>
            <% } %>
            <div class="footer-note">
                Nếu bạn chưa có tài khoản trên hệ thống, thì hãy
                <a class="link" href="#">Đăng ký</a>
            </div>
        </div>
    </div>
</body>
</html>
