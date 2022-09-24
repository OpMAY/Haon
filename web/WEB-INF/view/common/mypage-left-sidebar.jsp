<%@ page import="com.model.farm.Farm" %>
<%@ page import="com.util.Encryption.JWTEnum" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.util.Encryption.EncryptionService" %><%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2022-09-23
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Farm farm = (Farm) request.getAttribute("farm");
    request.setAttribute("farm", farm);
    String JWTToken = (String) request.getSession().getAttribute(JWTEnum.JWTToken.name());
    request.setAttribute("JWTToken", JWTToken);
    if (JWTToken != null && !JWTToken.equals("")) {
        HashMap<String, Object> values = new EncryptionService().decryptJWT(JWTToken);
        request.setAttribute("values", values);
    }
%>
<div class="col-lg col-12 left-sidebar-container">
    <div class="left-side-inner">
        <div class="user-info">
            <div class="_name">
                <div class="bold-h4 c-gray-dark-low ellipsis-one-line">${farm.name}</div>
                <button type="button" data-href="/user/farm/manage"
                        class="ml-auto btn btn-sm btn-sm-xp btn-brand btn-icon">
                    <span class="bold-h5 my-auto">농장 관리</span>
                    <svg class="my-auto ml-8"
                         width="16"
                         height="16"
                         viewBox="0 0 16 16"
                         fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0_224_6192)">
                            <path d="M3.55595 3.02988C4.24044 2.41674 5.04441 1.95188 5.91728 1.66455C6.16687 1.97723 6.48373 2.22964 6.8443 2.403C7.20486 2.57636 7.59987 2.66621 7.99995 2.66588C8.40003 2.66621 8.79504 2.57636 9.15561 2.403C9.51618 2.22964 9.83303 1.97723 10.0826 1.66455C10.9555 1.95188 11.7595 2.41674 12.444 3.02988C12.2983 3.40218 12.2384 3.80251 12.2686 4.20114C12.2988 4.59978 12.4185 4.98648 12.6186 5.33255C12.8183 5.67928 13.0937 5.97652 13.4241 6.20216C13.7546 6.42781 14.1316 6.57606 14.5273 6.63588C14.7143 7.53515 14.7143 8.46328 14.5273 9.36255C13.754 9.48122 13.0406 9.93588 12.6186 10.6659C12.4184 11.012 12.2987 11.3989 12.2684 11.7976C12.2382 12.1964 12.2982 12.5968 12.444 12.9692C11.7594 13.5821 10.9554 14.0468 10.0826 14.3339C9.83296 14.0213 9.51608 13.769 9.15552 13.5958C8.79495 13.4226 8.39998 13.3328 7.99995 13.3332C7.59987 13.3329 7.20486 13.4227 6.8443 13.5961C6.48373 13.7695 6.16687 14.0219 5.91728 14.3346C5.04446 14.0474 4.2405 13.5828 3.55595 12.9699C3.70172 12.5975 3.76171 12.197 3.73147 11.7983C3.70123 11.3995 3.58154 11.0127 3.38128 10.6666C3.18148 10.3199 2.90612 10.0228 2.57567 9.79731C2.24523 9.57178 1.8682 9.42363 1.47262 9.36388C1.28549 8.4644 1.28549 7.53603 1.47262 6.63655C1.86826 6.57673 2.24533 6.42848 2.57578 6.20283C2.90622 5.97718 3.18155 5.67994 3.38128 5.33322C3.58144 4.98715 3.70107 4.60045 3.73131 4.20181C3.76155 3.80318 3.70161 3.40285 3.55595 3.03055V3.02988ZM8.99995 9.73122C9.22924 9.60085 9.43048 9.42642 9.59209 9.21797C9.75369 9.00951 9.87246 8.77115 9.94157 8.5166C10.0107 8.26206 10.0288 7.99635 9.99476 7.7348C9.96076 7.47324 9.87536 7.22098 9.74348 6.99256C9.6116 6.76414 9.43583 6.56406 9.22631 6.40385C9.01679 6.24363 8.77764 6.12644 8.52264 6.05902C8.26764 5.9916 8.00183 5.97529 7.7405 6.01102C7.47917 6.04675 7.22749 6.13382 6.99995 6.26722C6.54434 6.53432 6.21287 6.97079 6.07788 7.48138C5.94288 7.99197 6.01533 8.53523 6.2794 8.99261C6.54348 9.44998 6.97774 9.78434 7.48742 9.92271C7.99711 10.0611 8.54083 9.99225 8.99995 9.73122Z"
                                  fill="white"></path>
                        </g>
                        <defs>
                            <clipPath id="clip0_224_6192">
                                <rect width="16" height="16" fill="white"></rect>
                            </clipPath>
                        </defs>
                    </svg>
                </button>
            </div>
            <div class="_info">
                <div class="media user-media">
                    <div class="_profile background-image"
                         style="background-image: url('${farm.profile_image.url}')"></div>
                    <div class="media-body">
                        <div class="medium-h5 c-gray-dark-low"
                             style="white-space: normal; word-break: break-word">${values.get(JWTEnum.EMAIL.name()).toString()}</div>
                        <div class="regular-h5 c-gray-dark-low"
                             style="white-space: normal; word-break: break-word">${farm.user.name}</div>
                    </div>
                </div>
            </div>
        </div>
        <ul class="list-group _left-tabs">
            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="/user/home">홈</li>
            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="/user/bookmark">책갈피</li>
            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="/user/trace">이력 관리</li>
            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item" data-href="/user/alarm">알림 설정</li>
            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item _logout">로그아웃</li>
            <li class="list-group-item regular-h4 c-gray-dark-low _left-tab-item is-active"
                data-href="/user/unregister">회원탈퇴
            </li>
        </ul>
    </div>
</div>
