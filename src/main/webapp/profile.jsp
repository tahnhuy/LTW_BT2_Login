<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hồ sơ</title>
    <meta name="decorator" content="/WEB-INF/decorators/bootstrap.jsp" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .profile-wrap { max-width: 820px; margin: 0 auto; }
        .card { border: 1px solid #e6e9ef; box-shadow: 0 6px 18px rgba(26,35,126,.06); border-radius: 10px; overflow: hidden; }
        .card-header { background: linear-gradient(180deg,#f8fafc, #f2f6fb); font-weight: 600; color: #334155; display:flex; align-items:center; gap:10px; }
        .card-header .emoji { font-size: 20px; }
        .btn-primary { background: #4a90e2; border-color: #4a90e2; }
        .btn-primary:hover { background: #3a7ccc; border-color: #3a7ccc; }
        .avatar-preview { display: flex; gap: 16px; align-items: center; padding: 12px; background:#f8fbff; border:1px dashed #d6e3f5; border-radius:8px; }
        .avatar-preview img { max-height: 120px; border-radius: 8px; }
        .hint { color: #718096; font-size: 13px; }
        .form-grid { display: grid; grid-template-columns: 1fr; gap: 16px; }
        @media (min-width: 768px) { .form-grid { grid-template-columns: 1fr 1fr; } }
        .form-label { color:#475569; font-weight:600; }
        .form-control { border-color:#dbe2ef; }
        .form-control:focus { border-color:#4a90e2; box-shadow: 0 0 0 .2rem rgba(74,144,226,.15); }
        .actions { display:flex; gap:10px; }
    </style>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div class="profile-wrap py-4">
  <div class="card">
    <div class="card-header"><span class="emoji">👤</span> Cập nhật hồ sơ</div>
    <div class="card-body">
        <form action="profile" method="post" enctype="multipart/form-data">
          <div class="form-grid">
            <div class="mb-3">
              <label class="form-label">Họ và tên</label>
              <input type="text" class="form-control" name="fullName" value="${user.fullName}" required>
            </div>
            <div class="mb-3">
              <label class="form-label">Số điện thoại</label>
              <input type="text" class="form-control" name="phone" value="${user.phone}" required>
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label">Ảnh đại diện</label>
            <input type="file" class="form-control" name="image">
            <div class="form-text hint">Để trống nếu không đổi.</div>
          </div>
          <div class="mb-3 avatar-preview">
            <c:choose>
                <c:when test="${not empty requestScope.user and not empty requestScope.user.image}">
                    <img src="image?fname=${requestScope.user.image}" alt="avatar" class="img-thumbnail" />
                    <span class="hint">Ảnh hiện tại</span>
                </c:when>
                <c:otherwise>
                    <div class="hint">Chưa có ảnh đại diện</div>
                </c:otherwise>
            </c:choose>
          </div>
          <div class="actions">
            <button class="btn btn-primary" type="submit">Lưu</button>
            <a href="index.jsp" class="btn btn-outline-secondary">Huỷ</a>
          </div>
        </form>
        <c:if test="${not empty requestScope.error}">
          <div class="alert alert-danger mt-3">${requestScope.error}</div>
        </c:if>
        <c:if test="${not empty requestScope.success}">
          <div class="alert alert-success mt-3">${requestScope.success}</div>
        </c:if>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


