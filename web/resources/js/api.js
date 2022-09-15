'use strict';


/**
 * Root @RequestMapping("/api")
 * @RequestMapping(value="/{type}/bookmark/like/{no}", method=httpMessage.POST)
 * public void test(@PathVariable("type") String type,@PathVariable("no") int no){
 *
 * }
 * */

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

async function deleteFarmHouseLike(no){
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
  function apiSelectSearchRecent(){
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
  function apiSelectSearchRecom(){
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

async function insertReview(type, no, content){
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


async function insertMyReviewReply(type, no, content){
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
  function apiUpdateMyReviewLike(type, no, status){
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

async function deleteMyReview(type, no) {
  function apiDeleteMyReview(type, no){
    const myHeaders = new Headers();
    myHeaders.append('Content-Type', 'application/json');
    myHeaders.append('Content-Api', tokenGenerator(8));

    const requestOptions = {
      method: 'POST',
      headers: myHeaders,
    };
    const response = fetch(`${host}/api/${type}/review/delete/${no}/`, requestOptions);
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


async function deleteMyReviewReply(type, no, reply_no) {
  function apiDeleteMyReviewReply(type, no, reply_no){
    const myHeaders = new Headers();
    myHeaders.append('Content-Type', 'application/json');
    myHeaders.append('Content-Api', tokenGenerator(8));

    const requestOptions = {
      method: 'POST',
      headers: myHeaders,
    };
    const response = fetch(`${host}/api/${type}/review/${no}/delete/${reply_no}`, requestOptions);
    return response.then((res) => res.json());
  }

  let result;
  try {
    result = await apiDeleteMyReviewReply(type, no, reply_no);
    return result;
  } catch (error) {
    console.log(error);
  }
}


async function insertContentLike(type, no) {
  function apiInsertContentLike(type, no){
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
  function apiDeleteContentLike(type, no){
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
  function apiDeleteMyContent(type, no){
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
  function apiUpdateMyReviewLock(no, status){
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

async function updateFarmHouseName(name) {
  function apiUpdateFarmHouseName(name){
    const myHeaders = new Headers();
    myHeaders.append('Content-Type', 'application/json');
    myHeaders.append('Content-Api', tokenGenerator(8));

    const requestOptions = {
      method: 'POST',
      headers: myHeaders,
    };
    const response = fetch(`${host}/api/farmhouse/change/name/${name}`, requestOptions);
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
  function apiUpdateFarmHouseType(type){
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
  function apiUpdateFarmHouseDetails(details){
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


async function updateFarmHouseHashTag(tag) {
  function apiUpdateFarmHouseHashTag(tag){
    const myHeaders = new Headers();
    myHeaders.append('Content-Type', 'application/json');
    myHeaders.append('Content-Api', tokenGenerator(8));

    const requestOptions = {
      method: 'POST',
      headers: myHeaders,
    };
    const response = fetch(`${host}/api/farmhouse/change/hashtag/${tag}`, requestOptions);
    return response.then((res) => res.json());
  }

  let result;
  try {
    result = await apiUpdateFarmHouseHashTag(tag);
    return result;
  } catch (error) {
    console.log(error);
  }
}


async function updateFarmHouseSNS(insta, blog, home) {
  function apiUpdateFarmHouseSNS(insta, blog, home){
    const myHeaders = new Headers();
    myHeaders.append('Content-Type', 'application/json');
    myHeaders.append('Content-Api', tokenGenerator(8));

    const raw = JSON.stringify({
      insta, blog, home
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
    result = await apiUpdateFarmHouseSNS(tag);
    return result;
  } catch (error) {
    console.log(error);
  }
}



async function selectTrace(type, value) {
  function apiSelectTrace(type, value){
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


async function updateAlarm(type, value, status) {
  function apiUpdateAlarm(type, value, status){
    const myHeaders = new Headers();
    myHeaders.append('Content-Type', 'application/json');
    myHeaders.append('Content-Api', tokenGenerator(8));

    const requestOptions = {
      method: 'POST',
      headers: myHeaders,
    };
    const response = fetch(`${host}/api/alarm/${type}/${status}/${value}`, requestOptions);
    return response.then((res) => res.json());
  }

  let result;
  try {
    result = await apiUpdateAlarm(type, value, status);
    return result;
  } catch (error) {
    console.log(error);
  }
}
