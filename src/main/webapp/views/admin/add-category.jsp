<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm danh mục mới</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f5f7fb;
            color: #2d3748;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            margin-bottom: 30px;
        }
        .title {
            font-size: 28px;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 10px;
        }
        .form-card {
            background: #fff;
            border-radius: 6px;
            padding: 32px;
            box-shadow: 0 6px 18px rgba(26, 35, 126, 0.06);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #4a5568;
        }
        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #dbe2ef;
            border-radius: 4px;
            font-size: 16px;
            background: #fff;
            outline: none;
            transition: border-color .15s ease-in-out;
        }
        .form-input:focus {
            border-color: #4a90e2;
        }
        .form-file {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #dbe2ef;
            border-radius: 4px;
            font-size: 16px;
            background: #fff;
            outline: none;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background: #4a90e2;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color .15s ease-in-out;
        }
        .btn:hover {
            background: #3a7ccc;
        }
        .btn-secondary {
            background: #718096;
        }
        .btn-secondary:hover {
            background: #4a5568;
        }
        .btn-group {
            display: flex;
            gap: 12px;
            margin-top: 20px;
        }
        .error {
            color: #e53e3e;
            font-size: 14px;
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1 class="title">Thêm danh mục mới</h1>
        </div>
        
        <div class="form-card">
            <form action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="form-label">Tên danh mục:</label>
                    <input type="text" class="form-input" name="name" placeholder="Nhập tên danh mục" required />
                </div>
                
                <div class="form-group">
                    <label class="form-label">Ảnh đại diện:</label>
                    <input type="file" class="form-file" name="icon" accept="image/*" />
                    <div class="error">Chỉ chấp nhận file ảnh (jpg, png, gif)</div>
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn">Thêm danh mục</button>
                    <button type="reset" class="btn btn-secondary">Làm lại</button>
                    <a href="<c:url value='/admin/category/list'/>" class="btn btn-secondary">Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
