<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Log In | UBold - Responsive Admin Dashboard Template</title>
  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">
  <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc."
        name="description"/>
  <meta content="Coderthemes"
        name="author"/>
  <meta http-equiv="X-UA-Compatible"
        content="IE=edge"/>
  <!-- App favicon -->
  <link rel="shortcut icon"
        href="/resources/admin/assets/images/favicon.ico">

  <!-- App css -->
  <link href="/resources/admin/assets/css/config/default/bootstrap.min.css"
        rel="stylesheet"
        type="text/css"
        id="bs-default-stylesheet"/>
  <link href="/resources/admin/assets/css/config/default/app.min.css"
        rel="stylesheet"
        type="text/css"
        id="app-default-stylesheet"/>

  <link href="/resources/admin/assets/css/config/default/bootstrap-dark.min.css"
        rel="stylesheet"
        type="text/css"
        id="bs-dark-stylesheet"/>
  <link href="/resources/admin/assets/css/config/default/app-dark.min.css"
        rel="stylesheet"
        type="text/css"
        id="app-dark-stylesheet"/>

  <!-- icons -->
  <link href="/resources/admin/assets/css/icons.min.css"
        rel="stylesheet"
        type="text/css"/>

</head>

<body class="loading authentication-bg authentication-bg-pattern">
<div class="account-pages d-flex" style="height: 100vh;">
  <div class="container mt-auto mb-auto">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6 col-xl-4">
        <div class="card bg-pattern">
          <div class="card-body p-4">
            <div class="text-center w-75 m-auto">
              <div class="auth-logo">
                <a href="#"
                   class="logo logo-dark text-center">
                  <span class="logo-lg">
                    <img src="/resources/admin/assets/images/logo-dark.png"
                         alt=""
                         height="22">
                  </span>
                </a>
                <a href="#"
                   class="logo logo-light text-center">
                  <span class="logo-lg">
                    <img src="/resources/admin/assets/images/logo-light.png"
                         alt=""
                         height="22">
                  </span>
                </a>
              </div>
              <p class="text-muted mb-4 mt-3">Enter your email address and password to access admin panel.</p>
            </div>
            <form action="/admin/dashboard"
                  method="get">
              <div class="mb-3">
                <label for="emailaddress"
                       class="form-label">Email address</label>
                <input class="form-control"
                       type="email"
                       id="emailaddress"
                       required=""
                       placeholder="Enter your email">
              </div>
              <div class="mb-3">
                <label for="password"
                       class="form-label">Password</label>
                <div class="input-group input-group-merge">
                  <input type="password"
                         id="password"
                         class="form-control"
                         placeholder="Enter your password">
                  <div class="input-group-text"
                       data-password="false">
                    <span class="password-eye"></span>
                  </div>
                </div>
              </div>
              <div class="text-center d-grid">
                <button class="btn btn-primary"
                        type="submit"> Log In
                </button>
              </div>
            </form>
          </div> <!-- end card-body -->
        </div>
        <!-- end card -->
      </div> <!-- end col -->
    </div>
    <!-- end row -->
  </div>
  <!-- end container -->
</div>
<!-- end page -->
<footer class="footer footer-alt">
  2022 -
  <script>document.write(new Date().getFullYear())</script> &copy; Admin theme by <a href=""
                                                                                     class="text-white-50">Okiwi</a>
</footer>

<!-- Vendor js -->
<script src="/resources/admin/assets/js/vendor.min.js"></script>

<!-- App js -->
<script src="/resources/admin/assets/js/app.min.js"></script>
<script src="/resources/admin/assets/js/admin.js"></script>

</body>
</html>
