<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header-left-sidebar" style="display: none;">
    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h2 class="mb-0">
                    <div class="btn btn-block text-left bold-h3 c-gray-dark-low"
                         type="button"
                         data-toggle="collapse"
                         data-target="#collapseOne"
                         aria-expanded="true"
                         aria-controls="collapseOne">
                        <span>농장</span>
                        <svg width="27" height="27" viewBox="0 0 27 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_279_20047)">
                                <path d="M13.3328 12.0313L7.83283 17.5312L6.26172 15.9601L13.3328 8.88903L20.4039 15.9601L18.8328 17.5312L13.3328 12.0313Z"
                                      fill="#222222"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_279_20047">
                                    <rect width="26.6667" height="26.6667" fill="white"
                                          transform="translate(0 26.666) rotate(-90)"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                </h2>
            </div>
            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne">
                <div class="card-body">
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/farms">양 & 염소</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/farms">말</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/farms">돼지</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/farms">소</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/farms">닭 & 계란</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/farms">토끼</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/farms">오리</div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingTwo">
                <h2 class="mb-0">
                    <div class="btn btn-block text-left bold-h3 c-gray-dark-low"
                         type="button"
                         data-toggle="collapse"
                         data-target="#collapseTwo"
                         aria-expanded="true"
                         aria-controls="collapseTwo">
                        <span>커뮤니티</span>
                        <svg width="27" height="27" viewBox="0 0 27 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_279_20047)">
                                <path d="M13.3328 12.0313L7.83283 17.5312L6.26172 15.9601L13.3328 8.88903L20.4039 15.9601L18.8328 17.5312L13.3328 12.0313Z"
                                      fill="#222222"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_279_20047">
                                    <rect width="26.6667" height="26.6667" fill="white"
                                          transform="translate(0 26.666) rotate(-90)"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                </h2>
            </div>
            <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo">
                <div class="card-body">
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/boards">자유 게시판</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/tips">팁과 노하우</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/manuals">축산 메뉴얼</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/magazines">최신 매거진</div>
                    <div class="regular-h5 c-gray-dark-low" data-href="/community/questions">질문과 답변</div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingThree">
                <h2 class="mb-0">
                    <div class="btn btn-block text-left bold-h3 c-gray-dark-low"
                         type="button"
                         data-toggle="collapse"
                         data-target="#collapseThree"
                         aria-expanded="true"
                         aria-controls="collapseThree">
                        <span>QR 이력제</span>
                        <svg width="27" height="27" viewBox="0 0 27 27" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_279_20047)">
                                <path d="M13.3328 12.0313L7.83283 17.5312L6.26172 15.9601L13.3328 8.88903L20.4039 15.9601L18.8328 17.5312L13.3328 12.0313Z"
                                      fill="#222222"/>
                            </g>
                            <defs>
                                <clipPath id="clip0_279_20047">
                                    <rect width="26.6667" height="26.6667" fill="white"
                                          transform="translate(0 26.666) rotate(-90)"/>
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                </h2>
            </div>
            <div id="collapseThree" class="collapse show" aria-labelledby="headingThree">
                <div class="card-body">
                    <div class="regular-h5 c-gray-dark-low">이력 안내</div>
                    <div class="regular-h5 c-gray-dark-low _trace-search">이력 조회</div>
                    <div class="regular-h5 c-gray-dark-low _trace-register">이력 등록</div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        let register_button = document.querySelector('._trace-register');
        register_button.addEventListener('click', function (event) {
            loginCheck().then((result) => {
                if (result.status === 'OK') {
                    if (result.data.status) {
                        location.href = '/user/trace';
                    } else {
                        viewAlert({content: '로그인이 필요한 기능입니다.'});
                    }
                }
            });
        });
    });
</script>