$(document).ready(function () {
    $('._trace').on('click', function () {
        viewAlert({content: '이력 상세로 이동'})
    })

    $('._trace button').on('click', function (e) {
        e.stopPropagation();
        viewAlert({content: 'QR 생성'})
    })

    $('#trace-created').on('show.bs.modal', function () {
        const user_type = $('._animals ._animal input').data().category;
        if (!availableFarmTypes.includes(user_type)) {
            viewAlert({content: '이력을 직접 입력할 수 없는 농장 종류입니다.', zIndex: 2000});
        }
    }).find('input#trace-search').next().on('click', function () {
        let $input = $('input#trace-search');
        console.log($input.val());
        findTrace($input.val()).then((result) => {
            console.log(result);
            if (result.status === 'OK') {
                console.log(result.data);
                if (result.data.status) {
                    // TODO 해당 번호로 데이터 가져오기
                    viewModal({
                        zIndex: 1999,
                        btnCount: 2,
                        backDrop: true,
                        title: `이력 조회 결과 : ${$input.val()}`,
                        desc: `연결 가능한 이력을 찾았습니다! 해당 이력을 연결하시겠습니까?<br>
                        이력 상 농장 주소 : ${result.data.address}<br><br>
                        ※ 주의! 이력제에 등록된 주소와 정보가 일치하는지 확인 후 연결해주시길 바랍니다.`,
                        onConfirm: () => {
                            viewAlert({content: `${$input.val()}`});
                            // TODO result.data.data 로 Format 만들기
                            createTrace(result.data.data).then((result) => {
                                if (result.status === 'OK') {
                                    if (result.data.status) {
                                        viewModal({
                                            btnCount: 1,
                                            title: '이력 제작 성공',
                                            desc: '이력이 성공적으로 제작되었습니다.',
                                            zIndex: 2500,
                                            onConfirm: function () {
                                                window.location.reload();
                                            },
                                            onShow: () => {
                                                $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                                            },
                                            onShown: () => {
                                                $('body .modal-backdrop._second').removeClass('_second').css('z-index', 1040);
                                                $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                                            },
                                        })
                                    }
                                }
                            })
                        },
                        onShow: () => {
                            $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                        },
                        onShown: () => {
                            $('body .modal-backdrop._second').removeClass('_second').css('z-index', 1040);
                            $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                        },
                    })
                } else {
                    if (result.data.type === 0) {
                        viewAlert({content: '묶음 이력 번호는 묶음 이력 생성에서 조회해주세요.', zIndex: 2000})
                    } else if (result.data.type === 1) {
                        viewAlert({content: '이미 하온에 등록되어 있는 이력 번호입니다.', zIndex: 2000})
                    } else {
                        viewAlert({content: '존재하지 않거나 개체 종류와 맞지 않는 이력 번호 입니다.', zIndex: 2000})
                    }
                }
            }
        })
    })


    $('.modal').on('click', '._trace-table-delete', function () {
        let $this = $(this);
        viewModal({
            btnCount: 2,
            title: '이력 요소 삭제',
            desc: '정말 삭제하시겠어요?',
            zIndex: 1999,
            onConfirm: function () {
                let tableBody = $this.closest('tbody');
                $this.parent().parent().remove();
                if (tableBody.find('tr').length === 1) {
                    tableBody.find('tr').removeClass('d-none');
                }
            },
            onShow: () => {
                $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
            },
            onShown: () => {
                $('body .modal-backdrop._second').removeClass('_second').css('z-index', 1040);
                $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
            },
        })

    })

    // 사육 make Part
    $('#pills-breed').on('click', '._add-new', function () {
        let parent = $(this).parent().parent();
        if (parent.prev().hasClass('_breed-table')) {
            parent.before(`<div class="_breed-make">
                                            <div class="row mt-24">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">신고 구분</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 d-flex flex-row">
                                                    <div class="mt-16">
                                                        <label data-label="checkbox" class="radio-item">
                                                            <input data-type="radio" data-value="breed-register" data-kor="등록" type="radio" name="breed-type">
                                                            <span class="design"></span>
                                                            <span class="ml-16">등록</span>
                                                        </label>
                                                    </div>

                                                    <div class="mt-16 ml-24">
                                                        <label data-label="checkbox" class="radio-item">
                                                            <input data-type="radio" data-value="breed-amniotic" data-kor="양도" type="radio" name="breed-type">
                                                            <span class="design"></span>
                                                            <span class="ml-16">양도</span>
                                                        </label>
                                                    </div>

                                                    <div class="mt-16 ml-24">
                                                        <label data-label="checkbox" class="radio-item">
                                                            <input data-type="radio" data-value="breed-slaughter" data-kor="출하" type="radio" name="breed-type">
                                                            <span class="design"></span>
                                                            <span class="ml-16">출하</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">농장
                                                            경영자</label>
                                                        <input type="text"
                                                               placeholder="농장 경영자 명 입력" name="breed-farmer"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>

                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">농장
                                                            명</label>
                                                        <input type="text"
                                                               placeholder="농장 명 입력" name="breed-farm"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">농장 링크</label>
                                                        <input type="text"
                                                               placeholder="농장 링크 입력" name="breed-link"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="form-group form-inner-button form-inner-label">
                                                        <label class="medium-h6 c-gray-dark-low">소재 일자</label>
                                                        <input type="text"
                                                               data-provide="datepicker" name="breed-date"
                                                               readonly
                                                               placeholder="날짜를 선택해주세요."
                                                               class="form-control input-box medium-h5 dropdown-input">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <g clip-path="url(#clip0_224_6221)">
                                                                <path d="M14.1667 2.49992H17.5C17.721 2.49992 17.933 2.58772 18.0893 2.744C18.2455 2.90028 18.3333 3.11224 18.3333 3.33325V16.6666C18.3333 16.8876 18.2455 17.0996 18.0893 17.2558C17.933 17.4121 17.721 17.4999 17.5 17.4999H2.5C2.27899 17.4999 2.06703 17.4121 1.91075 17.2558C1.75447 17.0996 1.66667 16.8876 1.66667 16.6666V3.33325C1.66667 3.11224 1.75447 2.90028 1.91075 2.744C2.06703 2.58772 2.27899 2.49992 2.5 2.49992H5.83333V0.833252H7.5V2.49992H12.5V0.833252H14.1667V2.49992ZM16.6667 7.49992V4.16659H14.1667V5.83325H12.5V4.16659H7.5V5.83325H5.83333V4.16659H3.33333V7.49992H16.6667ZM16.6667 9.16658H3.33333V15.8333H16.6667V9.16658ZM5 10.8333H9.16667V14.1666H5V10.8333Z"
                                                                      fill="#A9CC52"/>
                                                            </g>
                                                            <defs>
                                                                <clipPath id="clip0_224_6221">
                                                                    <rect width="20" height="20" fill="white"/>
                                                                </clipPath>
                                                            </defs>
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-6">
                                                    <label class="medium-h6 c-gray-dark-low">소재지</label>
                                                    <div class="form-group form-inner-button">
                                                        <input type="text" placeholder="주소를 입력해주세요." data-type="postcode"
                                                               class="form-control input-box medium-h5 cursor-pointer" readonly name="breed-farm-addr"
                                                               id="input20">
                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M12 23.7279L5.636 17.3639C4.37734 16.1052 3.52019 14.5016 3.17293 12.7558C2.82567 11.0099 3.00391 9.20035 3.6851 7.55582C4.36629 5.91129 5.51984 4.50569 6.99988 3.51677C8.47992 2.52784 10.22 2 12 2C13.78 2 15.5201 2.52784 17.0001 3.51677C18.4802 4.50569 19.6337 5.91129 20.3149 7.55582C20.9961 9.20035 21.1743 11.0099 20.8271 12.7558C20.4798 14.5016 19.6227 16.1052 18.364 17.3639L12 23.7279ZM16.95 15.9499C17.9289 14.9709 18.5955 13.7236 18.8656 12.3658C19.1356 11.0079 18.9969 9.60052 18.4671 8.32148C17.9373 7.04244 17.04 5.94923 15.8889 5.18009C14.7378 4.41095 13.3844 4.00043 12 4.00043C10.6156 4.00043 9.26222 4.41095 8.11109 5.18009C6.95996 5.94923 6.06275 7.04244 5.53292 8.32148C5.00308 9.60052 4.86442 11.0079 5.13445 12.3658C5.40449 13.7236 6.07111 14.9709 7.05 15.9499L12 20.8999L16.95 15.9499ZM12 12.9999C11.4696 12.9999 10.9609 12.7892 10.5858 12.4141C10.2107 12.0391 10 11.5304 10 10.9999C10 10.4695 10.2107 9.96078 10.5858 9.58571C10.9609 9.21064 11.4696 8.99992 12 8.99992C12.5304 8.99992 13.0391 9.21064 13.4142 9.58571C13.7893 9.96078 14 10.4695 14 10.9999C14 11.5304 13.7893 12.0391 13.4142 12.4141C13.0391 12.7892 12.5304 12.9999 12 12.9999Z"
                                                                  fill="#A9CC52"/>
                                                        </svg>
                                                    </div>
                                                </div>

                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">상세 주소</label>
                                                        <input type="text"
                                                               placeholder="상세주소 입력"
                                                                name="breed-farm-addr-spec"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-12 d-flex justify-content-end">
                                                    <button class="btn btn-brand medium-h4 _confirm">추가하기</button>
                                                </div>
                                            </div>
                                        </div>`);
            $('input[data-provide="datepicker"]').datepicker({
                format: 'yyyy년 mm월 dd일',
                endDate: 'today',
                language: 'ko',
                todayHighlight: true,
                defaultViewDate: 'today',
                autoclose: true
            }).datepicker('setDate', 'now');
        } else {
            viewAlert({content: '작성하시던 사육정보를 먼저 등록해주세요.', zIndex: 1060})
        }
    }).on('click', '._breed-make ._confirm', function () {
        let makeField = $(this).parent().parent().parent();
        let type = makeField.find('input[name="breed-type"]:checked');
        let farmer = makeField.find('input[name="breed-farmer"]');
        let farm = makeField.find('input[name="breed-farm"]');
        let link = makeField.find('input[name="breed-link"]');
        let date = makeField.find('input[name="breed-date"]');
        let addr = makeField.find('input[name="breed-farm-addr"]');
        let addr_specifc = makeField.find('input[name="breed-farm-addr-spec"]');
        // TODO Validation

        let b = false;
        const tableBody = $('#pills-breed .trace-register-table').find('tbody');
        let putTarget = tableBody;
        let slaughterExist = false;
        if (type.length !== 0) {
            if (type.data().value === 'breed-register') {
                // 표에 이미 등록이 존재하는지 체크
                if (tableBody.find('[data-type=breed-register]').length > 0) {
                    viewAlert({content: '전산 등록은 한 번만 가능합니다.', zIndex: 1060});
                    return false;
                } else {
                    b = true;
                }
            } else if (type.data().value === 'breed-amniotic') {
                // 표에 등록이 존재하는지 체크
                if (tableBody.find('[data-type=breed-register]').length <= 0) {
                    viewAlert({content: '먼저 전산 등록부터 하셔야합니다.', zIndex: 1060});
                    return false;
                } else {
                    if (tableBody.find('[data-type=breed-slaughter]').length > 0) {
                        // 표에 마지막이 양도가 아닌 출하라면 출하 위, 양도 중 마지막 순서에 넣기
                        putTarget = tableBody.find('[data-type=breed-slaughter]')[0];
                        slaughterExist = true;
                    } else {
                        // 그냥 맨 뒤에 append
                    }
                    b = true;
                }
            } else if (type.data().value === 'breed-slaughter') {
                // 표에 등록, 양도가 존재하는지 체크
                if (tableBody.find('[data-type=breed-register]').length <= 0) {
                    viewAlert({content: '먼저 전산 등록부터 하셔야합니다.', zIndex: 1060});
                    return false;
                } else {
                    b = true;
                }
            }
        } else {
            viewAlert({content: '신고 유형을 먼저 선택해주세요.', zIndex: 1060});
            return false;
        }

        // 농장 경영자 명
        if (farmer.val().trim().length <= 0) {
            viewAlert({content: '농장 경영자 명을 입력해주세요.', zIndex: 1060});
            return false;
        }

        // 농장 명
        if (farm.val().trim().length <= 0) {
            viewAlert({content: '농장 명을 입력해주세요.', zIndex: 1060});
            return false;
        }
        // 농장 링크

        // 소재 일자
        if (date.val().trim().length <= 0) {
            viewAlert({content: '소재 일자를 입력해주세요.', zIndex: 1060});
            return false;
        }
        // 소재지
        if (addr.val().trim().length <= 0) {
            viewAlert({content: '소재지를 입력해주세요.', zIndex: 1060});
            return false;
        }
        // 상세 주소
        if (addr_specifc.val().trim().length <= 0) {
            viewAlert({content: '상세 주소를 입력해주세요.', zIndex: 1060});
            return false;
        }

        if (b === true) {
            let emptyTr = tableBody.find('tr[data-type=empty]');
            if (!emptyTr.hasClass('d-none')) {
                emptyTr.addClass('d-none');
            }
            let element = `<tr data-type="${type.data().value}">
                                                        <td>${type.data().kor}</td>
                                                        <td>${farmer.val()}</td>
                                                        <td data-link="${link.val()}">${farm.val()}</td>
                                                        <td data-date="${date.val()}">${date.val()}</td>
                                                        <td>${addr.val()} ${addr_specifc.val()}</td>
                                                        <td scope="row">
                                                            <svg class="_trace-table-delete cursor-pointer" width="24"
                                                                 height="24" viewBox="0 0 24 24"
                                                                 fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd"
                                                                      clip-rule="evenodd"
                                                                      d="M12 1C5.925 1 1 5.925 1 12C1 18.075 5.925 23 12 23C18.075 23 23 18.075 23 12C23 5.925 18.075 1 12 1ZM15.707 9.707C15.8892 9.5184 15.99 9.2658 15.9877 9.0036C15.9854 8.7414 15.8802 8.49059 15.6948 8.30518C15.5094 8.11977 15.2586 8.0146 14.9964 8.01233C14.7342 8.01005 14.4816 8.11084 14.293 8.293L12 10.586L9.707 8.293C9.61475 8.19749 9.50441 8.12131 9.3824 8.0689C9.2604 8.01649 9.12918 7.9889 8.9964 7.98775C8.86362 7.9866 8.73194 8.0119 8.60905 8.06218C8.48615 8.11246 8.3745 8.18671 8.28061 8.28061C8.18671 8.3745 8.11246 8.48615 8.06218 8.60905C8.0119 8.73194 7.9866 8.86362 7.98775 8.9964C7.9889 9.12918 8.01649 9.2604 8.0689 9.3824C8.12131 9.50441 8.19749 9.61475 8.293 9.707L10.586 12L8.293 14.293C8.19749 14.3852 8.12131 14.4956 8.0689 14.6176C8.01649 14.7396 7.9889 14.8708 7.98775 15.0036C7.9866 15.1364 8.0119 15.2681 8.06218 15.391C8.11246 15.5139 8.18671 15.6255 8.28061 15.7194C8.3745 15.8133 8.48615 15.8875 8.60905 15.9378C8.73194 15.9881 8.86362 16.0134 8.9964 16.0123C9.12918 16.0111 9.2604 15.9835 9.3824 15.9311C9.50441 15.8787 9.61475 15.8025 9.707 15.707L12 13.414L14.293 15.707C14.4816 15.8892 14.7342 15.99 14.9964 15.9877C15.2586 15.9854 15.5094 15.8802 15.6948 15.6948C15.8802 15.5094 15.9854 15.2586 15.9877 14.9964C15.99 14.7342 15.8892 14.4816 15.707 14.293L13.414 12L15.707 9.707Z"
                                                                      fill="#A9CC52"/>
                                                            </svg>
                                                        </td>
                                                    </tr>`;
            if (slaughterExist) {
                // TODO 날짜 순서대로 정렬해주기
                $(putTarget).before(element);
            } else {
                tableBody.append(element);
            }
            makeField.remove();
        }
    })

    $('#pills-processing').on('click', '._add-new', function () {
        let parent = $(this).parent().parent();
        if (parent.prev().hasClass('_slaughter-table')) {
            parent.before(`<div class="_slaughter-make">
                                            <div class="row mt-24">
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">농장 명</label>
                                                        <input type="text"
                                                               placeholder="농장 명 입력"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>

                                                <div class="col-6">
                                                    <div class="form-group form-inner-button form-inner-label">
                                                        <label class="medium-h6 c-gray-dark-low">가공 일자</label>
                                                        <input type="text"
                                                               data-provide="datepicker"
                                                               readonly
                                                               placeholder="날짜를 입력해주세요."
                                                               class="form-control input-box medium-h5 dropdown-input">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <g clip-path="url(#clip0_224_6221)">
                                                                <path d="M14.1667 2.49992H17.5C17.721 2.49992 17.933 2.58772 18.0893 2.744C18.2455 2.90028 18.3333 3.11224 18.3333 3.33325V16.6666C18.3333 16.8876 18.2455 17.0996 18.0893 17.2558C17.933 17.4121 17.721 17.4999 17.5 17.4999H2.5C2.27899 17.4999 2.06703 17.4121 1.91075 17.2558C1.75447 17.0996 1.66667 16.8876 1.66667 16.6666V3.33325C1.66667 3.11224 1.75447 2.90028 1.91075 2.744C2.06703 2.58772 2.27899 2.49992 2.5 2.49992H5.83333V0.833252H7.5V2.49992H12.5V0.833252H14.1667V2.49992ZM16.6667 7.49992V4.16659H14.1667V5.83325H12.5V4.16659H7.5V5.83325H5.83333V4.16659H3.33333V7.49992H16.6667ZM16.6667 9.16658H3.33333V15.8333H16.6667V9.16658ZM5 10.8333H9.16667V14.1666H5V10.8333Z"
                                                                      fill="#A9CC52"/>
                                                            </g>
                                                            <defs>
                                                                <clipPath id="clip0_224_6221">
                                                                    <rect width="20" height="20" fill="white"/>
                                                                </clipPath>
                                                            </defs>
                                                        </svg>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">농장 링크</label>
                                                        <input type="text"
                                                               placeholder="농장 링크 입력"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-6">
                                                    <label class="medium-h6 c-gray-dark-low">소재지</label>
                                                    <div class="form-group form-inner-button">
                                                        <input type="text" placeholder="주소를 입력해주세요."
                                                               class="form-control input-box medium-h5 cursor-pointer" data-type="postcode" readonly
                                                               id="input22">
                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M12 23.7279L5.636 17.3639C4.37734 16.1052 3.52019 14.5016 3.17293 12.7558C2.82567 11.0099 3.00391 9.20035 3.6851 7.55582C4.36629 5.91129 5.51984 4.50569 6.99988 3.51677C8.47992 2.52784 10.22 2 12 2C13.78 2 15.5201 2.52784 17.0001 3.51677C18.4802 4.50569 19.6337 5.91129 20.3149 7.55582C20.9961 9.20035 21.1743 11.0099 20.8271 12.7558C20.4798 14.5016 19.6227 16.1052 18.364 17.3639L12 23.7279ZM16.95 15.9499C17.9289 14.9709 18.5955 13.7236 18.8656 12.3658C19.1356 11.0079 18.9969 9.60052 18.4671 8.32148C17.9373 7.04244 17.04 5.94923 15.8889 5.18009C14.7378 4.41095 13.3844 4.00043 12 4.00043C10.6156 4.00043 9.26222 4.41095 8.11109 5.18009C6.95996 5.94923 6.06275 7.04244 5.53292 8.32148C5.00308 9.60052 4.86442 11.0079 5.13445 12.3658C5.40449 13.7236 6.07111 14.9709 7.05 15.9499L12 20.8999L16.95 15.9499ZM12 12.9999C11.4696 12.9999 10.9609 12.7892 10.5858 12.4141C10.2107 12.0391 10 11.5304 10 10.9999C10 10.4695 10.2107 9.96078 10.5858 9.58571C10.9609 9.21064 11.4696 8.99992 12 8.99992C12.5304 8.99992 13.0391 9.21064 13.4142 9.58571C13.7893 9.96078 14 10.4695 14 10.9999C14 11.5304 13.7893 12.0391 13.4142 12.4141C13.0391 12.7892 12.5304 12.9999 12 12.9999Z"
                                                                  fill="#A9CC52"/>
                                                        </svg>
                                                    </div>
                                                </div>

                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">상세 주소</label>
                                                        <input type="text"
                                                               placeholder="상세주소 입력"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-12 d-flex justify-content-end">
                                                    <button class="btn btn-brand medium-h4 _confirm">추가하기</button>
                                                </div>
                                            </div>
                                        </div>`);
            $('input[data-provide="datepicker"]').datepicker({
                format: 'yyyy년 mm월 dd일',
                endDate: 'today',
                language: 'ko',
                todayHighlight: true,
                defaultViewDate: 'today',
                autoclose: true
            }).datepicker('setDate', 'now');
        } else {
            viewAlert({content: '작성하시던 가공 정보를 먼저 등록해주세요.', zIndex: 1060})

        }
    })

    $('.tab-pane').on('click', '[data-type=postcode]', function () {
        let input = $(this);
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                input.val(data.address);
                input.parent().parent().next().find('input').focus();
            }
        }).open();
    })

    $('#make-trace').on('click', function () {
        /** TODO
         * 1. 사육 -> 출하 정보 없이는 도축 정보 불가
         * 2. 도축 정보 없이는 가공 정보 입력 불가
         * 3. Modal 닫을 때 모든 정보 날리기
         * */
            // 등급
        let rate = $('[data-category=rate]').val();
        if (rate.trim().length === 0) {
            viewAlert({content: '등급을 선택해주세요.', zIndex: 1060});
            return false;
        }
        // 출생 일자
        let birth = $('input[name=trace-birth]').val();
        if (birth.trim().length === 0) {
            viewAlert({content: '출생 일자를 선택해주세요.', zIndex: 1060});
            return false;
        }
        // 성별
        let gender = $('input[name=gender]:checked');
        if (gender.length === 0) {
            viewAlert({content: '성별을 선택해주세요.', zIndex: 1060});
            return false;
        }
        // 사육정보
        /**
         * 사육 정보에 최소 breed-register 하나 이상 존재 필수
         * 사육 정보에 앞 단계 정보 없이 그 뒷 단계 정보가 존재할 시
         * */
        // 도축 정보
        /**
         * 사육 정보에 출하 정보 없을 시
         * */
        // 가공 정보
        /**
         * 도축 정보 없을 시
         * */

        // TRACE DATA FORMAT

        // MAKE
    })

});


const availableFarmTypes = ['SHEEP_GOAT', 'HORSE', 'RABBIT'];