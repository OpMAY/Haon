'use strict';


/**
 * Root @RequestMapping("/api")
 * @RequestMapping(value="/{type}/bookmark/like/{no}", method=httpMessage.POST)
 * public void test(@PathVariable("type") String type,@PathVariable("no") int no){
 *
 * }
 * */

// const host = 'https://farmingdata.co.kr';
const host = 'http://localhost:8080';

/*Template*/
async function apiLogin(email, password) {
    function apiFetchLogin(email, password) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            email,
            password,
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
        };
        const response = fetch(`${host}/auth/login`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiFetchLogin(email, password);
        return result;
    } catch (error) {
        console.log(error);
    }
}

/**/
async function insertBookMark(type, no) {
    function apiInsertBookMark(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/${type}/bookmark/like/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiInsertBookMark(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteBookMark(type, no) {
    function apiDeleteBookMark(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/${type}/bookmark/unlike/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteBookMark(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function insertFarmHouseLike(no) {
    function apiInsertFarmHouseLike(no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/farmhouse/like/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiInsertFarmHouseLike(no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteFarmHouseLike(no) {
    function apiDeleteFarmHouseLike(no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/farmhouse/unlike/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteFarmHouseLike(no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function selectSearchRecent() {
    function apiSelectSearchRecent() {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/search/recent`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiSelectSearchRecent();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function selectSearchRecom() {
    function apiSelectSearchRecom() {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/search/recom`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiSelectSearchRecom();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function insertReview(type, no, content) {
    function apiInsertReview(type, no, content) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            type,
            no,
            content,
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw
        };
        const response = fetch(`${host}/api/review/create`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiInsertReview(type, no, content);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function insertReview(type, no, content) {
    function apiInsertReview(type, no, content) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            type,
            no,
            content
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw
        };
        const response = fetch(`${host}/api/review/create`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiInsertReview(type, no, content);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function insertReviewReply(type, no, content, comment_no) {
    function apiInsertReviewReply(type, no, content, comment_no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            type,
            no,
            content,
            comment_no
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw
        };
        const response = fetch(`${host}/api/review/reply/create`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiInsertReviewReply(type, no, content, comment_no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function insertMyReviewReply(type, no, content) {
    function apiInsertMyReviewReply(type, no, content) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            type,
            no,
            content,
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw
        };
        const response = fetch(`${host}/api/farmhouse/review/reply/create`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiInsertMyReviewReply(type, no, content);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateMyReviewLike(type, no, status) {
    function apiUpdateMyReviewLike(type, no, status) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/${type}/review/${no}/${status}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateMyReviewLike(type, no, status);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function deleteMyReview(type, no, parent) {
    function apiDeleteMyReview(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/${type}/review/delete/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteMyReview(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function deleteReviewReply(type, no) {
    function apiDeleteReviewReply(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            type,
            no
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw
        };
        const response = fetch(`${host}/api/review/reply/delete`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteReviewReply(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function insertContentLike(type, no) {
    function apiInsertContentLike(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/${type}/content/like/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiInsertContentLike(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function deleteContentLike(type, no) {
    function apiDeleteContentLike(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/${type}/content/unlike/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteContentLike(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function deleteMyContent(type, no) {
    function apiDeleteMyContent(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/${type}/content/delete/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiDeleteMyContent(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateMyReviewLock(no, status) {
    function apiUpdateMyReviewLock(no, status) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/content/review/${no}/${status}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateMyReviewLock(no, status);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateFarmHouseProfile(file) {
    function apiUpdateFarmHouseProfile(file) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Api', tokenGenerator(8));
        const formData = new FormData();
        formData.append('file', file);

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: formData,
        };

        const response = fetch(`${host}/api/farmhouse/change/profile`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateFarmHouseProfile(file);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateFarmHouseBanner(file) {
    function apiUpdateFarmHouseBanner(file) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Api', tokenGenerator(8));
        const formData = new FormData();
        formData.append('file', file);

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: formData,
        };

        const response = fetch(`${host}/api/farmhouse/change/banner`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateFarmHouseBanner(file);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateFarmHouseName(name) {
    function apiUpdateFarmHouseName(name) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            name
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
        };

        const response = fetch(`${host}/api/farmhouse/change/name`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateFarmHouseName(name);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateFarmHouseType(type) {
    function apiUpdateFarmHouseType(type) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/farmhouse/change/type/${type}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateFarmHouseType(type);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateFarmHouseDetails(details) {
    function apiUpdateFarmHouseDetails(details) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            details,
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
        };
        const response = fetch(`${host}/api/farmhouse/change/details`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateFarmHouseDetails(details);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateFarmHouseHashTag(json_hashs) {
    function apiUpdateFarmHouseHashTag(hashs) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            hashs,
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
        };
        const response = fetch(`${host}/api/farmhouse/change/hashtag`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateFarmHouseHashTag(json_hashs);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function updateFarmHouseSNS(instagram, blog, homepage) {
    function apiUpdateFarmHouseSNS(instagram, blog, homepage) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({
            instagram, blog, homepage
        });

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
        };
        const response = fetch(`${host}/api/farmhouse/change/sns`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateFarmHouseSNS(instagram, blog, homepage);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function selectTrace(type, value) {
    function apiSelectTrace(type, value) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/trace/${type}/${value}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiSelectTrace(type, value);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function updateAlarm(type, value) {
    function apiUpdateAlarm(type, value) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/alarm/update/${type}/${value}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateAlarm(type, value);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function getKakaoKey() {
    function apiGetKakaoKey() {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/get/kakao/key`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiGetKakaoKey();
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
        const response = fetch(`${host}/api/logout`, requestOptions);
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

async function farmCheck() {
    function apiFarmCheck() {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/farm/check`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiFarmCheck();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function loginCheck() {
    function apiLoginCheck() {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/login/check`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiLoginCheck();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateBookmark(type, no) {
    function apiUpdateBookMark(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/bookmark/update/${type}/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateBookMark(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateLike(type, no) {
    function apiUpdateLike(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/like/update/${type}/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateLike(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function loadMoreContents(type, last_content_no, order, category) {
    function apiLoadMoreContents(type, last_content_no, order, category) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'GET',
            headers: myHeaders,
        };
        console.log(`${host}/api/get/${type}/content/${last_content_no}/${order}/${category}`);

        const response = fetch(`${host}/api/get/${type}/content/${last_content_no}?order=${order}&category=${category}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiLoadMoreContents(type, last_content_no, order, category);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function loadMoreComments(type, content_no, last_comment_no) {
    function apiLoadMoreComments(type, content_no, last_comment_no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'GET',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/get/${type}/comment/${content_no}/${last_comment_no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiLoadMoreComments(type, content_no, last_comment_no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function loadMoreFarmContents(type, farm_no, content_no, category) {
    function apiLoadMoreContents(type, farm_no, content_no, category) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'GET',
            headers: myHeaders,
        };
        console.log(category)

        console.log(`${host}/api/get/${type}/farm/${farm_no}/content/${content_no}?category=${category === undefined ? '' : category}`);

        const response = fetch(`${host}/api/get/${type}/farm/${farm_no}/content/${content_no}?category=${category === undefined ? '' : category}`, requestOptions);
        return response.then((res) => res.json());
    }
    let result;
    try {
        result = await apiLoadMoreContents(type, farm_no, content_no, category);
        return result;
    } catch (error) {
        console.log(error);
    }
}


async function updateCommentLike(type, no) {
    function apiUpdateCommentLike(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/like/comment/update/${type}/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateCommentLike(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function updateCommentDislike(type, no) {
    function apiUpdateCommentDislike(type, no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/dislike/comment/update/${type}/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiUpdateCommentDislike(type, no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function withdrawal() {
    function apiWithdrawal() {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const raw = JSON.stringify({});

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: raw,
        };
        const response = fetch(`${host}/api/auth/withdrawal`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiWithdrawal();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function findTrace(trace_code) {
    function apiFindTrace(trace_code) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'GET',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/get/public/trace/${trace_code}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiFindTrace(trace_code);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function createTrace(trace) {
    function apiCreateTrace(trace) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'POST',
            headers: myHeaders,
            body: JSON.stringify(trace),
        };
        const response = fetch(`${host}/api/create/trace`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiCreateTrace(trace);
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
        const response = fetch(`${host}/api/delete/trace/${no}`, requestOptions);
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

async function getTraceModalData(no) {
    function apiGetTraceModalData(no) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'GET',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/get/trace/modal/${no}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiGetTraceModalData(no);
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function getTraceByCode(code) {
    function apiGetTraceByCode(code) {
        const myHeaders = new Headers();
        myHeaders.append('Content-Type', 'application/json');
        myHeaders.append('Content-Api', tokenGenerator(8));

        const requestOptions = {
            method: 'GET',
            headers: myHeaders,
        };
        const response = fetch(`${host}/api/get/trace/code/${code}`, requestOptions);
        return response.then((res) => res.json());
    }

    let result;
    try {
        result = await apiGetTraceByCode(code);
        return result;
    } catch (error) {
        console.log(error);
    }
}