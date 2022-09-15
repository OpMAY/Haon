<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<jsp:include page="../common/head.jsp"/>

<body>

<jsp:include page="../common/header.jsp"/>

<jsp:include page="../common/header-desc.jsp"/>

<div id="content-wrapper" style="min-height: 100vh; display: flex;">
    <div class="container mt-16 mb-auto">
        <div class="row section">
            <div class="col-xl-5 col-lg-8 col-8 ml-auto mr-auto">
                <div class="bold-subtitle c-gray-dark-low">어떤 농장를 운영하시나요?</div>
                <div class="regular-h4 c-gray-medium mt-40">하은 축산에서는 다양한 농장들 간 교류를 우선시 합니다. 운영하고 계신 농가 종류를 입력해주세요.</div>
                <div class="register-type-container mt-48">
                    <ul class="list-group checkbox-list-group">
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item1" name="checkbox1">
                                <span class="checkbox"></span>
                                <span class="text">
                  양 & 염소
                </span>
                            </label>
                        </li>
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item2" name="checkbox2">
                                <span class="checkbox"></span>
                                <span class="text">
                  말
                </span>
                            </label>
                        </li>
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item3" name="checkbox3">
                                <span class="checkbox"></span>
                                <span class="text">
                  돼지
                </span>
                            </label>
                        </li>
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item4" name="checkbox4">
                                <span class="checkbox"></span>
                                <span class="text">
                  소
                </span>
                            </label>
                        </li>
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item5" name="checkbox5">
                                <span class="checkbox"></span>
                                <span class="text">
                  닭 & 계란
                </span>
                            </label>
                        </li>
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item5" name="checkbox5">
                                <span class="checkbox"></span>
                                <span class="text">
                  토끼
                </span>
                            </label>
                        </li>
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item5" name="checkbox5">
                                <span class="checkbox"></span>
                                <span class="text">
                  오리
                </span>
                            </label>
                        </li>
                        <li class="list-group-item">
                            <label data-label="checkbox" class="checkbox-item">
                                <input data-type="checkbox" type="checkbox" data-label="item5" name="checkbox5">
                                <span class="checkbox"></span>
                                <span class="text">
                  해당 없음
                </span>
                            </label>
                        </li>
                    </ul>
                    <div class="pl-16 pr-16">
                        <button type="button" class="mt-56 btn btn-block btn-brand bold-h4">
                            다음
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<jsp:include page="../common/script.jsp"/>

<script>
    /**
     * Static JS
     * Static JS는 특정 페이지 에서만 작동하는 부분으로 Event 및 Element 생성 및 화면에 진입했을 때의
     * 해당 화면만의 특정 로직을 수행하는 Javascript를 Static JS라고 한다.
     * */
    $(document).ready(function () {
        console.log('Static JS is ready');
    });
</script>
</body>
</html>
