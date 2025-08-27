<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tạo tài khoản mới</title>
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
            max-width: 760px;
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
    </style>
</head>
<body>
<div class="page">
    <div class="card">
        <div class="title">Tạo tài khoản mới</div>
        <form class="form" action="register" method="post">
            <div class="input-group">
                <div class="input-icon" aria-hidden="true">👤</div>
                <input class="input" type="text" name="username" placeholder="username" required />
            </div>
            <div class="input-group">
                <div class="input-icon" aria-hidden="true">🪪</div>
                <input class="input" type="text" name="fullName" placeholder="Họ tên" />
            </div>
            <div class="input-group">
                <div class="input-icon" aria-hidden="true">✉️</div>
                <input class="input" type="email" name="email" placeholder="Nhập Email" />
            </div>
            <div class="input-group">
                <div class="input-icon" aria-hidden="true">📞</div>
                <input class="input" type="tel" name="phone" placeholder="Số điện thoại" />
            </div>
            <div class="input-group">
                <div class="input-icon" aria-hidden="true">🔒</div>
                <input class="input" type="password" name="password" placeholder="Mật khẩu" required />
            </div>
            <div class="input-group">
                <div class="input-icon" aria-hidden="true">🔒</div>
                <input class="input" type="password" name="confirm" placeholder="Nhập lại mật khẩu" required />
            </div>
            <button type="submit" class="btn">Tạo tài khoản</button>
        </form>
        <% String rError = (String) request.getAttribute("error");
           String rSuccess = (String) request.getAttribute("success");
           if (rError != null) { %>
            <div class="error"><%= rError %></div>
        <% } else if (rSuccess != null) { %>
            <div class="success"><%= rSuccess %></div>
        <% } %>
        <div class="footer-note">
            Nếu bạn đã có tài khoản? <a class="link" href="login.jsp">Đăng nhập</a>
        </div>
    </div>
    </div>
</body>
</html>


