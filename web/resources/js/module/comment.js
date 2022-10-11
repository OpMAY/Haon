$(document).ready(function () {
    /** Comment reply */
    $('._reply')
        .on('click', '._do', doClickEventListener)
        .on('click', '._cancel', cancelClickEventListener)
        .on('click', '._delete', deleteClickEventListener);
});

function commentLikeClickEventListener() {
    let no = this.dataset.no;
    let type = this.dataset.commentLike;
    loginCheck().then((result) => {
            setLoading(false);
        if (result.status === 'OK') {
            if (result.data.status) {
                updateCommentLike(type, no).then((result) => {
            setLoading(false);
                    console.log(result);
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            let count = this.querySelector('span').textContent * 1;
                            if (result.data.type === 'insert') {
                                if (!this.classList.contains('is-active')) {
                                    this.classList.add('is-active');
                                }
                                console.log(this);
                                this.querySelector('span').innerHTML = ++count;
                                viewAlert({content: '좋아요를 표시했습니다.'});
                            } else {
                                if (this.classList.contains('is-active')) {
                                    this.classList.remove('is-active');
                                }
                                this.querySelector('span').innerHTML = --count;
                                viewAlert({content: '좋아요 표시를 해제했습니다.'});
                            }
                        }
                    }
                });
            } else {
                viewAlert({content: '로그인이 필요한 기능입니다.'});
            }
        }
    });
}

function commentDislikeClickEventListener() {
    let no = this.dataset.no;
    let type = this.dataset.commentDislike;
    loginCheck().then((result) => {
            setLoading(false);
        if (result.status === 'OK') {
            if (result.data.status) {
                updateCommentDislike(type, no).then((result) => {
            setLoading(false);
                    console.log(result);
                    if (result.status === 'OK') {
                        if (result.data.status) {
                            let count = this.querySelector('span').textContent * 1;
                            if (result.data.type === 'insert') {
                                if (!this.classList.contains('is-active')) {
                                    this.classList.add('is-active');
                                }
                                console.log(this);
                                this.querySelector('span').innerHTML = ++count;
                                viewAlert({content: '싫어요를 표시했습니다.'});
                            } else {
                                if (this.classList.contains('is-active')) {
                                    this.classList.remove('is-active');
                                }
                                this.querySelector('span').innerHTML = --count;
                                viewAlert({content: '싫어요 표시를 해제했습니다.'});
                            }
                        }
                    }
                });
            } else {
                viewAlert({content: '로그인이 필요한 기능입니다.'});
            }
        }
    });
}

function deleteClickEventListener(event) {
    viewModal({
        title: '댓글',
        desc: '정말 댓글을 삭제하시겠습니까?',
        backDrop: true,
        btnCount: 2,
        onConfirm: () => {
            let comment_element = this.closest('._comment');
            deleteReviewReply(this.dataset.type, this.dataset.no).then((result) => {
                setLoading(false);
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        let comment = result.data.comment;
                        console.log(comment_element);
                        /*TODO _comment-text 바꾸고, _info 바꾸고, _profile-img 바꾸고, 삭제 버튼 지우기*/
                        let comment_text = comment_element.querySelector('._comment-text');
                        comment_text.querySelector('._content').innerHTML = `${comment.content}`;

                        let comment_info = comment_element.querySelector('._info');
                        comment_info.querySelector('._name').innerHTML = `${comment.user.name}`;

                        let comment_profile = comment_element.querySelector('._profile-img');
                        comment_profile.querySelector('img').src = `${comment.user.profile_img.url}`;

                        let transactions = comment_element.querySelector('._transactions');
                        let reply_parent = comment_element.closest('.reply-comment-container');
                        let reply_check = reply_parent !== null && reply_parent !== undefined ? true : false;
                        if (reply_check) {
                            transactions.remove();
                        } else {
                            transactions.querySelector('._reply ._delete').remove();
                        }

                        viewAlert({content: '해당 메세지가 삭제되었습니다.'});
                    }
                }
            });
        }
    })

}

function cancelClickEventListener() {
    let t = this;
    let $t = $(this);
    let comment_no = t.dataset.commentNo;
    let type = t.dataset.type;
    let no = t.dataset.no;
    $t.parent().append(`<span class="medium-h5 c-basic-black _do" data-comment-no="${comment_no}" data-type="${type}" data-no="${no}">답글</span>`);
    $(t.closest('.comment-container')).find('.form-group.form-inner-button').remove();
    $t.remove();
    // input remove
}

function doClickEventListener() {
    let t = this;
    let $t = $(this);
    /**
     * <span class="medium-h5 c-gray-dark-low _do"
     data-comment-no="${comment.no}" data-type="BOARD" data-no="${board.no}">답글</span>*/
    let comment_no = t.dataset.commentNo;
    let type = t.dataset.type;
    let no = t.dataset.no;
    console.log(type);
    $t.parent().append(`<span class="medium-h5 c-basic-black _cancel" data-comment-no="${comment_no}" data-type="${type}" data-no="${no}">취소</span>`);
    $(t.closest('.comment-container').querySelector('.reply-comment-container')).prepend(`<div class="form-group form-inner-button">
                                                                                                      <input data-comment-no="${comment_no}" data-type="${type}" data-no="${no}" type="text" placeholder="답글을 입력하세요." class="form-control input-box medium-h5">
                                                                                                      <button onclick="writeComment(this);" type="button" class="btn btn-sm btn-brand bold-h5">작성</button>
                                                                                                  </div>`);
    $t.remove();
}

function writeComment(element) {
    let input = element.closest('.form-group').querySelector('input');
    if (input.value.trim().length !== 0) {
        let comment_no = input.dataset.commentNo;
        let type = input.dataset.type;
        let no = input.dataset.no;
        if (comment_no !== undefined && comment_no !== null) {
            let container = element.closest('.reply-comment-container');
            insertReviewReply(type, no, input.value.trim(), comment_no).then((result) => {
                setLoading(false);
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        if (container.querySelectorAll('._comment').length !== 0) {
                            let first_comment = container.querySelectorAll('._comment')[0];
                            $(first_comment).before(createCommentElement(type, result.data.comment));
                        } else {
                            $(container).append(createCommentElement(type, result.data.comment));
                        }

                        let reply_event = $(`[data-no="${result.data.comment.no}"][data-type="event"]`);
                        reply_event
                            .on('click', '._do', doClickEventListener)
                            .on('click', '._cancel', cancelClickEventListener)
                            .on('click', '._delete', deleteClickEventListener);

                        let reply_container = container.closest('.comment-container').querySelector('._comment ._reply');
                        $(reply_container).append(`<span class="medium-h5 c-basic-black _do" data-comment-no="${comment_no}" data-type="${type}" data-no="${no}">답글</span>`);
                        reply_container.querySelector('._cancel').remove();
                        container.querySelector('.form-group').remove();
                    }
                }
            });
        } else {
            let container = element.closest('._comments');
            insertReview(type, no, input.value.trim()).then((result) => {
                setLoading(false);
                console.log(result);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        if (container.querySelectorAll('.comment-container').length !== 0) {
                            let first_comment = container.querySelectorAll('.comment-container')[0];
                            $(first_comment).before(createCommentParentElement(type, result.data.comment));
                        } else {
                            $(container).append(createCommentParentElement(type, result.data.comment));
                        }
                        console.log(result.data.comment.no);
                        let comment_event = $(`[data-no="${result.data.comment.no}"][data-type="event"]`);
                        comment_event
                            .on('click', '._do', doClickEventListener)
                            .on('click', '._cancel', cancelClickEventListener)
                            .on('click', '._delete', deleteClickEventListener);

                        $(`[data-comment-like="${type}"][data-no="${result.data.comment.no}"]`).on('click', commentLikeClickEventListener);
                        $(`[data-comment-dislike="${type}"][data-no="${result.data.comment.no}"]`).on('click', commentDislikeClickEventListener);
                    }
                }
            });
        }
        input.value = '';
    } else {
        alert({content: '내용을 입력해주세요.'});
    }
}

const createCommentParentElement = (type, comment) => {
    let reg_datetime = Time.formatLocalDatetime(comment.reg_datetime);
    let community_no = 0;
    switch (type) {
        case 'BOARD':
            community_no = comment.board_no;
            break;
        case 'MAGAZINE':
            community_no = comment.magazine_no;
            break;
        case 'MANUAL':
            community_no = comment.manual_no;
            break;
        case 'TIP':
            community_no = comment.tip_no;
            break;
        case 'QUESTION':
            community_no = comment.question_no;
            break;
        case 'FARM':
            console.log('FARM');
            community_no = comment.farm_no;
    }
    return `<div class="comment-container">
                <div class="_comment">
                    <div class="_profile-img">
                        <img alt="" src="${comment.user.profile_img.url}">
                    </div>
                    <div class="_media">
                        <div class="_comment-text">
                            <span class="medium-h5 _content ellipsis-one-line">${comment.content}</span>
                            <span class="bold-p1 c-brand-green _new">New!</span>
                        </div>
                        <div class="_info">
                            <span class="regular-h5 c-gray-medium _name">${comment.user.name}</span>
                            <span class="regular-h6 c-gray-light ml-8">${reg_datetime}</span>
                        </div>
                    </div>
                    <div class="_transactions">
                        <div class="_responds">
                            <div class="_like" data-comment-like="${type}" data-no="${comment.no}">
                                <svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M9.73301 5.33333H13.9997C14.3533 5.33333 14.6924 5.47381 14.9425 5.72386C15.1925 5.97391 15.333 6.31304 15.333 6.66667V8.06933C15.3332 8.24357 15.2992 8.41616 15.233 8.57733L13.169 13.5867C13.1188 13.7088 13.0335 13.8133 12.9238 13.8869C12.8141 13.9605 12.6851 13.9999 12.553 14L1.33301 14C1.1562 14 0.986625 13.9298 0.861601 13.8047C0.736577 13.6797 0.666339 13.5101 0.666339 13.3333L0.666339 6.66667C0.666339 6.48986 0.736577 6.32029 0.861601 6.19526C0.986625 6.07024 1.1562 6 1.33301 6H3.65434C3.76107 6.00003 3.86625 5.97443 3.96103 5.92536C4.05581 5.87628 4.13742 5.80517 4.19901 5.718L7.83434 0.567333C7.8803 0.502208 7.94807 0.455707 8.02536 0.43626C8.10266 0.416813 8.18437 0.425708 8.25567 0.461333L9.46501 1.06667C9.80534 1.23677 10.0772 1.51821 10.2355 1.86421C10.3938 2.21021 10.4289 2.59995 10.335 2.96867L9.73301 5.33333ZM4.66634 7.05867V12.6667L12.1063 12.6667L13.9997 8.06933V6.66667L9.73301 6.66667C9.52994 6.66664 9.32956 6.62023 9.14716 6.53097C8.96476 6.44172 8.80515 6.31198 8.68052 6.15166C8.55589 5.99133 8.46953 5.80466 8.42802 5.60588C8.38651 5.4071 8.39095 5.20147 8.44101 5.00467L9.04301 2.63933C9.06185 2.56555 9.05486 2.48754 9.0232 2.41829C8.99154 2.34903 8.93713 2.2927 8.86901 2.25867L8.42834 2.03867L5.28834 6.48667C5.12167 6.72267 4.90834 6.916 4.66634 7.05867V7.05867ZM3.33301 7.33333H1.99967V12.6667H3.33301V7.33333Z"
                                        fill="#969696"></path>
                                </svg>
                                <span class="regular-h5">0</span>
                            </div>
                            <div class="_dislike" data-comment-dislike="${type}" data-no="${comment.no}">
                                <svg width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M6.26699 8.66667H2.00033C1.6467 8.66667 1.30757 8.52619 1.05752 8.27614C0.807469 8.02609 0.666993 7.68696 0.666993 7.33333V5.93067C0.666813 5.75643 0.700787 5.58384 0.766993 5.42267L2.83099 0.413333C2.88118 0.291169 2.96652 0.186663 3.07619 0.113075C3.18586 0.0394861 3.31492 0.000130314 3.44699 0H14.667C14.8438 0 15.0134 0.0702379 15.1384 0.195262C15.2634 0.320286 15.3337 0.489856 15.3337 0.666667V7.33333C15.3337 7.51014 15.2634 7.67971 15.1384 7.80474C15.0134 7.92976 14.8438 8 14.667 8H12.3457C12.2389 7.99997 12.1338 8.02557 12.039 8.07464C11.9442 8.12372 11.8626 8.19483 11.801 8.282L8.16566 13.4327C8.1197 13.4978 8.05193 13.5443 7.97464 13.5637C7.89734 13.5832 7.81563 13.5743 7.74433 13.5387L6.53499 12.9333C6.19466 12.7632 5.92277 12.4818 5.76451 12.1358C5.60624 11.7898 5.57112 11.4001 5.66499 11.0313L6.26699 8.66667ZM11.3337 6.94133V1.33333H3.89366L2.00033 5.93067V7.33333H6.26699C6.47006 7.33336 6.67044 7.37977 6.85284 7.46903C7.03524 7.55828 7.19485 7.68802 7.31948 7.84834C7.44411 8.00867 7.53047 8.19534 7.57198 8.39412C7.61349 8.5929 7.60905 8.79853 7.55899 8.99533L6.95699 11.3607C6.93815 11.4344 6.94514 11.5125 6.9768 11.5817C7.00846 11.651 7.06287 11.7073 7.13099 11.7413L7.57166 11.9613L10.7117 7.51333C10.8783 7.27733 11.0917 7.084 11.3337 6.94133V6.94133ZM12.667 6.66667H14.0003V1.33333H12.667V6.66667Z"
                                        fill="#969696"></path>
                                </svg>
                                <span class="regular-h5 c-gray-medium">0</span>
                            </div>
                        </div>
                        <div class="_reply" data-no="${comment.no}" data-type="event">
                            <span class="medium-h5 c-gray-dark-low _delete" data-no="${comment.no}" data-type="${type}" data-parent="parent">삭제</span>
                            <span class="medium-h5 c-gray-dark-low _do" data-comment-no="${comment.no}" data-type="${type}" data-no="${community_no}">답글</span>
                        </div>
                    </div>
                </div>
                <div class="reply-comment-container">
                </div>
            </div>`;
}
const createCommentElement = (type, comment) => {
    let reg_datetime = Time.formatLocalDatetime(comment.reg_datetime);
    return `<div class="_comment">
                    <div class="_profile-img">
                        <img alt="" src="${comment.user.profile_img.url}">
                    </div>
                    <div class="_media">
                        <div class="_comment-text">
                            <span class="medium-p1 _content ellipsis-one-line">${comment.content}</span>
                                <span class="bold-p1 c-brand-green _new">New!</span>
                        </div>
                        <div class="_info">
                            <span class="regular-p1 c-gray-medium _name">${comment.user.name}</span>
                            <span class="regular-p1 c-gray-light ml-8">${reg_datetime}</span>
                        </div>
                    </div>
                    <div class="_transactions">
                        <div class="_reply" data-no="${comment.no}" data-type="event">
                                <span class="medium-h5 c-gray-dark-low _delete mr-0" data-no="${comment.no}" data-type="${type}" data-parent="self">삭제</span>
                        </div>
                    </div>
                </div>`;
}