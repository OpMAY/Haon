document.addEventListener('DOMContentLoaded', function () {
    let hrefs = document.querySelectorAll('[data-href]');
    hrefs.forEach(function (href) {
        href.addEventListener('click', function (event) {
            location.href = this.dataset.href;
        });
    });

    $(document).on('click', '[data-type=qr]', function () {
        let $no = $(this).data().no;
        let $type = $(this).data().type;
        let url = `${window.location.origin}/trace/${$type}/${$no}`;
        let $modal = $('#qrcode-modal');

        $modal.find('.modal-body').children().remove();

        $modal.find('.modal-body').append(`<div class="d-flex flex-column align-items-center">
                        <div class="_qrArea" style="margin-bottom: 24px">아래 이미지를 저장하여 QR 코드를 공유하세요.</div>
                        <div id="trace-qr" style="margin-bottom: 24px"><a download="qrCode.png"></a></div>
                        <button class="btn btn-primary" id="download-qr">QR 다운로드</button>
                    </div>`)
        new QRCode(document.getElementById('trace-qr'), {
            text: url,
            width: 256,
            height: 256,
            colorDark: "#000000",
            colorLight: "#ffffff",
            correctLevel: QRCode.CorrectLevel.H,
            alt: '스캔하세요.',
        });

        $modal.modal('show');
    })

    $(document.body).on('click', '#download-qr', function () {
        let qr = document.getElementById('trace-qr')
        let qrCanvas = qr.querySelector('canvas');
        let a = qr.querySelector('a');
        a.download = 'HAON_QR_' + tokenGenerator() + '.png';
        a.href = qrCanvas.toDataURL('image/png').replace("image/png", "image/octet-stream");
        a.click();
    })
});

async function removeCategory(type, category) {
    function apiRemoveCategory(type, category) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/category/remove/${type}/${category}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiRemoveCategory(type, category);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function addCategory(type, keyword) {
    function apiAddCategory(type, keyword) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/category/add/${type}/${keyword}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiAddCategory(type, keyword);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function removeKeyword(type, keyword) {
    function apiRemoveKeyword(type, keyword) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/keyword/remove/${type}/${keyword}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiRemoveKeyword(type, keyword);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function addKeyword(type, keyword) {
    function apiAddKeyword(type, keyword) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/keyword/add/${type}/${keyword}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiAddKeyword(type, keyword);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteBanner(no) {
    function apiDeleteBanner(no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/delete/banner/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteBanner(no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteCommunity(type, community_no) {
    function apiDeleteCommunity(type, community_no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/delete/${type}/${community_no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteCommunity(type, community_no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function blockReview(_type, type, comment_no) {
    function apiBlockReview(_type, type, comment_no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/${_type}/${type}/${comment_no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiBlockReview(_type, type, comment_no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteTrace(no) {
    function apiDeleteTrace(no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/delete/trace/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteTrace(no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteBundle(no) {
    function apiDeleteBundle(no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/delete/bundle/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteBundle(no);
        return result;
    } catch (error) {
        console.log(error);
    }
}