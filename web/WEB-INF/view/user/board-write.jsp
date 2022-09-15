<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">

<jsp:include page="../common/head.jsp"/>

<body>

<jsp:include page="../common/header.jsp"/>

<jsp:include page="../common/header-desc.jsp"/>
<jsp:include page="../common/tab-overlay.jsp"/>
<jsp:include page="../common/tab-search.jsp"/>

<div id="content-wrapper">
    <div class="container">
        <!--테마별 키워드-->
        <section class="section sm-section mt-40" style="min-height: calc(80vh);">
            <div class="row">
                <div class="col-12">
                    <div class="board-title bold-h1 c-gray-dark-low mb-32">
                        게시글 작성하기
                    </div>
                </div>
                <div class="col-12">
                    <div class="board-write-container">
                        <div class="_header">
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="게시글 종류 선택"
                                           id="board-filter1">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_278_13355)">
                                            <path d="M12 13.1727L16.95 8.22266L18.364 9.63666L12 16.0007L5.636 9.63666L7.05 8.22266L12 13.1727Z"
                                                  fill="#222222"></path>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_278_13355">
                                                <rect width="24" height="24" fill="white" transform="translate(24) rotate(90)"></rect>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </div>
                                <div class="dropdown-menu dropdown-sm">
                                    <a data-type="boards" class="dropdown-item">
                                        <div>자유 게시판</div>
                                    </a>
                                    <a data-type="tips" class="dropdown-item">
                                        <div>팁과 노하우</div>
                                    </a>
                                    <a data-type="manuals" class="dropdown-item">
                                        <div>축산 메뉴얼</div>
                                    </a>
                                    <a data-type="questions" class="dropdown-item">
                                        <div>질문과 답변</div>
                                    </a>
                                    <a data-type="magazines" class="dropdown-item">
                                        <div>최신 매거진</div>
                                    </a>
                                </div>
                            </div>
                            <div class="dropdown input-dropdown">
                                <div data-toggle="dropdown" aria-expanded="false" class="form-group form-inner-button form-sm">
                                    <input type="text"
                                           class="form-control input-box medium-h5 dropdown-input"
                                           disabled="disabled"
                                           value="카테고리 선택"
                                           id="board-filter2">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_278_13355)">
                                            <path d="M12 13.1727L16.95 8.22266L18.364 9.63666L12 16.0007L5.636 9.63666L7.05 8.22266L12 13.1727Z"
                                                  fill="#222222"></path>
                                        </g>
                                        <defs>
                                            <clipPath id="clip0_278_13355">
                                                <rect width="24" height="24" fill="white" transform="translate(24) rotate(90)"></rect>
                                            </clipPath>
                                        </defs>
                                    </svg>
                                </div>
                                <div class="dropdown-menu dropdown-sm">
                                    <a data-type="boards" class="dropdown-item">
                                        <div>관리자 지정</div>
                                    </a>
                                    <a data-type="tips" class="dropdown-item">
                                        <div>관리자 지정</div>
                                    </a>
                                    <a data-type="manuals" class="dropdown-item">
                                        <div>관리자 지정</div>
                                    </a>
                                    <a data-type="questions" class="dropdown-item">
                                        <div>관리자 지정</div>
                                    </a>
                                    <a data-type="magazines" class="dropdown-item">
                                        <div>관리자 지정</div>
                                    </a>
                                </div>
                            </div>
                            <button type="button" class="btn btn-md btn-gray-high-light medium-h5 ml-auto">
                                취소
                            </button>
                            <button type="button" class="btn btn-md btn-brand medium-h5">
                                게시
                            </button>
                        </div>
                        <div class="_header _input-header">
                            <div class="_form">
                                <div class="_text c-gray-dark-low medium-h5">
                                    썸네일
                                </div>
                                <div class="_input form-group form-inner-button">
                                    <input id="file1" type="file" class="d-none" onchange="loadFile(event, this)">
                                    <input type="text" readonly placeholder="이미지를 업로드해주세요."
                                           class="form-control dropdown-input input-no-border medium-h5"
                                           id="input1">
                                </div>
                            </div>
                            <div class="_preview background-image"
                                 style="display:none; background-image: url('../../resources/assets/images/sample/background-wallpaper1.png')">
                                <div class="_cancel">
                                    <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="16" cy="16" r="14" fill="white"/>
                                        <path fill-rule="evenodd"
                                              clip-rule="evenodd"
                                              d="M16.0002 1.33398C7.90016 1.33398 1.3335 7.90065 1.3335 16.0007C1.3335 24.1007 7.90016 30.6673 16.0002 30.6673C24.1002 30.6673 30.6668 24.1007 30.6668 16.0007C30.6668 7.90065 24.1002 1.33398 16.0002 1.33398ZM20.9428 12.9433C21.1857 12.6918 21.3201 12.355 21.3171 12.0055C21.314 11.6559 21.1738 11.3214 20.9266 11.0742C20.6794 10.827 20.345 10.6868 19.9954 10.6838C19.6458 10.6807 19.309 10.8151 19.0575 11.058L16.0002 14.1153L12.9428 11.058C12.8198 10.9306 12.6727 10.8291 12.51 10.7592C12.3474 10.6893 12.1724 10.6525 11.9954 10.651C11.8183 10.6494 11.6428 10.6832 11.4789 10.7502C11.315 10.8173 11.1662 10.9163 11.041 11.0415C10.9158 11.1666 10.8168 11.3155 10.7497 11.4794C10.6827 11.6432 10.649 11.8188 10.6505 11.9959C10.652 12.1729 10.6888 12.3479 10.7587 12.5105C10.8286 12.6732 10.9302 12.8203 11.0575 12.9433L14.1148 16.0007L11.0575 19.058C10.9302 19.181 10.8286 19.3281 10.7587 19.4908C10.6888 19.6535 10.652 19.8284 10.6505 20.0055C10.649 20.1825 10.6827 20.3581 10.7497 20.5219C10.8168 20.6858 10.9158 20.8347 11.041 20.9598C11.1662 21.085 11.315 21.184 11.4789 21.2511C11.6428 21.3181 11.8183 21.3519 11.9954 21.3503C12.1724 21.3488 12.3474 21.312 12.51 21.2421C12.6727 21.1722 12.8198 21.0707 12.9428 20.9433L16.0002 17.886L19.0575 20.9433C19.309 21.1862 19.6458 21.3206 19.9954 21.3176C20.345 21.3145 20.6794 21.1743 20.9266 20.9271C21.1738 20.6799 21.314 20.3454 21.3171 19.9959C21.3201 19.6463 21.1857 19.3095 20.9428 19.058L17.8855 16.0007L20.9428 12.9433Z"
                                              fill="#A9CC52"/>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <div class="_header _input-header">
                            <div class="_form w-100">
                                <div class="_text c-gray-dark-low medium-h5">
                                    제목
                                </div>
                                <div class="_input form-group form-inner-button">
                                    <input type="text" placeholder="제목을 입력해주세요."
                                           class="form-control input-no-border medium-h5"
                                           id="input2">
                                </div>
                            </div>
                        </div>
                        <div class="_content">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="22"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
        document.querySelector('#input1').addEventListener('click', function (event) {
            this.closest('.form-group').querySelector('input[type="file"]').click();
        });
        document.querySelector('._preview').querySelector('._cancel').addEventListener('click', function (event) {
            let preview = this.closest('._preview');
            let text_input = this.closest('._input-header').querySelector('._input input[type="text"]');
            text_input.value = '';
            $(preview).hide();
            $(preview).css('background-image', 'none');
        });
    });

    let loadFile = function (event, target) {
        let file = event.target.files[0];
        let reader = new FileReader();
        reader.onload = function (event) {
            let preview = target.closest('._input-header').querySelector('._preview');
            $(preview).css('background-image', `url('${reader.result}')`);
            if (preview.style.display !== 'block') {
                $(preview).show();
            }
        };
        reader.onloadend = function (event) {
            let text_input = target.closest('._input').querySelector('input[type="text"]');
            text_input.value = `${file.name}`;
        };
        reader.readAsDataURL(event.target.files[0]);
    };
</script>
</body>

</html>
