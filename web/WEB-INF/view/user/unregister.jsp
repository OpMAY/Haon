<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                    <span class="bold-h3">회원 탈퇴</span>
                                </div>

                                <div class="text-center mt-100 medium-h4">
                                    정말로 계정을 <span class="c-brand-green">탈퇴</span>하시겠어요?<br/>
                                    탈퇴 후에는 저장된 모든 데이터와 포트폴리오,<br/>
                                    판매 기록 등이 모두 <span class="c-brand-green">삭제되어 복구할 수 없습니다.</span>
                                </div>
                                <div class="text-center mt-16">
                                    <label data-label="checkbox"
                                           class="checkbox-item">
                                        <input id="agree"
                                               data-type="checkbox"
                                               type="checkbox"
                                               name="light">
                                        <span class="checkbox rectangle"></span>
                                        <span class="text bold-h5 c-gray-dark-low"
                                              style="margin-left: 16px !important;">동의하고 회원탈퇴합니다.</span>
                                    </label>
                                </div>
                                <div class="row mt-40 justify-content-center">
                                    <button data-action="unregister" type="button" class="btn btn-md btn-brand bold-h5">
                                        회원 탈퇴
                                    </button>
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
        $('[data-action="unregister"]').on('click', function () {
            if ($('#agree').is(':checked')) {
                withdrawal().then((result) => {
                    console.log(result);
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            viewModal({
                                vCenter: true,
                                wCenter: true,
                                btnCount: 1,
                                title: '회원 탈퇴',
                                desc: '회원탈퇴가 완료되었습니다.',
                                confirm_text: '확인',
                                onConfirm: function () {
                                    location.href = '/';
                                },
                                onHidden: function (e) {
                                    location.href = '/';
                                }
                            });
                        }
                    }
                });
            } else {
                viewAlert({content: '회원탈퇴를 하시려면 회원탈퇴에 동의해주세요.'});
            }
        });
    });
</script>
</body>
</html>
