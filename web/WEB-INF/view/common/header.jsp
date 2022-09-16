<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.util.Encryption.EncryptionService" %>
<%@ page import="com.util.Encryption.JWTEnum" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String JWTToken = (String) request.getSession().getAttribute(JWTEnum.JWTToken.name());
    request.setAttribute("JWTToken", JWTToken);
    if (JWTToken != null && !JWTToken.equals("")) {
        HashMap<String, Object> values = new EncryptionService().decryptJWT(JWTToken);
        request.setAttribute("values", values);
    }
%>
<header id="header">
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="/">
            <img src="/resources/assets/images/icon/logo-white-theme.png"/>
        </a>
        <button class="navbar-toggler"
                type="button">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_282_23663)">
                    <path d="M24 11H0V13H24V11Z" fill="#333333"/>
                    <path d="M24 4H0V6H24V4Z" fill="#333333"/>
                    <path d="M24 18H0V20H24V18Z" fill="#333333"/>
                </g>
                <defs>
                    <clipPath id="clip0_282_23663">
                        <rect width="24" height="24" fill="white"/>
                    </clipPath>
                </defs>
            </svg>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample04">
            <ul class="navbar-nav _navbar-left mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">농장</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">커뮤니티</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">QR이력제</a>
                </li>
            </ul>
        </div>
        <ul class="navbar-nav _navbar-right ml-auto">
            <li class="nav-item active">
                <a class="nav-link _qna" href="#">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14373)">
                            <path d="M12 22C6.477 22 2 17.523 2 12C2 6.477 6.477 2 12 2C17.523 2 22 6.477 22 12C22 17.523 17.523 22 12 22ZM12 20C14.1217 20 16.1566 19.1571 17.6569 17.6569C19.1571 16.1566 20 14.1217 20 12C20 9.87827 19.1571 7.84344 17.6569 6.34315C16.1566 4.84285 14.1217 4 12 4C9.87827 4 7.84344 4.84285 6.34315 6.34315C4.84285 7.84344 4 9.87827 4 12C4 14.1217 4.84285 16.1566 6.34315 17.6569C7.84344 19.1571 9.87827 20 12 20V20ZM11 15H13V17H11V15ZM13 13.355V14H11V12.5C11 12.2348 11.1054 11.9804 11.2929 11.7929C11.4804 11.6054 11.7348 11.5 12 11.5C12.2841 11.5 12.5623 11.4193 12.8023 11.2673C13.0423 11.1154 13.2343 10.8984 13.3558 10.6416C13.4773 10.3848 13.5234 10.0988 13.4887 9.81684C13.454 9.53489 13.34 9.26858 13.1598 9.04891C12.9797 8.82924 12.7409 8.66523 12.4712 8.57597C12.2015 8.48671 11.912 8.47587 11.6364 8.54471C11.3608 8.61354 11.1104 8.75923 10.9144 8.96482C10.7183 9.1704 10.5847 9.42743 10.529 9.706L8.567 9.313C8.68863 8.70508 8.96951 8.14037 9.38092 7.67659C9.79233 7.2128 10.3195 6.86658 10.9086 6.67332C11.4977 6.48006 12.1275 6.44669 12.7337 6.57661C13.3399 6.70654 13.9007 6.99511 14.3588 7.41282C14.8169 7.83054 15.1559 8.36241 15.3411 8.95406C15.5263 9.54572 15.5511 10.1759 15.4129 10.7803C15.2747 11.3847 14.9785 11.9415 14.5545 12.3939C14.1306 12.8462 13.5941 13.1779 13 13.355V13.355Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14373">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link _search" href="#">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_289_14372)">
                            <path d="M18.031 16.617L22.314 20.899L20.899 22.314L16.617 18.031C15.0237 19.3082 13.042 20.0029 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20.0029 13.042 19.3082 15.0237 18.031 16.617ZM16.025 15.875C17.2941 14.5699 18.0029 12.8204 18 11C18 7.132 14.867 4 11 4C7.132 4 4 7.132 4 11C4 14.867 7.132 18 11 18C12.8204 18.0029 14.5699 17.2941 15.875 16.025L16.025 15.875V15.875Z"
                                  fill="#222222"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_289_14372">
                                <rect width="24" height="24" fill="white"/>
                            </clipPath>
                        </defs>
                    </svg>
                </a>
            </li>
            <c:choose>
                <c:when test="${JWTToken ne null}">
                    <li class="nav-item">
                        <a class="nav-link _profile" href="/user/home">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_282_25452)">
                                    <path d="M4 22C4 19.8783 4.84285 17.8434 6.34315 16.3431C7.84344 14.8429 9.87827 14 12 14C14.1217 14 16.1566 14.8429 17.6569 16.3431C19.1571 17.8434 20 19.8783 20 22H4ZM12 13C8.685 13 6 10.315 6 7C6 3.685 8.685 1 12 1C15.315 1 18 3.685 18 7C18 10.315 15.315 13 12 13Z"
                                          fill="#A9CC52"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_282_25452">
                                        <rect width="24" height="24" fill="white"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/register">로그인</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</header>
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