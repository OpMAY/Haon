<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Boolean status = (Boolean) request.getAttribute("status");
    request.setAttribute("status", status);
%>
<html lang="ko">
<jsp:include page="../common/head.jsp"/>
<body>
<!-- General Header -->
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/mobile-header.jsp"/>
<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/left-sidebar.jsp"/>
<jsp:include page="../common/right-sidebar.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-trace.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>
<div id="content-wrapper" style="min-height: 100vh; display: flex;">
    <div class="container mt-16 mb-auto">
        <div class="row section">
            <div class="col-xl-5 col-lg-8 col-8 ml-auto mr-auto">
                <div class="bold-subtitle c-gray-dark-low">5초 만에 축산 커뮤니티 가입</div>
                <div class="regular-h4 c-gray-medium mt-40">현재 하은 축산에서 166 곳의 농가와 축산에 관심있는 1523명의 사용자 간 소통이 이루어지고
                    있습니다.
                </div>
                <div class="register-container mt-48">
                    <button type="button" class="btn btn-block btn-kakao" id="kakao">
                        <img class="mr-12 ml-auto my-auto" src="../../resources/assets/images/icon/btn-kakao.png">
                        <span class="bold-h5 c-gray-dark-low my-auto mr-auto">카카오로 회원가입</span>
                    </button>
                    <div class="_info">
                        <div class="bold-h4 c-gray-dark-low">공유된 팁과 노하우</div>
                        <div class="bold-title c-brand-green">1032개</div>
                    </div>
                    <div class="_info">
                        <div class="bold-h4 c-gray-dark-low">업로드 된 게시글</div>
                        <div class="bold-title c-brand-green">32개</div>
                    </div>
                    <div class="_info">
                        <div class="bold-h4 c-gray-dark-low">등록된 이력제</div>
                        <div class="bold-title c-brand-green">103개</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/script.jsp"/>
<script type="text/javascript" src="/resources/js/module/api/kakao/kakao-login.js"></script>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');
        if (${status ne null}) {
            console.log('status not null');
            if (${status eq true}) {
                if(${type eq 'register'}){
                    viewModal({
                        vCenter: true,
                        btnCount: 1,
                        wCenter: true,
                        title: '농장',
                        desc: '농장 정보가 없습니다. 농장 정보를 설정해주세요.',
                        confirm_text: '확인',
                        onConfirm: function () {
                            location.href = '/auth/type';
                        },
                        onHidden: function (e) {
                            location.href = '/auth/type';
                        }
                    });
                }else if(${type eq 'login'}){
                    viewModal({
                        vCenter: true,
                        btnCount: 1,
                        wCenter: true,
                        title: '로그인',
                        desc: '로그인에 성공하였습니다.',
                        confirm_text: '홈으로 이동',
                        onConfirm: function () {
                            location.href = '/';
                        },
                        onHidden: function (e) {
                            location.href = '/';
                        }
                    });
                }
            } else {
                viewModal({
                    vCenter: true,
                    btnCount: 1,
                    wCenter: true,
                    title: '로그인',
                    desc: '로그인에 실패하였습니다.',
                    confirm_text: '홈으로 이동',
                    onConfirm: function () {
                        location.href = '/auth/register';
                    },
                    onHidden: function (e) {
                        location.href = '/auth/register';
                    }
                });
            }
        } else {
            console.log('status null');
        }
    });
</script>
</body>
</html>
