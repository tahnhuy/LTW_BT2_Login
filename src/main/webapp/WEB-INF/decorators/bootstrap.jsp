<%@ taglib prefix="page" uri="http://www.sitemesh.org/sitemesh-page" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title><page:title default="Ứng dụng"/></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <page:head/>
    <style>
        body { background: #f5f7fb; }
    </style>
    <page:meta name="robots" />
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Bài Tập</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="login.jsp">Đăng nhập</a></li>
        <li class="nav-item"><a class="nav-link" href="register.jsp">Đăng ký</a></li>
        <li class="nav-item"><a class="nav-link" href="profile">Hồ sơ</a></li>
      </ul>
    </div>
  </div>
  </nav>
  <main class="container py-4">
      <page:body/>
  </main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


