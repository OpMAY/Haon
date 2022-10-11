$('#tab-trace-search').next().on('click', function () {
    let value = $('#tab-trace-search').val();
    if (value.trim().length <= 0) {
        viewAlert({content: '검색할 이력 번호를 입력하세요.'});
    } else {
        searchByCode(value).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                let showDiv = $('#tab-trace ._traces');
                showDiv.children('._trace').remove();
                if (result.data.status) {
                    console.log(result);
                    let element;
                    if (result.data.type === 'trace') {
                        let date = result.data.data.reg_datetime;
                        let dFormatted = `${Time.formatLocalDate(date)}`;
                        element = `<div class="_trace _tab mt-32" data-no="${result.data.data.no}">
                                                <div class="_bundle-header">
                                                    <span class="bold-h2"
                                                          data-code="${result.data.data.trace_code}">${result.data.data.trace_code}</span>
                                                    <div class="_bundle-button" data-no="${result.data.data.no}">
                                                        <button type="button" data-no="${result.data.data.no}" data-code="${result.data.data.trace_code}"
                                                                class="_qr btn btn-brand-opacity btn-block bold-h5">
                                                            QR
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="_bundle-body d-flex">
                                                    <span class="_livestock regular-h5 p-2">${getEntityType(result.data.data.entity.entity_type)}</span>
                                                    <span class="regular-h5 p-2">${result.data.data.entity.rate === null ? '' : result.data.data.entity.rate}</span>
                                                    <span class="regular-h5 p-2">${result.data.data.entity.gender === null ? '' : result.data.data.entity.gender}</span>
                                                    <span class="regular-h5 p-2">${result.data.data.entity.birth === null ? '' : (result.data.data.entity.birth + ' 출생')}</c:if></span>
                                                    <span class="regular-h5 _date ml-auto p-2">${dFormatted}</span>
                                                </div>
                                            </div>`;
                    } else if (result.data.type === 'bundle') {
                        element = `<div class="_bundle _tab mt-32" data-no="${result.data.data.no}">
                                                <div class="_bundle-header">
                                                    <span class="bold-h2"
                                                          data-code="${result.data.data.bundle_code}">${result.data.data.bundle_code}</span>
                                                    <div class="_bundle-button" data-no="${result.data.data.no}">
                                                        <button type="button" data-no="${result.data.data.no}" data-code="${result.data.data.bundle_code}"
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

$('#tab-trace').on('click', '._traces ._tab ._qr', function (e) {
    e.stopPropagation();
    let url;
    if($(this).closest('._tab').hasClass('_trace')) {
        url = `${window.location.origin}/trace/single/${$(this).data().no}`;

    } else {
        url = `${window.location.origin}/trace/package/${$(this).data().no}`;
    }
    viewModal({
        id:'search-trace-qr-modal',
        title: '이력 QR',
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