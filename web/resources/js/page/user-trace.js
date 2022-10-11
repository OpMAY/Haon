const MODAL_ALERT_ZINDEX = 1060;

$(document).ready(function () {
    $('._trace').on('click', function () {
        window.open('/trace/single/' + $(this).data().no, '_blank');
    })

    $('._trace button._qr').on('click', function (e) {
        e.stopPropagation();
        let url = `${window.location.origin}/trace/single/${$(this).parent().data().no}`;
        viewModal({
            title: '이력 QR',
            desc: `<div class="d-flex flex-column align-items-center">
                        <div class="_qrArea mb-24">아래 이미지를 저장하여 QR 코드를 공유하세요.</div>
                        <div id="trace-qr" class="mb-24"><a download="qrCode.png" data-code="${$(this).data().code}"></a></div>
                        <button class="btn btn-brand-opacity btn-block" id="download-qr">QR 다운로드</button>
                    </div>`,
            confirm_text: '닫기',
        })
        new QRCode(document.getElementById('trace-qr'), {
            text: url,
            width: 256,
            height: 256,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H,
            alt: '스캔하세요.',
        });
    })

    $('._trace button._edit').on('click', function (e) {
        e.stopPropagation();
        getTraceModalData($(this).parent().data().no).then((result) => {
            console.log(result);
            setLoading(false);
            if (result.status === 'OK') {
                let tData = result.data.trace;
                const modal1_id = tokenGenerator();
                const modal2_id = tokenGenerator();
                let breedElement = ``;
                let processElement = ``;
                console.log(tData.butchery);
                tData.breed.forEach((elem, index) => {
                    breedElement = breedElement + `<tr data-type="${getTableBreedType(elem.type)}">
                                                        <td>${getBreedTypeKor(elem.type)}</td>
                                                        <td>${elem.breed_farmer_name}</td>
                                                        <td data-link="${elem.breed_farm_url}">${elem.breed_farm_name}</td>
                                                        <td data-date="${elem.breed_issue_date}">${elem.breed_issue_date}</td>
                                                        <td>${elem.breed_farm_addr}</td>
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
                })
                tData.process.forEach((elem, index) => {
                    processElement = processElement + `<tr>
                            <td data-link="${elem.process_url}">${elem.process_corp}</td>
                            <td data-date="${elem.process_date}">${elem.process_date}</td>
                            <td>${elem.process_addr}</td>
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
                })
                viewModal({
                    id: modal1_id,
                    title: `이력 수정 - ${tData.trace_code}`,
                    largeModal: true,
                    backDrop: true,
                    desc: `<div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label class="medium-h6 c-gray-dark-low">개체 축종</label>
                        </div>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-12 d-flex _animals">
                        <div class="_animal">
                            <label data-label="checkbox" class="radio-item">
                                <input data-type="radio" data-category="${tData.entity.entity_type}" type="radio" name="animal-edit" checked>
                                <span class="design"></span>
                                <span class="ml-16">${getEntityType(tData.entity.entity_type)}</span>
                            </label>
                        </div>
                    </div>
                </div>
                    <div class="_self-create-area">
                        <div class="row mt-32">
                            <div class="col-6">
                                <div class="dropdown input-dropdown">
                                    <div data-toggle="dropdown" aria-expanded="false"
                                         class="form-group form-inner-button form-inner-label">
                                        <label class="medium-h6 c-gray-dark-low">등급</label>
                                        <input type="text"
                                               placeholder="등급을 선택해주세요."
                                               data-category="rate" value="${tData.entity.rate}"
                                               class="form-control input-box medium-h5 dropdown-input"
                                               disabled>
                                        <svg width="28" height="28" viewBox="0 0 28 28" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_224_6214)">
                                                <path d="M15.3673 13.9999L9.59235 8.22489L11.242 6.57523L18.6667 13.9999L11.242 21.4246L9.59235 19.7749L15.3673 13.9999Z"
                                                      fill="#A9CC52"/>
                                            </g>
                                            <defs>
                                                <clipPath id="clip0_224_6214">
                                                    <rect width="28" height="28" fill="white"
                                                          transform="translate(0 28) rotate(-90)"/>
                                                </clipPath>
                                            </defs>
                                        </svg>
                                    </div>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item">
                                            <div>1++</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>1+</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>1등급</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>2등급</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>3등급</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group form-inner-button form-inner-label">
                                    <label class="medium-h6 c-gray-dark-low">출생 일자</label>
                                    <input type="text"
                                           data-provide="datepicker"
                                           readonly name="trace-birth"
                                           placeholder="날짜를 선택해주세요."
                                           value="${tData.entity.birth}"
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
                                    <label class="medium-h6 c-gray-dark-low">성별</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 d-flex flex-row">
                                <div class="mt-16">
                                    <label data-label="checkbox" class="radio-item">
                                        <input data-type="radio" data-value="거세" type="radio" name="gender">
                                        <span class="design"></span>
                                        <span class="ml-16">거세</span>
                                    </label>
                                </div>
                                
                                <div class="mt-16 ml-24">
                                    <label data-label="checkbox" class="radio-item">
                                        <input data-type="radio" data-value="비거세" type="radio" name="gender">
                                        <span class="design"></span>
                                        <span class="ml-16">비거세</span>
                                    </label>
                                </div>


                                <div class="mt-16 ml-24">
                                    <label data-label="checkbox" class="radio-item">
                                        <input data-type="radio" data-value="암컷" type="radio" name="gender" ${tData.entity.gender === '암컷' ? 'checked' : void (0)}>
                                        <span class="design"></span>
                                        <span class="ml-16">암컷</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-32">
                            <div class="col-12 p-20">
                                <ul class="nav nav-pills mb-3" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link mr-16 active" data-toggle="pill"
                                                data-target="#pills-breed-edit" type="button" role="tab"
                                                aria-controls="pills-home"
                                                aria-selected="true">사육
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link mr-16" data-toggle="pill"
                                                data-target="#pills-slaughter-edit"
                                                type="button" role="tab" aria-controls="pills-profile"
                                                aria-selected="false">도축
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" data-toggle="pill"
                                                data-target="#pills-processing-edit"
                                                type="button" role="tab" aria-controls="pills-profile"
                                                aria-selected="false">가공
                                        </button>
                                    </li>
                                </ul>
                                <div class="tab-content" id="pills-tabContent2">
                                    <!--사육 Tab-->
                                    <div class="tab-pane fade show active" id="pills-breed-edit" role="tabpanel"
                                         aria-labelledby="pills-home-tab">
                                        <div class="row _breed-table">
                                            <div class="col-12">
                                                <table class="table table-bordered trace-register-table">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">신고 구분</th>
                                                        <th scope="col">농장 경영자</th>
                                                        <th scope="col">농장 명</th>
                                                        <th scope="col">년 월일</th>
                                                        <th scope="col">소재지</th>
                                                        <th scope="col">삭제</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    ${breedElement}
                                                    <tr data-type="empty" class="${tData.breed.length > 0 ? 'd-none' : ''}">
                                                        <td colspan="6">
                                                            <span class="c-gray-light">사육 정보를 추가하세요.</span>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <span class="card-text _farm-type bold-h5 c-brand-green _add-new cursor-pointer">
                                                    사육 정보 추가 +
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <!--도축 Tab-->
                                    <div class="tab-pane fade" id="pills-slaughter-edit" role="tabpanel"
                                         aria-labelledby="pills-profile-tab">

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">도축 결과</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12 d-flex flex-row">
                                                <div class="mt-16">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" data-value="true" type="radio" ${tData.butchery.length > 0 ? (tData.butchery[0].butchery_result === 'true' ? 'checked' : '') : ''}
                                                               name="amniotic-edit-success">
                                                        <span class="design"></span>
                                                        <span class="ml-16">합격</span>
                                                    </label>
                                                </div>

                                                <div class="mt-16 ml-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" data-value="false" type="radio" ${tData.butchery.length > 0 ? (tData.butchery[0].butchery_result === 'false' ? 'checked' : '') : ''}
                                                               name="amniotic-edit-success">
                                                        <span class="design"></span>
                                                        <span class="ml-16">불합격</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-32">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장 명</label>
                                                    <input type="text"
                                                           placeholder="농장 명 입력" name="amniotic-edit-farm" value="${tData.butchery.length > 0 ? (tData.butchery[0].butchery_corp) : ''}"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group form-inner-button form-inner-label">
                                                    <label class="medium-h6 c-gray-dark-low">도축 일자</label>
                                                    <input type="text"
                                                           data-provide="datepicker"
                                                           readonly
                                                           placeholder="날짜를 입력하세요."
                                                           name="amniotic-edit-date" value="${tData.butchery.length > 0 ? (tData.butchery[0].butchery_date) : ''}"
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
                                                    <input type="text" placeholder="주소를 입력해주세요." data-type="postcode"
                                                           class="form-control input-box medium-h5 cursor-pointer"
                                                           readonly
                                                           name="amniotic-edit-addr" value="${tData.butchery.length > 0 ? (tData.butchery[0].butchery_addr) : ''}"
                                                           id="input21">
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
                                                           placeholder="상세주소 입력" name="amniotic-edit-addr-spec" value="${tData.butchery.length > 0 ? (tData.butchery[0].butchery_addr_spec) : ''}"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <!--가공 Tab-->
                                    <div class="tab-pane fade" id="pills-processing-edit" role="tabpanel"
                                         aria-labelledby="pills-profile-tab">

                                        <div class="row _slaughter-table">
                                            <div class="col-12">
                                                <table class="table table-bordered trace-register-table">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">업소 명</th>
                                                        <th scope="col">소재지</th>
                                                        <th scope="col">가공 일자</th>
                                                        <th scope="col">삭제</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    ${processElement}
                                                    <tr data-type="empty" class="${tData.process.length !== 0 ? 'd-none' : ''}">
                                                        <td colspan="6">
                                                            <span class="c-gray-light">가공 정보를 추가하세요.</span>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <span class="card-text _farm-type bold-h5 c-brand-green _add-new cursor-pointer">
                                                    가공 정보 추가 +
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>`,
                    confirm_text: '수정하기',
                    btnCount: 2,
                    onConfirm: () => {
                        viewModal({
                            id: modal2_id,
                            zIndex: 1300,
                            title: '이력 수정',
                            desc: '정말 이력을 수정하시겠습니까?',
                            backDrop: true,
                            btnCount: 2,
                            onConfirm: () => {
                                let no = tData.no;
                                console.log(no);
                                /** TODO
                                 * 1. 사육 -> 출하 정보 없이는 도축 정보 불가
                                 * 2. 도축 정보 없이는 가공 정보 입력 불가
                                 * 3. Modal 닫을 때 모든 정보 날리기
                                 * */
                                let $editModal = $(`#${modal1_id}`);
                                // 등급
                                let rate = $editModal.find('[data-category=rate]').val();
                                if (rate.trim().length === 0) {
                                    viewAlert({content: '등급을 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                    return false;
                                }
                                // 출생 일자
                                let birth = $editModal.find('input[name=trace-birth]').val();
                                if (birth.trim().length === 0) {
                                    viewAlert({content: '출생 일자를 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                    return false;
                                }
                                // 성별
                                let gender = $editModal.find('input[name=gender]:checked');
                                if (gender.length === 0) {
                                    viewAlert({content: '성별을 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                    return false;
                                }
                                const entity = {};
                                entity.entity_type = $editModal.find('input[name=animal-edit]').data().category;
                                entity.birth = birth;
                                entity.gender = gender.data().value;
                                entity.rate = rate;
                                // 사육정보
                                /**
                                 * 사육 정보에 최소 breed-register 하나 이상 존재 필수
                                 * 사육 정보에 앞 단계 정보 없이 그 뒷 단계 정보가 존재할 시
                                 * */
                                const breeds = [];
                                let has_slaughter = false;
                                let breed_table = $editModal.find('#pills-breed-edit').find('tbody');
                                if (breed_table.find('tr').length === 1) {
                                    // Empty Type만 있을 경우
                                    viewAlert({content: '사육 정보는 필수입니다.', zIndex: MODAL_ALERT_ZINDEX});
                                    return false;
                                } else {
                                    let datas = breed_table.find('tr:not([data-type=empty])');
                                    datas.each((index, element) => {
                                        const breed = {};
                                        breed.type = $(element).data().type.split('breed-')[1].toUpperCase();
                                        breed.breed_farmer_name = $(element).find('td:nth-child(2)').html();
                                        breed.breed_farm_name = $(element).find('td:nth-child(3)').html();
                                        breed.breed_farm_url = $(element).find('td:nth-child(3)').data().link;
                                        breed.breed_issue_date = $(element).find('td:nth-child(4)').data().date;
                                        breed.breed_farm_addr = $(element).find('td:nth-child(5)').html();
                                        breeds.push(breed);
                                        if (breed.type === 'SLAUGHTER') {
                                            has_slaughter = true;
                                        }
                                    })
                                    console.log(breeds);
                                }
                                // 도축 정보
                                /**
                                 * 사육 정보에 출하 정보 없을 시
                                 * */
                                let slaughter_tab = $editModal.find('#pills-slaughter-edit');
                                let result = slaughter_tab.find('input[name=amniotic-edit-success]:checked');
                                let butchery_use = $('input[name=use-amniotic]').is(':checked');
                                const butcheries = [];
                                if (butchery_use) {
                                    // 도축 정보가 입력 되었을 때
                                    console.log(result);
                                    if (breeds.length <= 0) {
                                        viewAlert({
                                            content: '도축 정보를 등록하기 위해선 사육 정보는 필수입니다.',
                                            zIndex: MODAL_ALERT_ZINDEX
                                        });
                                        return false;
                                    } else if (!has_slaughter) {
                                        viewAlert({
                                            content: '도축 정보를 등록하기 위해선 출하 정보는 필수입니다.',
                                            zIndex: MODAL_ALERT_ZINDEX
                                        });
                                        return false;
                                    } else {
                                        let butchery = {};
                                        let result = slaughter_tab.find('input[name=amniotic-edit-success]');
                                        let farm = slaughter_tab.find('input[name=amniotic-edit-farm]').val();
                                        let date = slaughter_tab.find('input[name=amniotic-edit-date]').val();
                                        let addr = slaughter_tab.find('input[name=amniotic-edit-addr]').val();
                                        let addr_spec = slaughter_tab.find('input[name=amniotic-edit-addr-spec]').val();
                                        if (result.length <= 0) {
                                            viewAlert({content: '도축 합격 여부를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                            return false;
                                        }
                                        if (farm.trim().length <= 0) {
                                            viewAlert({content: '도축장 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                            return false;
                                        }
                                        if (date.trim().length <= 0) {
                                            viewAlert({content: '도축 일자를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                            return false;
                                        }
                                        if (addr.trim().length <= 0) {
                                            viewAlert({content: '도축 소재지를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                            return false;
                                        }
                                        if (addr_spec.trim().length <= 0) {
                                            viewAlert({content: '도축 소재지 상세 주소를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                            return false;
                                        }
                                        butchery.butchery_result = result.data().value;
                                        butchery.butchery_corp = farm.trim();
                                        butchery.butchery_date = date.trim();
                                        butchery.butchery_addr = `${addr.trim()}`;
                                        butchery.butchery_addr_spec = `${addr_spec.trim()}`;
                                        butcheries.push(butchery);
                                    }
                                }
                                console.log(butcheries);
                                // 가공 정보
                                /**
                                 * 도축 정보 없을 시
                                 * */
                                const processes = [];
                                let process_table = $editModal.find('#pills-processing-edit').find('tbody');
                                let process_datas = process_table.find('tr:not([data-type=empty])')
                                if (process_datas.length > 0) {
                                    if (butcheries.length <= 0) {
                                        viewAlert({content: '가공 정보를 위해서 도축 정보를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                                        return false;
                                    } else {
                                        process_datas.each((i, e) => {
                                            console.log(e);
                                            let process = {};
                                            process.process_corp = $(e).find('td:first-child').html();
                                            process.process_url = $(e).find('td:first-child').data().link;
                                            process.process_date = $(e).find('td:nth-child(2)').data().date;
                                            process.process_addr = $(e).find('td:nth-child(3)').html();
                                            processes.push(process);
                                        })
                                    }
                                }
                                // TRACE DATA FORMAT
                                const sendData = {};
                                sendData.no = tData.no;
                                sendData.farm_no = tData.farm_no;
                                sendData.entity = entity;
                                sendData.breed = breeds;
                                sendData.butchery = butcheries;
                                sendData.process = processes;

                                console.log('result data : ', sendData);
                                editTrace(sendData).then((result) => {
                                    setLoading(false);
                                    console.log(result);
                                    if (result.status === 'OK') {
                                        if (result.data.status) {
                                            viewModal({
                                                btnCount: 1,
                                                title: '이력 수정 성공',
                                                desc: '이력이 성공적으로 수정되었습니다.',
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
                                        } else {
                                            viewAlert({content: '잘못된 접근입니다.', zIndex: 3000});
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
                            onHide: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            },
                            onHidden: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            }
                        })
                    }
                });
                let confirmButton = $(`#${modal1_id}`).find('.modal-footer .btn:last-child');
                confirmButton.removeAttr('data-dismiss');
                $(`#${modal1_id}`).find('input[name=trace-birth]').datepicker({
                    format: 'yyyy년 mm월 dd일',
                    endDate: 'today',
                    language: 'ko',
                    todayHighlight: true,
                    defaultViewDate: 'today',
                    autoclose: true
                }).datepicker('setDate', tData.entity.birth);
                $(`#${modal1_id}`)
                    .on('click', '#pills-breed-edit ._add-new', function () {
                        createBreedMakeTab($(this));
                    })
                    .on('click', '#pills-breed-edit ._confirm', function () {
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
                        const tableBody = $('#pills-breed-edit .trace-register-table').find('tbody');
                        let putTarget = tableBody;
                        let slaughterExist = false;
                        if (type.length !== 0) {
                            if (type.data().value === 'breed-register') {
                                // 표에 이미 등록이 존재하는지 체크
                                if (tableBody.find('[data-type=breed-register]').length > 0) {
                                    viewAlert({content: '전산 등록은 한 번만 가능합니다.', zIndex: MODAL_ALERT_ZINDEX});
                                    return false;
                                } else {
                                    b = true;
                                }
                            } else if (type.data().value === 'breed-amniotic') {
                                // 표에 등록이 존재하는지 체크
                                if (tableBody.find('[data-type=breed-register]').length <= 0) {
                                    viewAlert({content: '먼저 전산 등록부터 하셔야합니다.', zIndex: MODAL_ALERT_ZINDEX});
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
                                // 표에 등록이 존재하는지 체크, 양도는 필수 X
                                if (tableBody.find('[data-type=breed-register]').length <= 0) {
                                    viewAlert({content: '먼저 전산 등록부터 하셔야합니다.', zIndex: MODAL_ALERT_ZINDEX});
                                    return false;
                                } else {
                                    b = true;
                                }
                            }
                        } else {
                            viewAlert({content: '신고 유형을 먼저 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }

                        // 농장 경영자 명
                        if (farmer.val().trim().length <= 0) {
                            viewAlert({content: '농장 경영자 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }

                        // 농장 명
                        if (farm.val().trim().length <= 0) {
                            viewAlert({content: '농장 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }
                        // 농장 링크

                        // 소재 일자
                        if (date.val().trim().length <= 0) {
                            viewAlert({content: '소재 일자를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }
                        // 소재지
                        if (addr.val().trim().length <= 0) {
                            viewAlert({content: '소재지를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }
                        // 상세 주소
                        if (addr_specifc.val().trim().length <= 0) {
                            viewAlert({content: '상세 주소를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
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
                    .on('click', '#pills-breed-edit ._cancel', function () {
                        $('._breed-make').remove();
                    })
                    .on('click', '#pills-processing-edit ._add-new', function () {
                        createProcessMakeTab($(this));
                    })
                    .on('click', '#pills-processing-edit ._confirm', function () {
                        let makeField = $(this).parent().parent().parent();
                        let tableBody = $('#pills-processing-edit ._slaughter-table').find('tbody');
                        let farm = makeField.find('input[name="slaughter-farm"');
                        let date = makeField.find('input[name="slaughter-date"');
                        let url = makeField.find('input[name="slaughter-url"');
                        let addr = makeField.find('input[name="slaughter-addr"');
                        let addr_spec = makeField.find('input[name="slaughter-addr-spec"');

                        if (farm.val().trim().length <= 0) {
                            viewAlert({content: '농장 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }
                        if (date.val().trim().length <= 0) {
                            viewAlert({content: '가공 일자를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }
                        if (addr.val().trim().length <= 0) {
                            viewAlert({content: '가공 소재지를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }
                        if (addr_spec.val().trim().length <= 0) {
                            viewAlert({content: '가공 소재지 상세 주소를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }

                        let element = `<tr>
                            <td data-link="${url.val()}">${farm.val()}</td>
                            <td data-date="${date.val()}">${date.val()}</td>
                            <td>${addr.val()} ${addr_spec.val()}</td>
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
                        </tr>`
                        if (tableBody.find('tr').length === 1) {
                            tableBody.find('tr[data-type="empty"]').addClass('d-none');
                        }
                        tableBody.append(element);
                        makeField.remove();

                    })
                    .on('click', '#pills-processing-edit ._cancel', function () {
                        $('._slaughter-make').remove();
                    })
                    .on('click', '._trace-table-delete', function () {
                        let $this = $(this);
                        viewModal({
                            btnCount: 2,
                            title: '이력 요소 삭제',
                            desc: '정말 삭제하시겠어요?',
                            backDrop: true,
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
                            onHide: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            },
                            onHidden: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            }
                        })
                    })
                    .on('click', '#pills-slaughter-edit [data-type=postcode]', function () {
                        let input = $(this);
                        if (!input.hasClass('postcode-init')) {
                            new daum.Postcode({
                                oncomplete: function (data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                                    input.val(data.address);
                                    input.parent().parent().next().find('input').focus();
                                }
                            }).open();
                            input.addClass('postcode-init');
                        }
                    })
            }
        })
    })

    $('._trace button._delete').on('click', function (e) {
        e.stopPropagation();
        let $thisElem = $(this).parent().parent().parent();
        let no = $(this).parent().data().no;
        getTraceInBundle(no).then((result) => {
            setLoading(false);
            console.log(result);
            if (result.status) {
                if (result.data.status) {
                    if (result.data.type) {
                        viewAlert({content: '해당 이력이 묶음 이력에 연결되어 있습니다.<br>묶음 이력을 먼저 해제해주세요.'});
                        return false;
                    } else {
                        viewModal({
                            btnCount: 1,
                            backDrop: true,
                            title: '이력 삭제',
                            desc: '해당 이력이 묶음 이력과 연결되어 있습니다.<br>' +
                                '이 이력과 엮여져있는 묶음 이력 삭제 시 해당 이력을 삭제할 수 있습니다.',
                        });
                        return false;
                    }
                } else {
                    viewModal({
                        btnCount: 2,
                        backDrop: true,
                        title: '이력 삭제',
                        desc: '해당 이력을 삭제하시겠어요?',
                        onConfirm: () => {
                            deleteTrace(no).then((result) => {
                                setLoading(false);
                                if (result.status === 'OK') {
                                    viewAlert({content: '삭제되었습니다.'})
                                    $thisElem.remove();
                                    if ($('._traces').find('._trace').length <= 0) {
                                        $('._traces').append(`<div class="bold-h2 c-gray-light" style="text-align: center">
                                                    <span>등록된 이력이 없어요.</span>
                                                </div>`);
                                    }
                                }
                            })
                        }
                    });
                }
            }
        })

    })

    $('._bundle').on('click', function () {
        window.open('/trace/package/' + $(this).data().no, '_blank');
    })

    $('._bundle button._qr').on('click', function (e) {
        e.stopPropagation();
        let url = `${window.location.origin}/trace/package/${$(this).parent().data().no}`;
        viewModal({
            id: 'qrModal',
            title: '이력 QR',
            backDrop: true,
            desc: `<div class="d-flex flex-column align-items-center">
                        <div class="_qrArea mb-24">아래 이미지를 저장하여 QR 코드를 공유하세요.</div>
                        <div id="trace-qr" class="mb-24"><a download="qrCode.png" data-code="${$(this).data().code}"></a></div>
                        <button class="btn btn-brand-opacity btn-block" id="download-qr">QR 다운로드</button>
                    </div>`,
            confirm_text: '닫기'
        })
        new QRCode(document.getElementById('trace-qr'), {
            text: url,
            width: 256,
            height: 256,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H,
            alt: '스캔하세요.',
        });
    })

    $('._bundle button._edit').on('click', function (e) {
        e.stopPropagation();
        bundleEditModalOpen($(this).parent().data().no);
    })

    $('._bundle-bottom span:first-child').on('click', function (e) {
        e.stopPropagation();
        bundleEditModalOpen($(this).parent().parent().data().no);
    })

    function bundleEditModalOpen(no) {
        getBundleModalData(no).then((result) => {
            setLoading(false);
            console.log(result);
            if (result.status === 'OK') {
                if (result.data.status) {
                    let bData = result.data.bundle;
                    let traces = ``;
                    let modalId = tokenGenerator();
                    bData.traceList.forEach((elem, index) => {
                        traces = traces + `<tr>
                                                <td data-no="${elem.no}">${elem.trace_code}</td>
                                                <td>${elem.entity.rate}</td>
                                                <td>${elem.breed[0].breed_farmer_name}</td>
                                                <td>${elem.breed[0].breed_farm_addr}</td>
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
                                            </tr>`
                    })
                    viewModal({
                        id: modalId,
                        title: `묶음 이력 수정 - ${bData.bundle_code}`,
                        desc: `<div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label class="medium-h6 c-gray-dark-low">개체 축종</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 d-flex _animals">
                                        <div class="_animal">
                                            <label data-label="checkbox" class="radio-item">
                                                <input data-type="radio" data-category="${bData.traceList[0].entity.entity_type}" type="radio" name="bundle-animal"
                                                       checked>
                                                <span class="design"></span>
                                                <span class="ml-16">${getEntityType(bData.traceList[0].entity.entity_type)}</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-32">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="medium-h6 c-gray-dark-low">추가할 이력 조회</label>
                                                <div class="form-group form-inner-button">
                                                    <input type="text" placeholder="이력번호를 입력하세요." id="bundle-trace-search"
                                                           class="form-control input-box medium-h5">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
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
                                            </div>
                                        </div>
                                    </div>
                                <div class="row mt-24" id="result-traces">
            
                                </div>
                                <div class="row mt-24">
                                    <div class="col-12">
                                        <table class="table table-bordered trace-register-table">
                                            <thead>
                                            <tr>
                                                <th scope="col">이력 번호</th>
                                                <th scope="col">등급</th>
                                                <th scope="col">사용자</th>
                                                <th scope="col">소재지</th>
                                                <th scope="col">삭제</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            ${traces}
                                            <tr data-type="empty" class="d-none">
                                                <td colspan="6">
                                                    <span class="c-gray-light">묶을 이력을 추가하세요.</span>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>`,
                        btnCount: 2,
                        confirm_text: '수정하기',
                        largeModal: true,
                        backDrop: true,
                        onConfirm: () => {
                            viewModal({
                                title: '묶음 이력 수정',
                                desc: '묶음 이력을 수정하시겠습니까?',
                                btnCount: 2,
                                backDrop: true,
                                zIndex: 1300,
                                onConfirm: () => {
                                    let table = $(`#${modalId}`).find('#result-traces').next().find('.trace-register-table tbody');
                                    if (table.find('tr').length <= 2) {
                                        viewAlert({
                                            content: '묶음 이력을 제작하기 위해선 최소 2개 이상의 이력을 등록해주세요.',
                                            zIndex: MODAL_ALERT_ZINDEX
                                        });
                                        return false;
                                    } else {
                                        let list = [];
                                        table.find('tr:not([data-type=empty])').each((idx, elem) => {
                                            console.log(elem);
                                            let no = $(elem).find('td:first-child').data().no;
                                            list.push(no);
                                        })
                                        console.log(list);
                                        updateManualBundle(list, bData.no).then((result) => {
                                            setLoading(false);
                                            console.log(result);
                                            if (result.status === 'OK') {
                                                if (result.data.status) {
                                                    viewModal({
                                                        btnCount: 1,
                                                        title: '묶음 이력 수정 성공',
                                                        desc: '묶음 이력이 성공적으로 수정되었습니다.',
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
                                            } else {
                                                viewAlert({content: '묶음 이력을 수정할 수 없습니다.', zIndex: MODAL_ALERT_ZINDEX});
                                                return false;
                                            }
                                        })
                                    }
                                },
                                onShow: () => {
                                    $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                                },
                                onShown: () => {
                                    $('body .modal-backdrop._second').removeClass('_second').css('z-index', 1040);
                                    $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                                },
                                onHide: () => {
                                    if (!$(document.body).hasClass('modal-open')) {
                                        $(document.body).addClass('modal-open');
                                    }
                                },
                                onHidden: () => {
                                    if (!$(document.body).hasClass('modal-open')) {
                                        $(document.body).addClass('modal-open');
                                    }
                                }
                            })

                        },
                    })
                    let $thisModal = $(`#${modalId}`)
                    let confirmButton = $thisModal.find('.modal-footer .btn:last-child');
                    confirmButton.removeAttr('data-dismiss');
                    $thisModal
                        .find('input#bundle-trace-search').next().on('click', function () {
                        let input = $thisModal.find('#bundle-trace-search');
                        let code = input.val();
                        if (code.trim().length <= 0) {
                            viewAlert({content: '조회할 이력번호를 입력하세요.', zIndex: MODAL_ALERT_ZINDEX});
                        } else {
                            getTraceByCode(code).then((result) => {
                                setLoading(false);
                                console.log(result);
                                if (result.status === 'OK') {
                                    let dataStatus = result.data.status;
                                    if (dataStatus === -1) {
                                        viewAlert({
                                            content: '본인 농장의 이력만 묶음 이력으로 등록할 수 있습니다.',
                                            zIndex: MODAL_ALERT_ZINDEX
                                        });
                                        return false;
                                    } else if (dataStatus === -3) {
                                        viewAlert({content: '존재하지 않는 이력입니다.', zIndex: MODAL_ALERT_ZINDEX});
                                        return false;
                                    } else {
                                        input.val('');
                                        console.log(result.data.data);
                                        let trace = result.data.data;
                                        const result_area = $thisModal.find('#result-traces')
                                        result_area.children().remove();
                                        result_area.append(`<div class="col-12">
                                                <div class="trace-register-item">
                                                    <span class="bold-h5" data-no="${trace.no}">${trace.trace_code}</span>
                                                    <span class="regular-h5">${trace.entity.rate}</span>
                                                    <span class="regular-h5">${trace.entity.gender}</span>
                                                    <span class="regular-h5 mr-auto" data-farmer="${trace.breed[0].breed_farmer_name}" data-addr="${trace.breed[0].breed_farm_addr}">${trace.entity.birth !== null ? (trace.entity.birth + ' 출생') : ''}</span>
                                                    <button type="button"
                                                            class="btn btn-sm btn-brand-opacity bold-h5 ml-auto">
                                                        이력 추가하기
                                                    </button>
                                                </div>
                                            </div>`);
                                    }
                                }
                            })
                        }
                    })
                    $thisModal.find('#result-traces').on('click', '.trace-register-item button', function () {
                        console.log($(this).parent());
                        let elem = $(this).parent();
                        let code = elem.find('span:first-child').html();
                        let table = $thisModal.find('#result-traces').next().find('.trace-register-table tbody');
                        let no = elem.find('span:first-child').data().no;
                        let trs = table.find('tr');
                        let duplicate = false;
                        trs.each((idx, elem) => {
                            if ($(elem).find('td:first-child').data().no === no) {
                                duplicate = true;
                            }
                        })
                        if (duplicate) {
                            viewAlert({
                                content: '이미 등록 목록에 추가한 이력입니다.',
                                zIndex: MODAL_ALERT_ZINDEX
                            });
                            return false;
                        }
                        let rate = elem.find('span:nth-child(2)').html();
                        let farmer = elem.find('span:nth-child(4)').data().farmer;
                        let addr = elem.find('span:nth-child(4)').data().addr;
                        if (table.find('tr').length === 1) {
                            table.find('tr[data-type=empty]').addClass('d-none');
                        }
                        let tr = `<tr>
                    <td data-no="${no}">${code}</td>
                    <td>${rate}</td>
                    <td>${farmer}</td>
                    <td>${addr}</td>
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
                </tr>`
                        table.append(tr);
                        $(this).parent().parent().remove();
                    })
                    $thisModal.on('click', '._trace-table-delete', function () {
                        let $this = $(this);
                        viewModal({
                            btnCount: 2,
                            title: '이력 요소 삭제',
                            desc: '정말 삭제하시겠어요?',
                            backDrop: true,
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
                            onHide: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            },
                            onHidden: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            }
                        })
                    })
                } else {
                    viewAlert({content: '잘못된 접근입니다.'});
                }
            }
        })
    }

    $('._bundle button._delete').on('click', function (e) {
        e.stopPropagation();
        let $thisElem = $(this).parent().parent().parent();
        let no = $(this).parent().data().no;
        viewModal({
            btnCount: 2,
            backDrop: true,
            title: '이력 삭제',
            desc: '해당 이력을 삭제하시겠어요?<br><br>※ 묶음 이력만 삭제되며, 묶음 이력에 엮여진 이력은 삭제되지 않습니다.',
            onConfirm: () => {
                deleteBundle(no).then((result) => {
                    setLoading(false);
                    if (result.status === 'OK') {
                        viewAlert({content: '삭제되었습니다.'})
                        $thisElem.remove();
                        if ($('._bundles').find('._bundle').length <= 0) {
                            $('._bundles').append(`<div class="bold-h2 c-gray-light" style="text-align: center">
                                                    <span>등록된 묶음 이력이 없어요.</span>
                                                </div>`);
                        }
                    }
                })
            }
        });
        viewAlert({content: '삭제 ' + $(this).parent().data().no})
    })
// Bundle Related Functions START
    $('#trace-created')
        .on('show.bs.modal', function () {
            const user_type = $('._animals ._animal input').data().category;
            if (!availableFarmTypes.includes(user_type)) {
                viewAlert({content: '이력을 직접 입력할 수 없는 농장 종류입니다.', zIndex: 2000});
            }
        })
        .find('input#trace-search').next().on('click', function () {
        let $input = $('input#trace-search');
        console.log($input.val());
        findTrace($input.val()).then((result) => {
            setLoading(false);
            console.log(result);
            if (result.status === 'OK') {
                if (result.data.status) {
                    viewModal({
                        zIndex: 1999,
                        btnCount: 2,
                        backDrop: true,
                        title: `이력 조회 결과 : ${$input.val()}`,
                        desc: `연결 가능한 이력을 찾았습니다! 해당 이력을 연결하시겠습니까?<br>
                        이력 상 농장 주소 : ${result.data.address}<br><br>
                        ※ 주의! 이력제에 등록된 주소와 정보가 일치하는지 확인 후 연결해주시길 바랍니다.`,
                        onConfirm: () => {
                            // TODO result.data.data 로 Format 만들기
                            createTrace(result.data.data).then((result) => {
                                setLoading(false);
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
                        }
                    })
                } else {
                    if (result.data.type === 0) {
                        viewAlert({content: '묶음 이력 번호는 묶음 이력 생성에서 조회해주세요.', zIndex: 2000})
                        return false;
                    } else if (result.data.type === 1) {
                        viewAlert({content: '이미 하온에 등록되어 있는 이력 번호입니다.', zIndex: 2000})
                        return false;
                    } else {
                        viewAlert({content: '존재하지 않거나 개체 종류와 맞지 않는 이력 번호 입니다.', zIndex: 2000})
                        return false;
                    }
                }
            }
        })
    })
    $('#trace-created').on('hidden.bs.modal', function () {
        console.log('hidden')

        const user_type = $('._animals ._animal input').data().category;
        let modal = $(this);
        if (!availableFarmTypes.includes(user_type)) {
            // 직접 입력 X
            console.log('if')
            modal.find('input').val('');
        } else {
            console.log('else')
            modal.find('._self-create-area').children().remove();
            modal.find('._self-create-area').append(`<div class="row mt-32">
                            <div class="col-6">
                                <div class="dropdown input-dropdown">
                                    <div data-toggle="dropdown" aria-expanded="false"
                                         class="form-group form-inner-button form-inner-label">
                                        <label class="medium-h6 c-gray-dark-low">등급</label>
                                        <input type="text"
                                               placeholder="등급을 선택해주세요."
                                               data-category="rate"
                                               class="form-control input-box medium-h5 dropdown-input"
                                               disabled>
                                        <svg width="28" height="28" viewBox="0 0 28 28" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <g clip-path="url(#clip0_224_6214)">
                                                <path d="M15.3673 13.9999L9.59235 8.22489L11.242 6.57523L18.6667 13.9999L11.242 21.4246L9.59235 19.7749L15.3673 13.9999Z"
                                                      fill="#A9CC52"/>
                                            </g>
                                            <defs>
                                                <clipPath id="clip0_224_6214">
                                                    <rect width="28" height="28" fill="white"
                                                          transform="translate(0 28) rotate(-90)"/>
                                                </clipPath>
                                            </defs>
                                        </svg>
                                    </div>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item">
                                            <div>1++</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>1+</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>1등급</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>2등급</div>
                                        </a>
                                        <a class="dropdown-item">
                                            <div>3등급</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group form-inner-button form-inner-label">
                                    <label class="medium-h6 c-gray-dark-low">출생 일자</label>
                                    <input type="text"
                                           data-provide="datepicker"
                                           readonly name="trace-birth"
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
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="medium-h6 c-gray-dark-low">성별</label>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 d-flex flex-row">
                                <div class="mt-16">
                                    <label data-label="checkbox" class="radio-item">
                                        <input data-type="radio" data-value="수컷" type="radio" name="gender">
                                        <span class="design"></span>
                                        <span class="ml-16">수컷</span>
                                    </label>
                                </div>

                                <div class="mt-16 ml-24">
                                    <label data-label="checkbox" class="radio-item">
                                        <input data-type="radio" data-value="암컷" type="radio" name="gender">
                                        <span class="design"></span>
                                        <span class="ml-16">암컷</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-32">
                            <div class="col-12 p-20">
                                <ul class="nav nav-pills mb-3" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link mr-16 active" data-toggle="pill"
                                                data-target="#pills-breed" type="button" role="tab"
                                                aria-controls="pills-home"
                                                aria-selected="true">사육
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link mr-16" data-toggle="pill"
                                                data-target="#pills-slaughter"
                                                type="button" role="tab" aria-controls="pills-profile"
                                                aria-selected="false">도축
                                        </button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" data-toggle="pill"
                                                data-target="#pills-processing"
                                                type="button" role="tab" aria-controls="pills-profile"
                                                aria-selected="false">가공
                                        </button>
                                    </li>
                                </ul>
                                <div class="tab-content" id="pills-tabContent2">
                                    <!--사육 Tab-->
                                    <div class="tab-pane fade show active" id="pills-breed" role="tabpanel"
                                         aria-labelledby="pills-home-tab">
                                        <div class="row _breed-table">
                                            <div class="col-12">
                                                <table class="table table-bordered trace-register-table">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">신고 구분</th>
                                                        <th scope="col">농장 경영자</th>
                                                        <th scope="col">농장 명</th>
                                                        <th scope="col">년 월일</th>
                                                        <th scope="col">소재지</th>
                                                        <th scope="col">삭제</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr data-type="empty">
                                                        <td colspan="6">
                                                            <span class="c-gray-light">사육 정보를 추가하세요.</span>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <span class="card-text _farm-type bold-h5 c-brand-green _add-new cursor-pointer">
                                                    사육 정보 추가 +
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <!--도축 Tab-->
                                    <div class="tab-pane fade" id="pills-slaughter" role="tabpanel"
                                         aria-labelledby="pills-profile-tab">

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">도축 결과</label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-16">
                                            <div class="col-12">
                                                <label data-label="checkbox" class="radio-item">
                                                    <input data-type="checkbox" data-value="true" type="checkbox"
                                                           name="use-amniotic">
                                                    <span class="checkbox"></span>
                                                    <span class="text">도축 정보 사용</span>
                                                </label>
                                            </div>
                                        </div>
                                        
                                        <div class="d-none" id="amniotic-div">
                                            <div class="row mt-16">
                                            <div class="col-12 d-flex flex-row">
                                                <div class="mt-16">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" data-value="true" type="radio"
                                                               name="amniotic-success">
                                                        <span class="design"></span>
                                                        <span class="ml-16">합격</span>
                                                    </label>
                                                </div>

                                                <div class="mt-16 ml-24">
                                                    <label data-label="checkbox" class="radio-item">
                                                        <input data-type="radio" data-value="false" type="radio"
                                                               name="amniotic-success">
                                                        <span class="design"></span>
                                                        <span class="ml-16">불합격</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-32">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label class="medium-h6 c-gray-dark-low">농장 명</label>
                                                    <input type="text"
                                                           placeholder="농장 명 입력" name="amniotic-farm"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="form-group form-inner-button form-inner-label">
                                                    <label class="medium-h6 c-gray-dark-low">도축 일자</label>
                                                    <input type="text"
                                                           data-provide="datepicker"
                                                           readonly
                                                           placeholder="날짜를 입력하세요."
                                                           name="amniotic-date"
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
                                                    <input type="text" placeholder="주소를 입력해주세요." data-type="postcode"
                                                           class="form-control input-box medium-h5 cursor-pointer postcode-init"
                                                           readonly
                                                           name="amniotic-addr"
                                                           id="input21">
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
                                                           placeholder="상세주소 입력" name="amniotic-addr-spec"
                                                           class="form-control input-underline input-brand-green medium-h4">
                                                </div>
                                            </div>
                                        </div>
                                        </div>

                                        


                                    </div>

                                    <!--가공 Tab-->
                                    <div class="tab-pane fade" id="pills-processing" role="tabpanel"
                                         aria-labelledby="pills-profile-tab">

                                        <div class="row _slaughter-table">
                                            <div class="col-12">
                                                <table class="table table-bordered trace-register-table">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col">사업자 명</th>
                                                        <th scope="col">소재지</th>
                                                        <th scope="col">가공 일자</th>
                                                        <th scope="col">삭제</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr data-type="empty">
                                                        <td colspan="6">
                                                            <span class="c-gray-light">포장/가공 정보를 추가하세요.</span>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="row mt-32">
                                            <div class="col-12">
                                                <span class="card-text _farm-type bold-h5 c-brand-green _add-new cursor-pointer">
                                                    포장/가공 정보 추가 +
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>`);
            modal.find('input[data-provide="datepicker"]').datepicker({
                format: 'yyyy년 mm월 dd일',
                endDate: 'today',
                language: 'ko',
                todayHighlight: true,
                defaultViewDate: 'today',
                autoclose: true
            }).datepicker('setDate', 'now');
        }
    })
    $('#trace-created').on('change', 'input[name=use-amniotic]', function () {
        console.log('changed');
        let modal = $(this).closest('.modal');
        if ($(this).is(':checked')) {
            modal.find('#amniotic-div').removeClass('d-none');
        } else {
            modal.find('#amniotic-div').addClass('d-none');
            let inputs = modal.find('#amniotic-div').find('input');
            inputs.each((idx, elem) => {
                $(elem).val('');
            })
        }
    })

    $('#package-trace-created').on('hidden.bs.modal', function () {
        const user_type = $('._animals ._animal input').data().category;
        let modal = $(this);
        if (!availableFarmTypes.includes(user_type)) {
            // 직접 입력 X
            modal.find('input').val('');
        } else {
            modal.find('input').val('');
            let tbody = modal.find('table tbody');
            tbody.find('tr:not([data-type="empty"]').remove();
            tbody.find('tr[data-type="empty"]').removeClass('d-none');
        }
    })

    $('#package-trace-created').find('input#bundle-trace-search').next().on('click', function () {
        let input = $('#bundle-trace-search');
        let code = input.val();
        if (code.trim().length <= 0) {
            viewAlert({content: '조회할 이력번호를 입력하세요.', zIndex: MODAL_ALERT_ZINDEX});
        } else {
            // TODO Search Registered Trace
            getTraceByCode(code).then((result) => {
                setLoading(false);
                console.log(result);
                if (result.status === 'OK') {
                    let dataStatus = result.data.status;
                    if (dataStatus === -1) {
                        viewAlert({content: '본인 농장의 이력만 묶음 이력으로 등록할 수 있습니다.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    } else if (dataStatus === -2) {
                        viewAlert({content: '이미 묶음 이력으로 등록된 이력입니다.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    } else if (dataStatus === -3) {
                        viewAlert({content: '존재하지 않는 이력입니다.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    } else {
                        input.val('');
                        console.log(result.data.data);
                        let trace = result.data.data;
                        const result_area = $('#result-traces')
                        result_area.children().remove();
                        result_area.append(`<div class="col-12">
                                                <div class="trace-register-item">
                                                    <span class="bold-h5" data-no="${trace.no}">${trace.trace_code}</span>
                                                    <span class="regular-h5">${trace.entity.rate}</span>
                                                    <span class="regular-h5">${trace.entity.gender}</span>
                                                    <span class="regular-h5 mr-auto" data-farmer="${trace.breed[0].breed_farmer_name}" data-addr="${trace.breed[0].breed_farm_addr}">${trace.entity.birth !== null ? (trace.entity.birth + ' 출생') : ''}</span>
                                                    <button type="button"
                                                            class="btn btn-sm btn-brand-opacity bold-h5 ml-auto">
                                                        이력 추가하기
                                                    </button>
                                                </div>
                                            </div>`);
                    }
                }
            })
        }
    })

    $('#package-trace-created').find('input#public-bundle-search').next().on('click', function () {
        let code = $('#public-bundle-search').val();
        if (code.trim().length <= 0) {
            viewAlert({content: '조회할 묶음 번호를 입력하세요.', zIndex: MODAL_ALERT_ZINDEX});
        } else {
            getPublicBundle(code).then((result) => {
                setLoading(false);
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        viewModal({
                            zIndex: 1999,
                            btnCount: 2,
                            backDrop: true,
                            title: `묶음 이력 조회 결과 : ${code}`,
                            desc: `연결 가능한 묶음 이력을 찾았습니다! 해당 묶음 이력을 연결하시겠습니까?<br>
                        묶음 이력 등록인 : ${result.data.name}<br>
                        묶음 이력 등록 기준 농장 주소 : ${result.data.address}<br><br>
                        ※ 주의! 이력제에 등록된 주소와 정보가 일치하는지 확인 후 연결해주시길 바랍니다.`,
                            onConfirm: () => {
                                // TODO result.data.data 로 Format 만들기
                                createPublicBundle(result.data.data).then((result) => {
                                    setLoading(false);
                                    if (result.status === 'OK') {
                                        if (result.data.status) {
                                            viewModal({
                                                btnCount: 1,
                                                title: '묶음 이력 제작 성공',
                                                desc: '묶음 이력이 성공적으로 제작되었습니다.',
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
                                        } else {
                                            viewAlert({content: '묶음 이력 제작에 실패하였습니다. 관리자에게 문의하세요.', zIndex: 2500});
                                            return false;
                                        }
                                    }
                                })
                            }
                        })
                    } else {
                        if (result.data.type === 1) {
                            viewAlert({content: '이미 하온에 등록되어 있는 묶음 이력입니다.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        } else if (result.data.type === 2) {
                            viewAlert({content: '회원님의 농장 종류와 맞지 않는 묶음 이력입니다.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        } else if (result.data.type === -1) {
                            viewAlert({content: '존재하지 않거나 조회할 수 없는 묶음 이력 번호입니다.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        } else if (result.data.type === 0) {
                            viewAlert({content: '존재하지 않거나 조회할 수 없는 묶음 이력 번호입니다.', zIndex: MODAL_ALERT_ZINDEX});
                            return false;
                        }
                    }
                }
            })
        }
    })

    $('#package-trace-created').find('button._create').on('click', function () {
        let table = $('#result-traces').next().find('.trace-register-table tbody');
        if (table.find('tr').length <= 2) {
            viewAlert({content: '묶음 이력을 제작하기 위해선 최소 2개 이상의 이력을 등록해주세요.', zIndex: MODAL_ALERT_ZINDEX});
            return false;
        } else {
            let list = [];
            table.find('tr:not([data-type=empty])').each((idx, elem) => {
                console.log(elem);
                let no = $(elem).find('td:first-child').data().no;
                list.push(no);
            })
            createManualBundle(list).then((result) => {
                setLoading(false);
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        viewModal({
                            btnCount: 1,
                            title: '묶음 이력 제작 성공',
                            desc: '묶음 이력이 성공적으로 제작되었습니다.',
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
                } else {
                    viewAlert({content: '묶음 이력을 생성할 수 없습니다.', zIndex: MODAL_ALERT_ZINDEX});
                    return false;
                }
            })
        }
    })

    $('#result-traces').on('click', '.trace-register-item button', function () {
        console.log($(this).parent());
        let elem = $(this).parent();
        let code = elem.find('span:first-child').html();
        let table = $('#result-traces').next().find('.trace-register-table tbody');
        let no = elem.find('span:first-child').data().no;
        let trs = table.find('tr');
        let duplicate = false;
        trs.each((idx, elem) => {
            if ($(elem).find('td:first-child').data().no === no) {
                duplicate = true;
            }
        })
        if (duplicate) {
            viewAlert({
                content: '이미 등록 목록에 추가한 이력입니다.',
                zIndex: MODAL_ALERT_ZINDEX
            });
            return false;
        }
        let rate = elem.find('span:nth-child(2)').html();
        let farmer = elem.find('span:nth-child(4)').data().farmer;
        let addr = elem.find('span:nth-child(4)').data().addr;
        if (table.find('tr').length === 1) {
            table.find('tr[data-type=empty]').addClass('d-none');
        }
        let tr = `<tr>
                    <td data-no="${no}">${code}</td>
                    <td>${rate}</td>
                    <td>${farmer}</td>
                    <td>${addr}</td>
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
                </tr>`
        table.append(tr);
        $(this).parent().parent().remove();
    })
// Bundle Related Functions END

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
            onHide: () => {
                if (!$(document.body).hasClass('modal-open')) {
                    $(document.body).addClass('modal-open');
                }
            },
            onHidden: () => {
                if (!$(document.body).hasClass('modal-open')) {
                    $(document.body).addClass('modal-open');
                }
            }
        })

    })

    function createBreedMakeTab($addButton) {
        let parent = $addButton.parent().parent();
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
                                                    <button class="btn btn-gray-high-light medium-h4 mr-8 _cancel">취소</button>
                                                    <button class="btn btn-brand medium-h4 _confirm">추가하기</button>
                                                </div>
                                            </div>
                                        </div>`);
            $('input[data-provide="datepicker"][name=breed-date]').datepicker({
                format: 'yyyy년 mm월 dd일',
                endDate: 'today',
                language: 'ko',
                todayHighlight: true,
                defaultViewDate: 'today',
                autoclose: true
            }).datepicker('setDate', 'now');
            $addButton.closest('.tab-pane').find('input[data-type=postcode]').on('click', function () {
                let input = $(this);
                if (!input.hasClass('postcode-init')) {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                            input.val(data.address);
                            input.parent().parent().next().find('input').focus();
                        }
                    }).open();
                    input.addClass('postcode-init');
                }
            })
        } else {
            viewAlert({content: '작성하시던 사육정보를 먼저 등록해주세요.', zIndex: MODAL_ALERT_ZINDEX})
        }
    }

    // 사육 make Part
    $('#trace-created')
        .on('click', '#pills-breed ._add-new', function () {
            console.log('add-new clicked');
            createBreedMakeTab($(this));
        })
        .on('click', '#pills-breed ._breed-make ._confirm', function () {
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
                        viewAlert({content: '전산 등록은 한 번만 가능합니다.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    } else {
                        b = true;
                    }
                } else if (type.data().value === 'breed-amniotic') {
                    // 표에 등록이 존재하는지 체크
                    if (tableBody.find('[data-type=breed-register]').length <= 0) {
                        viewAlert({content: '먼저 전산 등록부터 하셔야합니다.', zIndex: MODAL_ALERT_ZINDEX});
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
                    // 표에 등록이 존재하는지 체크, 양도는 필수 X
                    if (tableBody.find('[data-type=breed-register]').length <= 0) {
                        viewAlert({content: '먼저 전산 등록부터 하셔야합니다.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    } else {
                        b = true;
                    }
                }
            } else {
                viewAlert({content: '신고 유형을 먼저 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }

            // 농장 경영자 명
            if (farmer.val().trim().length <= 0) {
                viewAlert({content: '농장 경영자 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }

            // 농장 명
            if (farm.val().trim().length <= 0) {
                viewAlert({content: '농장 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            // 농장 링크

            // 소재 일자
            if (date.val().trim().length <= 0) {
                viewAlert({content: '소재 일자를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            // 소재지
            if (addr.val().trim().length <= 0) {
                viewAlert({content: '소재지를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            // 상세 주소
            if (addr_specifc.val().trim().length <= 0) {
                viewAlert({content: '상세 주소를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
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
        .on('click', '#pills-breed ._breed-make ._cancel', function () {
            $('._breed-make').remove();
        })
        .on('click', '#pills-processing ._add-new', function () {
            createProcessMakeTab($(this));
        })
        .on('click', '#pills-processing ._slaughter-make ._confirm', function () {
            let makeField = $(this).parent().parent().parent();
            let tableBody = $('._slaughter-table').find('tbody');
            let farm = makeField.find('input[name="slaughter-farm"');
            let date = makeField.find('input[name="slaughter-date"');
            let url = makeField.find('input[name="slaughter-url"');
            let addr = makeField.find('input[name="slaughter-addr"');
            let addr_spec = makeField.find('input[name="slaughter-addr-spec"');

            if (farm.val().trim().length <= 0) {
                viewAlert({content: '농장 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            if (date.val().trim().length <= 0) {
                viewAlert({content: '가공 일자를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            if (addr.val().trim().length <= 0) {
                viewAlert({content: '가공 소재지를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            if (addr_spec.val().trim().length <= 0) {
                viewAlert({content: '가공 소재지 상세 주소를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }

            let element = `<tr>
                            <td data-link="${url.val()}">${farm.val()}</td>
                            <td data-date="${date.val()}">${date.val()}</td>
                            <td>${addr.val()} ${addr_spec.val()}</td>
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
                        </tr>`
            if (tableBody.find('tr').length === 1) {
                tableBody.find('tr[data-type="empty"]').addClass('d-none');
            }
            tableBody.append(element);
            makeField.remove();

        })
        .on('click', '#pills-processing ._slaughter-make ._cancel', function () {
            $('._slaughter-make').remove();
        })
        .on('click', '#pills-slaughter input[data-type=postcode]', function () {
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
        .on('click', '#make-trace', function () {
            /** TODO
             * 1. 사육 -> 출하 정보 없이는 도축 정보 불가
             * 2. 도축 정보 없이는 가공 정보 입력 불가
             * 3. Modal 닫을 때 모든 정보 날리기
             * */
                // 등급
            let rate = $('[data-category=rate]').val();
            if (rate.trim().length === 0) {
                viewAlert({content: '등급을 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            // 출생 일자
            let birth = $('input[name=trace-birth]').val();
            if (birth.trim().length === 0) {
                viewAlert({content: '출생 일자를 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            // 성별
            let gender = $('input[name=gender]:checked');
            if (gender.length === 0) {
                viewAlert({content: '성별을 선택해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            }
            const entity = {};
            entity.entity_type = $('input[name=animal]').data().category;
            entity.birth = birth;
            entity.gender = gender.data().value;
            entity.rate = rate;
            // 사육정보
            /**
             * 사육 정보에 최소 breed-register 하나 이상 존재 필수
             * 사육 정보에 앞 단계 정보 없이 그 뒷 단계 정보가 존재할 시
             * */
            const breeds = [];
            let has_slaughter = false;
            let breed_table = $('#pills-breed').find('tbody');
            if (breed_table.find('tr').length === 1) {
                // Empty Type만 있을 경우
                viewAlert({content: '사육 정보는 필수입니다.', zIndex: MODAL_ALERT_ZINDEX});
                return false;
            } else {
                let datas = breed_table.find('tr:not([data-type=empty])');
                datas.each((index, element) => {
                    const breed = {};
                    breed.type = $(element).data().type.split('breed-')[1].toUpperCase();
                    breed.breed_farmer_name = $(element).find('td:nth-child(2)').html();
                    breed.breed_farm_name = $(element).find('td:nth-child(3)').html();
                    breed.breed_farm_url = $(element).find('td:nth-child(3)').data().link;
                    breed.breed_issue_date = $(element).find('td:nth-child(4)').data().date;
                    breed.breed_farm_addr = $(element).find('td:nth-child(5)').html();
                    breeds.push(breed);
                    if (breed.type === 'SLAUGHTER') {
                        has_slaughter = true;
                    }
                })
                console.log(breeds);
            }
            // 도축 정보
            /**
             * 사육 정보에 출하 정보 없을 시
             * */
            let slaughter_tab = $('#pills-slaughter');
            let result = slaughter_tab.find('input[name=amniotic-success]:checked');
            let butchery_use = $('input[name=use-amniotic]').is(':checked');
            const butcheries = [];
            if (butchery_use) {
                // 도축 정보가 입력 되었을 때
                if (breeds.length <= 0) {
                    viewAlert({content: '도축 정보를 등록하기 위해선 사육 정보는 필수입니다.', zIndex: MODAL_ALERT_ZINDEX});
                    return false;
                } else if (!has_slaughter) {
                    viewAlert({content: '도축 정보를 등록하기 위해선 출하 정보는 필수입니다.', zIndex: MODAL_ALERT_ZINDEX});
                    return false;
                } else {
                    let butchery = {};
                    let farm = slaughter_tab.find('input[name=amniotic-farm]').val();
                    let date = slaughter_tab.find('input[name=amniotic-date]').val();
                    let addr = slaughter_tab.find('input[name=amniotic-addr]').val();
                    let addr_spec = slaughter_tab.find('input[name=amniotic-addr-spec]').val();
                    if (result.length <= 0) {
                        viewAlert({content: '도축 합격 여부를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    }
                    if (farm.trim().length <= 0) {
                        viewAlert({content: '도축장 명을 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    }
                    if (date.trim().length <= 0) {
                        viewAlert({content: '도축 일자를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    }
                    if (addr.trim().length <= 0) {
                        viewAlert({content: '도축 소재지를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    }
                    if (addr_spec.trim().length <= 0) {
                        viewAlert({content: '도축 소재지 상세 주소를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                        return false;
                    }
                    butchery.butchery_result = result.data().value;
                    butchery.butchery_corp = farm.trim();
                    butchery.butchery_date = date.trim();
                    butchery.butchery_addr = `${addr.trim()}`;
                    butchery.butchery_addr_spec = `${addr_spec.trim()}`;
                    butcheries.push(butchery);
                }
            }
            console.log(butcheries);
            // 가공 정보
            /**
             * 도축 정보 없을 시
             * */
            const processes = [];
            let process_table = $('#pills-processing').find('tbody');
            let process_datas = process_table.find('tr:not([data-type=empty])')
            if (process_datas.length > 0) {
                if (butcheries.length <= 0) {
                    viewAlert({content: '가공 정보를 위해서 도축 정보를 입력해주세요.', zIndex: MODAL_ALERT_ZINDEX});
                    return false;
                } else {
                    process_datas.each((i, e) => {
                        console.log(e);
                        let process = {};
                        process.process_corp = $(e).find('td:first-child').html();
                        process.process_url = $(e).find('td:first-child').data().link;
                        process.process_date = $(e).find('td:nth-child(2)').data().date;
                        process.process_addr = $(e).find('td:nth-child(3)').html();
                        processes.push(process);
                    })
                }
            }
            // TRACE DATA FORMAT
            const sendData = {};
            sendData.entity = entity;
            sendData.breed = breeds;
            sendData.butchery = butcheries;
            sendData.process = processes;

            console.log('result data : ', sendData);
            // MAKE
            createTrace(sendData).then((result) => {
                setLoading(false);
                console.log(result);
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
                            onHide: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            },
                            onHidden: () => {
                                if (!$(document.body).hasClass('modal-open')) {
                                    $(document.body).addClass('modal-open');
                                }
                            }
                        })
                    } else {

                    }
                }
            })
        })

    function createProcessMakeTab($button) {
        let parent = $button.parent().parent();
        if (parent.prev().hasClass('_slaughter-table')) {
            parent.before(`<div class="_slaughter-make">
                                            <div class="row mt-24">
                                                <div class="col-6">
                                                    <div class="form-group">
                                                        <label class="medium-h6 c-gray-dark-low">사업장 명</label>
                                                        <input type="text"
                                                               placeholder="사업장 명 입력" name="slaughter-farm"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>

                                                <div class="col-6">
                                                    <div class="form-group form-inner-button form-inner-label">
                                                        <label class="medium-h6 c-gray-dark-low">포장/가공 일자</label>
                                                        <input type="text"
                                                               data-provide="datepicker"
                                                               readonly
                                                               placeholder="날짜를 입력해주세요." name="slaughter-date"
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
                                                        <label class="medium-h6 c-gray-dark-low">사업장 링크</label>
                                                        <input type="text"
                                                               placeholder="사업장 링크 입력" name="slaughter-url"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-6">
                                                    <label class="medium-h6 c-gray-dark-low">소재지</label>
                                                    <div class="form-group form-inner-button">
                                                        <input type="text" placeholder="주소를 입력해주세요." name="slaughter-addr"
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
                                                               placeholder="상세주소 입력" name="slaughter-addr-spec"
                                                               class="form-control input-underline input-brand-green medium-h4">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-32">
                                                <div class="col-12 d-flex justify-content-end">
                                                    <button class="btn btn-gray-high-light medium-h4 mr-8 _cancel">취소</button>
                                                    <button class="btn btn-brand medium-h4 _confirm">추가하기</button>
                                                </div>
                                            </div>
                                        </div>`);
            $('input[name="slaughter-date"]').datepicker({
                format: 'yyyy년 mm월 dd일',
                endDate: 'today',
                language: 'ko',
                todayHighlight: true,
                defaultViewDate: 'today',
                autoclose: true
            }).datepicker('setDate', 'now');
            $button.closest('.tab-pane').find('input[data-type=postcode]').on('click', function () {
                let input = $(this);
                if (!input.hasClass('postcode-init')) {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                            input.val(data.address);
                            input.parent().parent().next().find('input').focus();
                        }
                    }).open();
                    input.addClass('postcode-init');
                }
            })
        } else {
            viewAlert({content: '작성하시던 가공 정보를 먼저 등록해주세요.', zIndex: MODAL_ALERT_ZINDEX})
        }
    }

});


const availableFarmTypes = ['SHEEP_GOAT', 'HORSE', 'RABBIT'];

function getEntityType(type) {
    let str;
    switch (type) {
        case 'CATTLE':
            str = '소';
            break;
        case 'PIG' :
            str = '돼지';
            break;
        case 'FOWL':
            str = '닭';
            break;
        case 'DUCK' :
            str = '오리';
            break;
        case 'HORSE':
            str = '말';
            break;
        case 'SHEEP_GOAT' :
            str = '양 & 염소';
            break;
        default:
            str = '';
            break;
    }
    return str;
}

function getBreedTypeKor(type) {
    let str;
    switch (type) {
        case 'REGISTER':
            str = '등록';
            break;
        case 'AMNIOTIC' :
            str = '양도';
            break;
        case 'SLAUGHTER':
            str = '출하';
            break;
        default:
            str = '';
            break;
    }
    return str;
}

function getTableBreedType(type) {
    return 'breed-' + type.toLowerCase();
}