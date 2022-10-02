document.addEventListener('DOMContentLoaded', function () {
    let hrefs = document.querySelectorAll('[data-href]');
    hrefs.forEach(function (href) {
        href.addEventListener('click', function (event) {
            location.href = this.dataset.href;
        });
    });
});

async function removeKeyword(type, keyword) {
    function apiRemoveKeyword(type, keyword) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/remove/${type}/${keyword}`, requestOptions);
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
        const response = fetch(`/admin/api/add/${type}/${keyword}`, requestOptions);
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