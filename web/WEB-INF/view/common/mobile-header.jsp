<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2022-09-27
  Time: 오전 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Back Button Include Header-->
<header id="header-back-theme">
    <nav class="navbar navbar-expand navbar-light">
        <a class="navbar-brand" href="#">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M20.7149 4.68656L9.40156 15.9999L20.7149 27.3132L22.6016 25.4279L13.1722 15.9999L22.6016 6.5719L20.7149 4.68656V4.68656Z"
                      fill="#222222"/>
            </svg>
        </a>
        <div class="collapse navbar-collapse justify-content-center">
            <ul class="navbar-nav">
                <li class="nav-item active _title">
                    <a class="nav-link bold-h2" href="#">농장 페이지 관리</a>
                </li>
            </ul>
        </div>
    </nav>
</header>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        // Handler when the DOM is fully loaded
        let header = document.querySelector('#header');

        if (isMobileCheck()) {
            header.style.display = 'none';
        } else {
            header.style.display = 'block';
        }

        if (isResponseSize(993)) {
            header.style.display = 'none';
        } else {
            header.style.display = 'block';
        }
    });
</script>