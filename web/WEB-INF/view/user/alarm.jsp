<%@ page import="com.model.farm.Farm" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Farm farm = (Farm) request.getAttribute("farm");
    request.setAttribute("farm", farm);
%>
<html lang="ko">
<jsp:include page="../common/head.jsp"/>
<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/mobile-header.jsp"/>
<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/left-sidebar.jsp"/>
<jsp:include page="../common/right-sidebar.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-trace.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>
<div id="content-wrapper">
    <div class="container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40" style="min-height: calc(80vh);">
            <div class="row">
                <jsp:include page="../common/mypage-left-sidebar.jsp"/>
                <div class="col-lg-8 col-12 right-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="_section pt-0">
                                <div class="_title-container">
                                    <span class="bold-h3">알림 설정</span>
                                </div>

                                <div class="p-0">
                                    <table class="table table-borderless _option-table">
                                        <tbody>
                                        <tr>
                                            <td class="_option-table-content">
                                                <span class="bold-h4 mb-8">커뮤니티</span>
                                                <span class="regular-h5 c-gray-light">내가 작성한 커뮤니티와 메뉴얼의 댓글이 달린 경우 알림을 수신 받습니다.</span>
                                            </td>
                                            <td class="_option-toggle pt-0">
                                                <div class="medium-h5 c-brand-green text-center pb-16 ">카카오 알림</div>
                                                <div class="text-center">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="checkbox"
                                                               <c:if test="${farm.user.agree.community_kakao_alarm}">checked</c:if>
                                                               type="checkbox" name="community_kakao_alarm">
                                                        <span class="checkbox"></span>
                                                        <span class="text"></span>
                                                    </label>
                                                </div>
                                            </td>
                                            <td class="_option-toggle pt-0">
                                                <div class="medium-h5 c-brand-green text-center pb-16 pt-0">이메일 알림</div>
                                                <div class="text-center">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="checkbox"
                                                               <c:if test="${farm.user.agree.community_email_alarm}">checked</c:if>
                                                               type="checkbox" name="community_email_alarm">
                                                        <span class="checkbox"></span>
                                                        <span class="text"></span>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="_option-table-content">
                                                <span class="bold-h4 mb-8">댓글 알림</span>
                                                <span class="regular-h5 c-gray-light">내가 작성한 댓글의 리뷰가 달린 경우 알림을 수신 받습니다.</span>
                                            </td>
                                            <td class="_option-toggle">
                                                <div class="text-center pt-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="checkbox" type="checkbox"
                                                               <c:if test="${farm.user.agree.comment_kakao_alarm}">checked</c:if>
                                                               name="comment_kakao_alarm">
                                                        <span class="checkbox"></span>
                                                        <span class="text"></span>
                                                    </label>
                                                </div>
                                            </td>
                                            <td class="_option-toggle">
                                                <div class="text-center pt-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="checkbox" type="checkbox"
                                                               <c:if test="${farm.user.agree.comment_email_alarm}">checked</c:if>
                                                               name="comment_email_alarm">
                                                        <span class="checkbox"></span>
                                                        <span class="text"></span>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="_option-table-content">
                                                <span class="bold-h4 mb-8">서비스 알림</span>
                                                <span class="regular-h5 c-gray-light">하온 축산에서 이벤트 및 광고성 수신 정보와 서비스 업데이트에 대한 알림을 수신 받습니다.</span>
                                            </td>
                                            <td class="_option-toggle">
                                                <div class="text-center pt-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="checkbox" type="checkbox"
                                                               <c:if test="${farm.user.agree.service_kakao_alarm}">checked</c:if>
                                                               name="service_kakao_alarm">
                                                        <span class="checkbox"></span>
                                                        <span class="text"></span>
                                                    </label>
                                                </div>
                                            </td>
                                            <td class="_option-toggle">
                                                <div class="text-center pt-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="checkbox" type="checkbox"
                                                               <c:if test="${farm.user.agree.service_email_alarm}">checked</c:if>
                                                               name="service_email_alarm">
                                                        <span class="checkbox"></span>
                                                        <span class="text"></span>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/bottom.jsp"/>
<jsp:include page="../common/script.jsp"/>
<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');
        $('._option-toggle input[type="checkbox"]').change(function (e) {
            let type = this.getAttribute('name').toUpperCase();
            let value = false;
            if (this.checked) {
                console.log('checked');
                console.log(this.getAttribute('name').toUpperCase());
                updateAlarm(type, !value).then((result) => {
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            viewAlert({content: '알람을 업데이트 했습니다.'});
                        }
                    }
                });
            } else {
                console.log('unchecked');
                console.log(this.getAttribute('name').toUpperCase());
                updateAlarm(type, value).then((result) => {
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            viewAlert({content: '알람을 업데이트 했습니다.'});
                        }
                    }
                });
            }
        });
    });
</script>
</body>

</html>
