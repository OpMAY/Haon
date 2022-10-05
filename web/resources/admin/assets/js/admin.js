document.addEventListener('DOMContentLoaded', function () {
    let hrefs = document.querySelectorAll('[data-href]');
    hrefs.forEach(function (href) {
        href.addEventListener('click', function (event) {
            location.href = this.dataset.href;
        });
    });
    document.querySelector('.left-side-menu ._logout').addEventListener('click', function (event) {
        logout().then((result) => {
            console.log(result);
            if (result.status === 'OK') {
                alert('관리자에서 로그아웃하였습니다.');
                location.href = '/admin/login';
            } else {
                alert('관리자에서 로그아웃을 할 수 없습니다.');
            }
        });
    });
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

async function magazineStatusUpdate(status, magazine_no) {
    function apiMagazineStatusUpdate(status, magazine_no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/magazine/status/update/${magazine_no}/${status}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiMagazineStatusUpdate(status, magazine_no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function logout() {
    function apiLogout() {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`/admin/api/logout`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiLogout();
        return result;
    } catch (error) {
        console.log(error);
    }
}