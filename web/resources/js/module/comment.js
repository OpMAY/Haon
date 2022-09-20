$(document).ready(function () {
    /** Comment reply */
    $('._reply')
        .on('click', '._do', doClickEventListener)
        .on('click', '._cancel', cancelClickEventListener)
        .on('click', '._delete', deleteClickEventListener);
});

function deleteClickEventListener(event) {
    let comment_element = this.closest('._comment');
    deleteReviewReply(this.dataset.type, this.dataset.no).then((result) => {
        if (result.status === 'OK') {
            if (result.data.status) {
                let comment = result.data.comment;
                /*TODO _comment-text 바꾸고, _info 바꾸고, _profile-img 바꾸고, 삭제 버튼 지우기*/
                let comment_text = comment_element.querySelector('._comment-text');
                comment_text.querySelector('._content').innerHTML = `${comment.content}`;

                let comment_info = comment_element.querySelector('._info');
                comment_info.querySelector('._name').innerHTML = `${comment.user.name}`;

                let comment_profile = comment_element.querySelector('._profile-img');
                comment_profile.querySelector('img').src = `${comment.user.profile_img.url}`;

                let transactions = comment_element.querySelector('._transactions');
                transactions.remove();

                viewAlert({content:'해당 메세지가 삭제되었습니다.'});
            }
        }
    });
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
    console.log(t.dataset.no);
    /**
     * <span class="medium-h5 c-gray-dark-low _do"
     data-comment-no="${comment.no}" data-type="BOARD" data-no="${board.no}">답글</span>*/
    let comment_no = t.dataset.commentNo;
    let type = t.dataset.type;
    let no = t.dataset.no;
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
        let container = element.closest('.reply-comment-container');
        let comment_no = input.dataset.commentNo;
        let type = input.dataset.type;
        let no = input.dataset.no;
        insertReviewReply(type, no, input.value.trim(), comment_no).then((result) => {
            console.log(result);
            if (result.status === 'OK') {
                if (result.data.status) {
                    if (container.querySelectorAll('._comment').length !== 0) {
                        let first_comment = container.querySelectorAll('._comment')[0];
                        $(first_comment).before(createCommentElement(type, result.data.comment));
                    } else {
                        $(container).append(createCommentElement(type, result.data.comment));
                    }

                    let reply_event = $('[data-type="event"]');
                    reply_event
                        .on('click', '._do', doClickEventListener)
                        .on('click', '._cancel', cancelClickEventListener)
                        .on('click', '._delete', deleteClickEventListener);

                    let reply_container = container.closest('.comment-container').querySelector('._comment ._reply');
                    $(reply_container).append(`<span class="medium-h5 c-basic-black _do" data-no="${no}">답글</span>`);
                    reply_container.querySelector('._cancel').remove();
                    container.querySelector('.form-group').remove();
                }
            }
        });
    } else {
        alert({content: '내용을 입력해주세요.'});
    }
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
                        <div class="_reply" data-type="event">
                                <span class="medium-h5 c-gray-dark-low _delete mr-0" data-no="${comment.no}" data-type="${type}" data-parent="self">삭제</span>
                        </div>
                    </div>
                </div>`;
}