<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="tab-trace" style="display: none;">
    <div class="container mt-48 mb-48">
        <div class="bold-h1 text-center">
            이력 조회
        </div>
        <div class="text-center  medium-h4 mt-32">
            축산물 이력제 적용 판매장에서 이력추적제를 적용한 축산물인 경우<br/>
            <span class="c-brand-green">묶음 또는 이력 번호를 입력</span>하여 축산 이력을 조회할 수 있습니다.
        </div>
        <div class="form-group form-inner-button text-center mt-60">
            <input type="text" placeholder="묶음 또는 이력 번호를 입력해주세요." class="form-control input-box medium-h5"
                   id="tab-trace-search">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g clip-path="url(#clip0_225_6124)">
                    <path d="M18.031 16.617L22.314 20.899L20.899 22.314L16.617 18.031C15.0237 19.3082 13.042 20.0029 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20.0029 13.042 19.3082 15.0237 18.031 16.617ZM16.025 15.875C17.2941 14.5699 18.0029 12.8204 18 11C18 7.132 14.867 4 11 4C7.132 4 4 7.132 4 11C4 14.867 7.132 18 11 18C12.8204 18.0029 14.5699 17.2941 15.875 16.025L16.025 15.875Z"
                          fill="#A9CC52"/>
                </g>
                <defs>
                    <clipPath id="clip0_225_6124">
                        <rect width="24" height="24" fill="white"/>
                    </clipPath>
                </defs>
            </svg>
        </div>
        <div class="_traces mt-24" style="max-height: 200px; overflow-y: auto">

        </div>
    </div>
</div>

