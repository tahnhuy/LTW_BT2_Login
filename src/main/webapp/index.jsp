<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ</title>
    <meta name="decorator" content="/WEB-INF/decorators/bootstrap.jsp" />
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f5f7fb;
            color: #2d3748;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
            text-align: center;
        }
        .title {
            font-size: 32px;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 30px;
        }
        .welcome {
            font-size: 18px;
            color: #718096;
            margin-bottom: 40px;
        }
        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 40px;
        }
        .menu-item {
            background: #fff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 6px 18px rgba(26, 35, 126, 0.06);
            transition: transform .15s ease-in-out;
        }
        .menu-item:hover {
            transform: translateY(-2px);
        }
        .menu-icon {
            font-size: 48px;
            margin-bottom: 16px;
        }
        .menu-title {
            font-size: 20px;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 12px;
        }
        .menu-desc {
            color: #718096;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background: #4a90e2;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            transition: background-color .15s ease-in-out;
        }
        .btn:hover {
            background: #3a7ccc;
        }
        .logout {
            margin-top: 30px;
        }
        .logout a {
            color: #718096;
            text-decoration: none;
        }
        .logout a:hover {
            text-decoration: underline;
        }
        .app-header {   
            position: sticky;
            top: 0;
            z-index: 20;
            background: #ffffffcc;
            backdrop-filter: blur(6px);
            border-bottom: 1px solid #e6e9ef;
        }
        .app-header .inner {
            max-width: 1000px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 16px;
        }
        .user-block { display: inline-flex; align-items: center; gap: 10px; }
        .avatar {
            width: 36px; height: 36px; border-radius: 50%;
            display: inline-flex; align-items: center; justify-content: center;
            background: #eef5ff; color: #4a5568; font-weight: 700;
        }
        .user-name { color: #4a5568; font-weight: 600; }
        .edit-btn {
            display: inline-flex; align-items: center; gap: 6px;
            padding: 8px 12px; border-radius: 6px; background: #4a90e2; color: #fff;
            text-decoration: none; font-weight: 600;
        }
        .edit-btn:hover { background: #3a7ccc; }
    </style>
</head>
<body>
    <div class="app-header">
        <div class="inner">
            <div style="font-weight:700;color:#4a5568;">Bài Tập</div>
            <div class="user-block">
                <div class="avatar">
                    ${empty sessionScope.authUser ? 'U' : fn:toUpperCase(fn:substring(sessionScope.authUser,0,1))}
                </div>
                <div class="user-name">${sessionScope.authUser}</div>
                <c:url value='/profile' var='profileUrl'/>
                <a class="edit-btn" href="${profileUrl}" title="Chỉnh sửa hồ sơ">✏️ Chỉnh sửa</a>
            </div>
        </div>
    </div>
    <div class="container">
        <h1 class="title">Chào mừng đến với hệ thống</h1>
        <p class="welcome">Bạn đã đăng nhập thành công!</p>
        
        <div class="menu">
            <div class="menu-item">
                <div class="menu-icon">📂</div>
                <div class="menu-title">Quản lý danh mục</div>
                <div class="menu-desc">Thêm, sửa, xóa các danh mục sản phẩm</div>
                <a href="<c:url value='/admin/category/list'/>" class="btn">Quản lý danh mục</a>
            </div>
            
            <div class="menu-item">
                <div class="menu-icon">👤</div>
                <div class="menu-title">Quản lý người dùng</div>
                <div class="menu-desc">Xem thông tin và quản lý tài khoản</div>
                <a href="#" class="btn">Quản lý người dùng</a>
            </div>
            
            <div class="menu-item">
                <div class="menu-icon">📊</div>
                <div class="menu-title">Thống kê</div>
                <div class="menu-desc">Xem báo cáo và thống kê hệ thống</div>
                <a href="#" class="btn">Xem thống kê</a>
            </div>
        </div>
        
        <div class="logout">
            <a href="<c:url value='/login.jsp'/>">Đăng xuất</a>
        </div>
    </div>
</body>
</html>