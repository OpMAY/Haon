$('#tab-trace-search').next().on('click', function () {
    let value = $('#tab-trace-search').val();
    if (value.trim().length <= 0) {
        viewAlert({content: '검색할 이력 번호를 입력하세요.'});
    } else {
        searchByCode(value).then((result) => {
            if (result.status === 'OK') {
                if (result.data.status) {
                    let no = result.data.data.no;
                    let showDiv = $('#tab-trace ._traces');
                    let element;
                    if (result.data.type === 'trace') {
                        element = `<div class="_trace _tab mt-32" data-no="${result.data.data.no}">
                                                <div class="_bundle-header">
                                                    <span class="bold-h2"
                                                          data-code="${result.data.data.trace_code}">${result.data.data.trace_code}</span>
                                                    <div class="_bundle-button" data-no="${result.data.data.no}">
                                                        <button type="button" data-no="${result.data.data.no}"
                                                                class="_qr btn btn-brand-opacity btn-block bold-h5">
                                                            QR
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="_bundle-body d-flex">
                                                    <span class="_livestock regular-h5 p-2">${result.data.data.entity.entity_type}</span>
                                                    <span class="regular-h5 p-2">${result.data.data.entity.rate}</span>
                                                    <span class="regular-h5 p-2">${result.data.data.entity.gender}</span>
                                                    <span class="regular-h5 p-2">${result.data.data.entity.birth === null ? '' : (result.data.data.entity.birth + ' 출생')}</c:if></span>
                                                    <span class="regular-h5 _date ml-auto p-2">${result.data.data.reg_datetime}</span>
                                                </div>
                                            </div>`;
                    } else if (result.data.type === 'bundle') {
                        element = `<div class="_bundle _tab mt-32" data-no="${result.data.data.no}">
                                                <div class="_bundle-header">
                                                    <span class="bold-h2"
                                                          data-code="${result.data.data.bundle_code}">${result.data.data.bundle_code}</span>
                                                    <div class="_bundle-button" data-no="${result.data.data.no}">
                                                        <button type="button" data-no="${result.data.data.no}"
                                                                class="_qr btn btn-brand-opacity btn-block bold-h5">
                                                            QR
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="_bundle-body">
                                                    <span class="regular-h5" data-count="${result.data.data.traceList.size()}">${result.data.data.traceList.size()}개의 이력</span>
                                                </div>
                                                <div class="_bundle-bottom">
                                                    <span class="regular-h5 _date">${result.data.data.reg_datetime}</span>
                                                </div>
                                            </div>`
                    }
                    showDiv.append(element);
                } else {
                    viewAlert({content: '일치하는 이력이 없습니다.'});
                }
            }
        })
    }
})

$('#tab-trace').on('click', '._traces ._tab', function () {
    if($(this).hasClass('_trace')) {
        window.location.href = `/trace/single/${$(this).data().no}`;
    } else {
        window.location.href = `/trace/package/${$(this).data().no}`;
    }
})