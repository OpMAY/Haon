<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2022-09-27
  Time: 오전 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String MOBILE_HEADER_TITLE = (String) request.getAttribute("MOBILE_HEADER_TITLE");
    request.setAttribute("MOBILE_HEADER_TITLE", MOBILE_HEADER_TITLE);
%>
<!-- Back Button Include Header-->
<header id="header-back-theme">
    <nav class="navbar navbar-expand navbar-light">
        <a class="navbar-brand _history-back" href="javascript:void(0);">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M20.7149 4.68656L9.40156 15.9999L20.7149 27.3132L22.6016 25.4279L13.1722 15.9999L22.6016 6.5719L20.7149 4.68656V4.68656Z"
                      fill="#222222"/>
            </svg>
        </a>
        <div class="collapse navbar-collapse justify-content-center">
            <ul class="navbar-nav">
                <li class="nav-item active _title">
                    <a class="nav-link bold-h2" href="#">${MOBILE_HEADER_TITLE}</a>
                </li>
            </ul>
        </div>
        <a class="navbar-brand" href="/">
            <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_953_32074)">
                    <path d="M17.784 1.11041C17.2943 0.669663 16.6588 0.425781 16 0.425781C15.3412 0.425781 14.7057 0.669663 14.216 1.11041L0 13.9051V27.7717C0 28.9033 0.449523 29.9886 1.24968 30.7887C2.04983 31.5889 3.13508 32.0384 4.26667 32.0384H27.7333C28.8649 32.0384 29.9502 31.5889 30.7503 30.7887C31.5505 29.9886 32 28.9033 32 27.7717V13.9051L17.784 1.11041ZM20 29.3677H12V22.6664C12 21.6055 12.4214 20.5881 13.1716 19.838C13.9217 19.0878 14.9391 18.6664 16 18.6664C17.0609 18.6664 18.0783 19.0878 18.8284 19.838C19.5786 20.5881 20 21.6055 20 22.6664V29.3677ZM29.3333 27.7677C29.3333 28.1921 29.1648 28.5991 28.8647 28.8991C28.5646 29.1992 28.1577 29.3677 27.7333 29.3677H22.6667V22.6664C22.6667 20.8983 21.9643 19.2026 20.714 17.9524C19.4638 16.7021 17.7681 15.9997 16 15.9997C14.2319 15.9997 12.5362 16.7021 11.286 17.9524C10.0357 19.2026 9.33333 20.8983 9.33333 22.6664V29.3677H4.26667C3.84232 29.3677 3.43535 29.1992 3.1353 28.8991C2.83524 28.5991 2.66667 28.1921 2.66667 27.7677V15.0917L16 3.09175L29.3333 15.0917V27.7677Z"
                          fill="#222222"/>
                </g>
                <defs>
                    <clipPath id="clip0_953_32074">
                        <rect width="32" height="32" fill="white"/>
                    </clipPath>
                </defs>
            </svg>
        </a>
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

        let back_button = document.querySelector('#header-back-theme ._history-back');
        back_button.addEventListener('click', function (event) {
            history.back();
        });
    });
</script>