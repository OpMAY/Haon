<%@ page import="com.model.farm.FARM_TYPE" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    FARM_TYPE type = (FARM_TYPE) request.getAttribute("type");
    request.setAttribute("type", type);
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
                <div class="bold-subtitle c-gray-dark-low">농장에 대해서 소개해주세요.</div>
                <div class="regular-h4 c-gray-medium mt-40">하은 축산에서는 간단 이미지 및 설명을 통해 다른 농장과 사용자에게 효과적으로 소개할 수 있어요!</div>
                <form action="/auth/${type}/intro" enctype="multipart/form-data" method="post">
                    <div class="register-container mt-48">
                        <div class="form-group" id="farm-profile-group">
                            <label for="farm-profile" class="medium-h6 c-gray-dark-low mb-0">농장 프로필 이미지</label>
                            <div class="_profile mt-32">
                                <div class="background-image mx-auto" id="profile-preview"
                                     style="width: 120px; height: 120px; border-radius: var(--radius-circle); background-image:
                   url('../../../resources/assets/images/sample/background-wallpaper1.png')">
                                    <svg class="_writer" width="40" height="40" viewBox="0 0 40 40" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="20" cy="20" r="19" fill="white" stroke="#F2F2F2" stroke-width="2"/>
                                        <g clip-path="url(#clip0_249_6753)">
                                            <path d="M16.243 26.0001H28V28.0001H10V23.7571L19.9 13.8571L24.142 18.1011L16.242 26.0001H16.243ZM21.313 12.4441L23.435 10.3221C23.6225 10.1346 23.8768 10.0293 24.142 10.0293C24.4072 10.0293 24.6615 10.1346 24.849 10.3221L27.678 13.1511C27.8655 13.3386 27.9708 13.5929 27.9708 13.8581C27.9708 14.1232 27.8655 14.3776 27.678 14.5651L25.556 16.6861L21.314 12.4441H21.313Z"
                                                  fill="#A9CC52"/>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_249_6753">
                                                <rect width="24" height="24" fill="white" transform="translate(7 7)"/>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </div>
                                <input type="file"
                                       name="profile_image.file"
                                       data-checked="input"
                                       class="d-none form-control input-underline input-brand-green medium-h4"
                                       id="farm-profile">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="farm-name" class="medium-h6 c-gray-dark-low">농장 이름</label>
                            <input type="text"
                                   name="name"
                                   data-checked="input"
                                   placeholder="농장 이름 입력"
                                   class="form-control input-underline input-brand-green medium-h4"
                                   id="farm-name">
                        </div>
                        <div class="form-group">
                            <label for="farm-desc" class="medium-h6 c-gray-dark-low">간단 소개</label>
                            <input type="text"
                                   name="description"
                                   data-checked="input"
                                   placeholder="한줄 소개 입력"
                                   class="form-control input-underline input-brand-green medium-h4"
                                   id="farm-desc">
                        </div>
                        <div class="form-group form-inner-button form-inner-label">
                            <label for="farm-intro-profile" class="medium-h6 c-gray-dark-low">농장 소개 이미지</label>
                            <input id="farm-intro-profile-file"
                                   name="farm_image.file"
                                   type="file"
                                   data-checked="input"
                                   class="d-none">
                            <input type="text"
                                   readonly=""
                                   placeholder="이미지를 업로드해주세요."
                                   class="form-control input-box medium-h5 dropdown-input"
                                   id="farm-intro-profile">
                            <svg width="28" height="28" viewBox="0 0 28 28" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_224_6214)">
                                    <path d="M15.3673 13.9999L9.59235 8.22489L11.242 6.57523L18.6667 13.9999L11.242 21.4246L9.59235 19.7749L15.3673 13.9999Z"
                                          fill="#A9CC52"></path>
                                </g>
                                <defs>
                                    <clipPath id="clip0_224_6214">
                                        <rect width="28" height="28" fill="white"
                                              transform="translate(0 28) rotate(-90)"></rect>
                                    </clipPath>
                                </defs>
                            </svg>
                        </div>
                        <div class="form-group agree-group">
                            <div>
                                <label data-label="checkbox"
                                       class="checkbox-item">
                                    <input id="all-agree"
                                           data-type="checkbox"
                                           type="checkbox"
                                           name="light">
                                    <span class="checkbox rectangle"></span>
                                    <span class="text medium-h5 c-gray-dark-low"
                                          style="margin-left: 16px !important;">전체 동의</span>
                                </label>
                            </div>
                            <div class="agree-list-wrapper">
                                <div class="agree-item">
                                    <label data-label="checkbox"
                                           class="checkbox-item">
                                        <input data-type="checkbox"
                                               type="checkbox"
                                               needs="true"
                                               data-agree="agree"
                                               name="agree.over_age_agree">
                                        <span class="checkbox no-border"></span>
                                        <span class="text medium-h5 c-gray-dark-low">만 14세 이상입니다. (필수)</span>
                                    </label>
                                </div>
                                <div class="agree-item">
                                    <label data-label="checkbox"
                                           class="checkbox-item">
                                        <input data-type="checkbox"
                                               data-agree="agree"
                                               type="checkbox"
                                               needs="true"
                                               name="agree.service_agree">
                                        <span class="checkbox no-border"></span>
                                        <span class="text medium-h5 c-gray-dark-low">서비스 이용약관 동의 (필수)</span>
                                    </label>
                                    <a class="medium-h5" href="javascript:window.open('https://www.naver.com/');">자세히
                                        보기</a>
                                </div>
                                <div class="agree-item">
                                    <label data-label="checkbox"
                                           class="checkbox-item">
                                        <input data-type="checkbox"
                                               type="checkbox"
                                               needs="true"
                                               data-agree="agree"
                                               name="agree.privacy_collect_agree">
                                        <span class="checkbox no-border"></span>
                                        <span class="text medium-h5 c-gray-dark-low">개인정보 수집 및 이용 동의 (필수)</span>
                                    </label>
                                    <a class="medium-h5" href="javascript:window.open('https://www.naver.com/');">자세히
                                        보기</a>
                                </div>
                                <div class="agree-item">
                                    <label data-label="checkbox"
                                           class="checkbox-item">
                                        <input data-type="checkbox"
                                               type="checkbox"
                                               needs="false"
                                               data-agree="agree"
                                               name="agree.privacy_advertise_agree">
                                        <span class="checkbox no-border"></span>
                                        <span class="text medium-h5 c-gray-dark-low">광고성 정보 수신 동의 (선택)</span>
                                    </label>
                                    <a class="medium-h5" href="javascript:window.open('https://www.naver.com/');">자세히
                                        보기</a>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button type="submit" data-type="auth" disabled="" class="btn btn-block btn-brand bold-h4">
                                다음
                            </button>
                        </div>
                    </div>
                </form>
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
        if (${status ne null}) {
            if (${status eq true}) {
                viewModal({
                    vCenter: true,
                    btnCount: 1,
                    wCenter: true,
                    title: '농장',
                    desc: '농장 정보를 입력하였습니다.',
                    onConfirm: function () {
                        location.href = '/';
                    },
                    onHidden: function (e) {
                        location.href = '/';
                    }
                });
            }
        }
        $('#farm-profile-group ._writer').click(function (event) {
            $(this).closest('._profile').find('#farm-profile').click();
        });
        document.querySelector('#farm-intro-profile').addEventListener('click', function (event) {
            this.closest('.form-group').querySelector('input[type="file"]').click();
        });

        $('#all-agree').on('change', (e) => {
            if ($(e.currentTarget).is(":checked")) {
                $('[data-agree="agree"]').prop('checked', true);
            } else {
                $('[data-agree="agree"]').prop('checked', false);
            }
            if ((!checkInputs()) || (!checkNeeds($('input[type="checkbox"][needs="true"]')))) {
                nonActiveBtn($('button[data-type="auth"]'));
            } else {
                activeBtn($('button[data-type="auth"]'));
            }
        });

        $('[data-agree="agree"]').on('change', (e) => {
            checkAllArgs($('[data-agree="agree"]'));
        });

        $('.form-group input[data-checked="input"]').keyup(function (e) {
            if ((!checkInputs()) || (!checkNeeds($('input[type="checkbox"][needs="true"]')))) {
                nonActiveBtn($('button[data-type="auth"]'));
            } else {
                activeBtn($('button[data-type="auth"]'));
            }
        });
    });
    const checkInputs = () => {
        let inputs = $('.form-group input[data-checked="input"]');
        let checkArgs = false;
        inputs.each((index, element) => {
            if ($(element).val().trim() === '' || $(element).val().length === 0) {
                checkArgs = true;
            }
        });
        if (checkArgs) {
            return false;
        }
        return true;
    }
    const checkAllArgs = ($elements) => {
        let checkArgs = true;
        $elements.each((i, e) => {
            if (!$(e).is(":checked")) {
                checkArgs = false;
            }
        });
        if (checkArgs) {
            $('#all-agree').prop('checked', true);
        } else {
            $('#all-agree').prop('checked', false);
        }

        if ((!checkInputs()) || (!checkNeeds($('input[type="checkbox"][needs="true"]')))) {
            nonActiveBtn($('button[data-type="auth"]'));
        } else {
            activeBtn($('button[data-type="auth"]'));
        }
    }
    const checkNeeds = ($elements) => {
        let checkArgs = true;
        $elements.each((i, e) => {
            if (!$(e).is(":checked")) {
                checkArgs = false;
            }
        });
        if (checkArgs) {
            return true;
        }
        return false;
    }

    const activeBtn = ($e) => {
        $e.removeAttr('disabled');
    }
    const nonActiveBtn = ($e) => {
        $e.attr('disabled', 'disabled');
    }

    function readURL(preview_id, input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                console.log($('#' + preview_id));
                $('#' + preview_id).css('background-image', `url('\${e.target.result}')`);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    function readFileText(input_id, input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' + input_id).val(input.files[0].name);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    // 이벤트를 바인딩해서 input에 파일이 올라올때 (input에 change를 트리거할때) 위의 함수를 this context로 실행합니다.
    $('#farm-profile').change(function () {
        readURL('profile-preview', this);
        if ((!checkInputs()) || (!checkNeeds($('input[type="checkbox"][needs="true"]')))) {
            nonActiveBtn($('button[data-type="auth"]'));
        } else {
            activeBtn($('button[data-type="auth"]'));
        }
    });

    $('#farm-intro-profile-file').change(function () {
        readFileText('farm-intro-profile', this);
        if ((!checkInputs()) || (!checkNeeds($('input[type="checkbox"][needs="true"]')))) {
            nonActiveBtn($('button[data-type="auth"]'));
        } else {
            activeBtn($('button[data-type="auth"]'));
        }
    });
</script>
</body>
</html>
