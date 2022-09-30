<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Topbar Start -->
<div class="navbar-custom">
    <div class="container-fluid">
        <!-- LOGO -->
        <div class="logo-box">
            <a href="/admin/dashboard"
               class="logo logo-dark text-center">
                <span class="logo-sm">
                    <img src="/resources/admin/assets/images/logo-sm.png"
                         alt=""
                         height="22">
                    <!-- <span class="logo-lg-text-light">UBold</span> -->
                </span>
                <span class="logo-lg">
                    <img src="/resources/admin/assets/images/logo-dark.png"
                         alt=""
                         height="20">
                    <!-- <span class="logo-lg-text-light">U</span> -->
                </span>
            </a>

            <a href="/admin/dashboard"
               class="logo logo-light text-center">
                <span class="logo-sm">
                    <img src="/resources/admin/assets/images/logo-sm.png"
                         alt=""
                         height="22">
                </span>
                <span class="logo-lg">
                    <img src="/resources/admin/assets/images/logo-light.png"
                         alt=""
                         height="20">
                </span>
            </a>
        </div>
        <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
            <li>
                <button class="button-menu-mobile waves-effect waves-light">
                    <i class="fe-menu"></i>
                </button>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>
</div>
<!-- end Topbar -->

<!-- ========== Left Sidebar Start ========== -->
<div class="left-side-menu">
    <div class="h-100"
         data-simplebar>
        <!--- Sidemenu -->
        <div id="sidebar-menu">

            <ul id="side-menu">
                <li>
                    <a href="/admin/dashboard">
                        <i data-feather="calendar"></i>
                        <span> Dashboard </span>
                    </a>
                </li>
                <li>
                    <a href="/admin/users">
                        <i data-feather="calendar"></i>
                        <span> 사용자(농장) 관리 </span>
                    </a>
                </li>
                <li>
                    <a href="#sidebarCommunities"
                       data-bs-toggle="collapse">
                        <i data-feather="airplay"></i>
                        <span> 커뮤니티 관리 </span>
                    </a>
                    <div class="collapse"
                         id="sidebarCommunities">
                        <ul class="nav-second-level">
                            <li>
                                <a href="/admin/boards">자유 게시판</a>
                            </li>
                            <li>
                                <a href="/admin/tips">팁과 노하우</a>
                            </li>
                            <li>
                                <a href="/admin/manuals">축산 메뉴얼</a>
                            </li>
                            <li>
                                <a href="/admin/questions">질문과 답변</a>
                            </li>
                            <li>
                                <a href="/admin/magazines">최신 매거진</a>
                            </li>
                            <li>
                                <a href="/admin/categories">카테고리 관리</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#sidebarTrace"
                       data-bs-toggle="collapse">
                        <i data-feather="airplay"></i>
                        <span> QR 이력 관리 </span>
                    </a>
                    <div class="collapse"
                         id="sidebarTrace">
                        <ul class="nav-second-level">
                            <li>
                                <a href="/admin/trace/traces">축산 이력</a>
                            </li>
                            <li>
                                <a href="/admin/trace/bundles">묶음 이력</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="/admin/banners">
                        <i data-feather="calendar"></i>
                        <span> 광고 배너 관리 </span>
                    </a>
                </li>
                <li>
                    <a href="/search/keywords">
                        <i data-feather="calendar"></i>
                        <span> 검색 & 키워드 관리 </span>
                    </a>
                </li>
                <li>
                    <a href="/login">
                        <i data-feather="calendar"></i>
                        <span> 로그아웃 </span>
                    </a>
                </li>
            </ul>

        </div>
        <!-- End Sidebar -->

        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->

</div>
<!-- Left Sidebar End -->