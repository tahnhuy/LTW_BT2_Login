<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách danh mục</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f5f7fb;
            color: #2d3748;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        .title {
            font-size: 28px;
            font-weight: 600;
            color: #4a5568;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background: #4a90e2;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 600;
            transition: background-color .15s ease-in-out;
        }
        .btn:hover {
            background: #3a7ccc;
        }
        .btn-danger {
            background: #e53e3e;
        }
        .btn-danger:hover {
            background: #c53030;
        }
        .btn-warning {
            background: #ed8936;
        }
        .btn-warning:hover {
            background: #dd6b20;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(26, 35, 126, 0.06);
        }
        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #e6e9ef;
        }
        th {
            background: #f5f9ff;
            font-weight: 600;
            color: #4a5568;
        }
        .category-img {
            width: 100px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
        }
        .actions {
            display: flex;
            gap: 8px;
        }
        .no-data {
            text-align: center;
            padding: 40px;
            color: #718096;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1 class="title">Danh sách danh mục</h1>
            <a href="<c:url value='/admin/category/add'/>" class="btn">Thêm danh mục mới</a>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Ảnh đại diện</th>
                    <th>Tên danh mục</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${categoryList}" var="category" varStatus="STT">
                    <tr>
                        <td>${STT.index + 1}</td>
                        <td>
                            <c:if test="${not empty category.icon}">
                                <c:url value="/image?fname=${category.icon}" var="imgUrl"></c:url>
                                <img src="${imgUrl}" alt="${category.name}" class="category-img" />
                            </c:if>
                            <c:if test="${empty category.icon}">
                                <span style="color: #718096;">Không có ảnh</span>
                            </c:if>
                        </td>
                        <td>${category.name}</td>
                        <td class="actions">
                            <a href="<c:url value='/admin/category/edit?id=${category.id}'/>" class="btn btn-warning">Sửa</a>
                            <a href="<c:url value='/admin/category/delete?id=${category.id}'/>" class="btn btn-danger" 
                               onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty categoryList}">
                    <tr>
                        <td colspan="4" class="no-data">Không có danh mục nào</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
        <div style="margin-top: 20px;">
            <a href="<c:url value='/login.jsp'/>" class="btn">Quay lại đăng nhập</a>
        </div>
    </div>
</body>
</html>
