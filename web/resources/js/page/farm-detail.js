const farmNo = window.location.pathname.substring(23);
$(document).ready(function () {
    $('._board-list ._board-container').on('click', function (e) {
        let no = $(this).data().no;
        window.open(`/community/board/detail/` + no, '_blank');
    });

    $('.dropdown-menu a.dropdown-item').on('click', function () {
        let $this_type = $(this).find('div').data().type;
        let type = $(this).parent().data().type;
        let item = $(this).parent().data().item;
        let dropdown_item = this;
        let input = dropdown_item.closest('.dropdown').querySelector('[data-toggle="dropdown"] .dropdown-input');
        if (input.value !== dropdown_item.querySelector('div').textContent) {
            // 카테고리에 맞춰 새로 불러오기
            if (type === 'switch') {
                let category = dropdown_item.closest('.dropdown').nextElementSibling.querySelector('[data-toggle="dropdown"] .dropdown-input');
                // change category lists
                let category_dropdowns = dropdown_item.closest('.dropdown').nextElementSibling.querySelector('.dropdown-menu');
                $(category_dropdowns).data('item', $this_type + 's')
                let category_dropdowns_items = $(category_dropdowns).find(`a.dropdown-item`);
                category_dropdowns_items.each((idx, elem) => {
                    console.log($(elem).data().type, $this_type);
                    if ($(elem).hasClass('d-none') && $(elem).data().type === $this_type) {
                        $(elem).removeClass('d-none');
                    } else {
                        if ($(elem).data().type !== 'all') {
                            $(elem).addClass('d-none');
                        }
                    }
                })
                loadMoreFarmContents(dropdown_item.querySelector('div').dataset.type, farmNo, 0, $(category).data().type).then((result) => {
                    setLoading(false);
                    console.log(result);
                    if (result.status === 'OK') {
                        if (item === 'boards') {
                            let data = result.data.list;
                            if (data !== undefined && data !== null && data.length > 0) {
                                $(document).find(`._farmload[data-type="${$this_type}"]`).removeClass('d-none');
                                updateDataOnBoards(dropdown_item.querySelector('div').dataset.type, $(category).data().type, data, true);
                            } else {
                                let contents_elem = $('._board-list');
                                contents_elem.children().remove();
                                contents_elem.append(`<div class="w-100" style="text-align: center">
                                    <span class="bold-h4 c-gray-light">등록된 컨텐츠가 없습니다.</span>
                                </div>`);
                                $(document).find(`._farmload[data-type="${$this_type}"]`).addClass('d-none');
                                // viewAlert({content: '조건에 일치하는 데이터가 없습니다.'});
                            }
                        } else if (item === 'tips') {
                            let data = result.data.list;
                            let contents_elem = $('._manual-deck');
                            if (data !== undefined && data !== null && data.length > 0) {
                                $(document).find(`._farmload[data-type="${$this_type}"]`).removeClass('d-none');
                                if (!contents_elem.hasClass('row-cols-2')) {
                                    contents_elem.addClass('row-cols-2');
                                }
                                updateDataOnTips(dropdown_item.querySelector('div').dataset.type, $(category).data().type, data, true);
                            } else {
                                contents_elem.children().remove();
                                if (contents_elem.hasClass('row-cols-2')) {
                                    contents_elem.removeClass('row-cols-2');
                                }
                                contents_elem.append(`<div class="w-100" style="text-align: center">
                                    <span class="bold-h4 c-gray-light">등록된 컨텐츠가 없습니다.</span>
                                </div>`);
                                $(document).find(`._farmload[data-type="${$this_type}"]`).addClass('d-none');
                                // viewAlert({content: '조건에 일치하는 데이터가 없습니다.'});
                            }
                        }
                    } else {
                        viewAlert({content: '통신 오류입니다. 잠시 후 다시 시도해주세요.'});
                    }
                })
                let cType = dropdown_item.querySelector('div').dataset.type;
                $(input).data('type', cType);
            }
            else if (type === 'category') {
                let contentType = dropdown_item.closest('.dropdown').previousElementSibling.querySelector('[data-toggle="dropdown"] .dropdown-input');
                console.log(dropdown_item.querySelector('div').dataset.value);
                loadMoreFarmContents($(contentType).data().type, farmNo, 0, dropdown_item.querySelector('div').dataset.value).then((result) => {
                    setLoading(false);
                    console.log(result);
                    if (result.status === 'OK') {
                        if (item === 'boards') {
                            let data = result.data.list;
                            if (data !== undefined && data !== null && data.length > 0) {
                                $(document).find(`._farmload[data-type="${$this_type}"]`).removeClass('d-none');
                                updateDataOnBoards($(contentType).data().type, dropdown_item.querySelector('div').dataset.value, data, true);
                            } else {
                                let contents_elem = $('._board-list');
                                contents_elem.children().remove();
                                contents_elem.append(`<div class="w-100" style="text-align: center">
                                    <span class="bold-h4 c-gray-light">등록된 컨텐츠가 없습니다.</span>
                                </div>`);
                                $(document).find(`._farmload[data-type="${$this_type}"]`).addClass('d-none');
                                viewAlert({content: '조건에 일치하는 데이터가 없습니다.'});
                            }
                        } else if (item === 'tips') {
                            let data = result.data.list;
                            if (data !== undefined && data !== null && data.length > 0) {
                                $(document).find(`._farmload[data-type="${$this_type}"]`).removeClass('d-none');
                                updateDataOnTips($(contentType).data().type, dropdown_item.querySelector('div').dataset.value, data, true);
                            } else {
                                let contents_elem = $('._manual-deck');
                                if (contents_elem.hasClass('row-cols-2')) {
                                    contents_elem.removeClass('row-cols-2');
                                }
                                contents_elem.append(`<div class="w-100" style="text-align: center">
                                    <span class="bold-h4 c-gray-light">등록된 컨텐츠가 없습니다.</span>
                                </div>`);
                                $(document).find(`._farmload[data-type="${$this_type}"]`).addClass('d-none');
                                // viewAlert({content: '조건에 일치하는 데이터가 없습니다.'});
                            }
                        }
                    }
                })
                $(input).data('type', dropdown_item.querySelector('div').dataset.value);
            }
            //
        } else {
            console.log('same');
        }
    });

    $('.question-accordion').on('click', '._more-comments', function (e) {
        let $this = $(this);
        e.preventDefault();
        let question_no = $(this).parent().parent().parent().data().no;
        let comments_Div = $(this).parent().prev();
        let display_comment_list = comments_Div.find('span');
        let last_idx = display_comment_list.length - 1;
        let last_comment = display_comment_list[last_idx];
        console.log(question_no);
        console.log(last_comment);
        let last_comment_no = last_comment.dataset.commentNo * 1;
        if (!isNaN(last_comment_no)) {
            console.log(last_comment_no);
            loadMoreComments('question', question_no, last_comment_no).then((result) => {
                setLoading(false);
                if (result.status === 'OK') {
                    if (result.data.status) {
                        result.data.comments.forEach((element, index) => {
                            comments_Div.append(`<span class="regular-h5" data-comment-no="` + element.no + `">` + element.content + `</span>`);
                        })
                    } else {
                        viewAlert({content: '불러올 댓글이 없거나 댓글을 더 불러올 수 없습니다.'});
                        $this.remove();
                    }
                }
            })
        } else {
            viewAlert({content: '불러올 댓글이 없거나 댓글을 더 불러올 수 없습니다.'});
        }
    });
    $('.question-accordion').on('click', '._accordion-content', function (e) {
        window.open('/community/question/detail/' + this.closest('[data-no]').dataset.no, '_blank');
    });

    $('._farmload').on('click', function () {
        let $this = $(this);
        let tab = this.closest('.tab-pane');
        // content type
        let contentType = $(tab).find('.dropdown:first-child input').data().type;
        // category type
        let categoryType = $(tab).find('.dropdown:last-child input').data().type;
        let contentNo;
        if (contentType === 'board') {
            contentNo = $('._board-list').find('._board-container:last-child').data().no;
        } else if (contentType === 'question') {
            contentNo = $('.question-accordion .accordion-deck-container').find('.col:last-child').data().no;
        } else {
            contentNo = $('._manual-deck').find('.col:last-child').data().no;
        }
        loadMoreFarmContents(contentType, farmNo, contentNo, categoryType).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                let data = result.data.list;
                if (data !== undefined && data !== null && data.length > 0) {
                    if (contentType === 'board' || contentType === 'question') {
                        updateDataOnBoards(contentType, categoryType, result.data.list, false);
                    } else {
                        updateDataOnTips(contentType, categoryType, result.data.list, false);
                    }
                } else {
                    viewAlert({content: '더이상 불러올 데이터가 없습니다.'});
                    $this.addClass('d-none');
                }
            } else {
                viewAlert({content: '잘못된 접근입니다.'});
                console.log(result);
            }
        })
    });

    $('._manual-deck').on('click', '.col', function (e) {
        let type = $(this).data().type;
        if (type === 'tip') {
            let path = e.originalEvent.path;
            if (!path.includes($(this).find('._bookmark')[0])) {
                window.open('/community/tip/detail/' + $(this).data().no, '_blank');
            }
        } else {
            let path = e.originalEvent.path;
            if (!path.includes($(this).find('._bookmark')[0])) {
                window.open('/community/manual/detail/' + $(this).data().no, '_blank');
            }
        }

    });
});

function updateDataOnBoards(contentType, category, data, isNew) {
    let contents_elem;
    if (contentType === 'board') {
        contents_elem = $('._board-list');
        if (isNew) {
            contents_elem.removeClass('d-none')
            contents_elem.next().addClass('d-none');
            contents_elem.children().remove();
        }
        data.forEach((elem, idx) => {
            contents_elem.append(`<div class="_board-container" data-no="${elem.no}" data-type="board">
                                                    <div class="_content ellipsis-one-line">
                                                        <span class="medium-h4">${elem.title}</span>
                                                    </div>
                                                    <div class="_info">
                                                        <span class="bold-h5 c-brand-green d-none">New!</span>
                                                        <span class="medium-h5 c-gray-light ml-8">${elem.views} Views</span>
                                                    </div>
                                                </div>`)
        })
    } else if (contentType === 'question') {
        contents_elem = $('.question-accordion');
        if (isNew) {
            contents_elem.removeClass('d-none');
            contents_elem.prev().addClass('d-none');
            contents_elem.find('.accordion-deck-container').children().remove();
        }
        data.forEach((elem, idx) => {
            contents_elem.find('.accordion-deck-container').append(`<div class="col p-0 mb-16" data-no="${elem.question.no}">
                                                <div class="card">
                                                    <div class="card-header" id="d-h-${elem.question.no}">
                                                        <h2 class="mb-0">
                                                            <button class="btn btn-link btn-block text-left medium-h4"
                                                                    type="button"
                                                                    data-toggle="collapse"
                                                                    data-target="#d-c-${elem.question.no}"
                                                                    aria-expanded="true"
                                                                    aria-controls="d-c-${elem.question.no}">
                                                                <span class="deco-text">Q.</span> ${elem.question.title}
                                                            </button>
                                                        </h2>
                                                        <div class="_arrow collapsed"
                                                             data-toggle="collapse"
                                                             data-target="#d-c-${elem.question.no}"
                                                             aria-expanded="true"
                                                             aria-controls="d-c-${elem.question.no}">
                                                            <svg width="16" height="16" viewBox="0 0 13 8" fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                <path d="M6.36403 4.95024L11.314 0.000244141L12.728 1.41424L6.36403 7.77824L2.67029e-05 1.41424L1.41403 0.000244141L6.36403 4.95024Z"
                                                                      fill="#A9CC52"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div id="d-c-${elem.question.no}"
                                                         class="collapse"
                                                         aria-labelledby="d-h-${elem.question.no}"
                                                         data-parent="#accordionExample1"
                                                         data-no="${elem.question.no}"
                                                         style="">
                                                        <div class="card-body pl-40 pt-0">
                                                            <div class="_accordion-content ellipsis-one-line">
                                                                <span class="regular-h5"
                                                                      data-comment-no="${elem.best_comment_no}">` + (elem.best_comment === null ? `등록된 답변이 없습니다. 지금 바로 답변을 등록해보세요.` : `[베스트] ${elem.best_comment}`) + `</span>
                                                            </div>
                                                            <div class="_accordion-option mt-16">
                                                                <div class="_more-comments">
                                                                    <a href="#">댓글 더 불러오기</a>
                                                                </div>
                                                                <div class="_date ml-auto">
                                                                    <span class="medium-h5 c-gray-light">${elem.reg_datetime.year}-${elem.reg_datetime.monthValue}-${elem.reg_datetime.dayOfMonth}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>`);
        })
    }
}

function updateDataOnTips(contentType, category, data, isNew) {
    let contents_elem = $('._manual-deck');
    if (isNew) {
        contents_elem.children().remove();
    }
    data.forEach((elem, idx) => {
        if (contentType === 'tip') {
            let component;
            if (elem.thumbnail === null || elem.thumbnail.url === null) {
                component = `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}" data-type="tip">
                                        <div class="card community-card is-empty">
                                            <div class="background-image _profile"
                                                 style="background-image:url('${elem.profile_image.url}')"></div>
                                            <div class="card-body _body">
                                                <h5 class="card-title _title bold-h4 c-gray-dark-low">${elem.title}</h5>
                                                <div class="card-text _description medium-h5 c-gray-medium">${elem.content}</div>
                                            </div>
                                            <div class="_footer">
                                                <span class="_views medium-p1 c-gray-light">
                                                  <span class="_count">${elem.views}</span> Views
                                                </span>` + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIP"
                                          data-no="${elem.no}">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                  <g clip-path="url(#clip0_249_10407)">
                                                      <path
                                                              d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                                              fill="#A9CC52"/>
                                                  </g>
                                                  <defs>
                                                      <clipPath id="clip0_249_10407">
                                                          <rect width="24" height="24" fill="white"/>
                                                      </clipPath>
                                                  </defs>
                                              </svg>
                                    </span>` : `<span class="_bookmark" data-bookmark="TIP" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) + `</div>
                                    </div>
                                </div>`;
            } else {
                component = `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}" data-type="manual">
                            <div class="card community-card">
                                <div class="background-image _thumbnail"
                                     style="background-image:url('${elem.thumbnail.url}')">
                                    <div class="background-image _profile"
                                         style="background-image:url('${elem.profile_image.url}')"></div>
                                </div>
                                <div class="card-body _body">
                                    <h5 class="card-title _title bold-h4 c-gray-dark-low">${elem.title}</h5>
                                    <div class="card-text _description medium-h5 c-gray-medium">${elem.content}</div>
                                </div>
                                <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                      <span class="_count">${elem.views}</span> Views
                                    </span>` + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIP"
                                          data-no="${elem.no}">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                 xmlns="http://www.w3.org/2000/svg">
                                                  <g clip-path="url(#clip0_249_10407)">
                                                      <path
                                                              d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                                              fill="#A9CC52"/>
                                                  </g>
                                                  <defs>
                                                      <clipPath id="clip0_249_10407">
                                                          <rect width="24" height="24" fill="white"/>
                                                      </clipPath>
                                                  </defs>
                                              </svg>
                                    </span>` : `<span class="_bookmark" data-bookmark="TIP" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) + `</div>
                                    </div>
                                </div>`;
            }
            contents_elem.append(component)
        } else if (contentType === 'manual') {
            let component;
            if (elem.thumbnail === null || elem.thumbnail.url === null) {
                component = `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}">
                                                        <div class="card community-card is-empty">
                                                            <div class="background-image _profile"
                                                                 style="background-image:url('${elem.profile_image.url}')"></div>
                                                            <div class="card-body _body">
                                                                <h5 class="card-title _title bold-h4 c-gray-dark-low">${elem.title}</h5>
                                                                <div class="card-text _description medium-h5 c-gray-medium">${elem.content}</div>
                                                            </div>
                                                            <div class="_footer">
                                                                <span class="_views medium-p1 c-gray-light">
                                                                  <span class="_count">${elem.views}</span> Views
                                                                </span>` + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIP"
                                                          data-no="${elem.no}">
                                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                                 xmlns="http://www.w3.org/2000/svg">
                                                                  <g clip-path="url(#clip0_249_10407)">
                                                                      <path
                                                                              d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                                                              fill="#A9CC52"/>
                                                                  </g>
                                                                  <defs>
                                                                      <clipPath id="clip0_249_10407">
                                                                          <rect width="24" height="24" fill="white"/>
                                                                      </clipPath>
                                                                  </defs>
                                                              </svg>
                                                    </span>` : `<span class="_bookmark" data-bookmark="TIP" data-no="${elem.no}">
                                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                                           clip-path="url(#clip0_204_2957)"><path
                                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                                            </span>`) + `</div>
                                                    </div>
                                                </div>`;
            } else {
                component = `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}">
                                                    <div class="card community-card">
                                                        <div class="background-image _thumbnail"
                                                             style="background-image:url('${elem.thumbnail.url}')">
                                                            <div class="background-image _profile"
                                                                 style="background-image:url('${elem.profile_image.url}')"></div>
                                                        </div>
                                                        <div class="card-body _body">
                                                            <h5 class="card-title _title bold-h4 c-gray-dark-low">${elem.title}</h5>
                                                            <div class="card-text _description medium-h5 c-gray-medium">${elem.content}</div>
                                                        </div>
                                                        <div class="_footer">
                                                            <span class="_views medium-p1 c-gray-light">
                                                              <span class="_count">${elem.views}</span> Views
                                                            </span>` + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIP"
                                                                  data-no="${elem.no}">
                                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                                         xmlns="http://www.w3.org/2000/svg">
                                                                          <g clip-path="url(#clip0_249_10407)">
                                                                              <path
                                                                                      d="M21.1792 12.7944L21.1922 12.8084L12.0002 22.0004L2.80821 12.8084L2.82121 12.7944C1.75378 11.5499 1.19605 9.94807 1.2598 8.30977C1.32355 6.67148 2.00406 5.11779 3.16496 3.96005C4.32587 2.8023 5.88141 2.12603 7.51987 2.06675C9.15834 2.00747 10.7587 2.56956 12.0002 3.64039C13.2417 2.56956 14.8421 2.00747 16.4806 2.06675C18.119 2.12603 19.6746 2.8023 20.8355 3.96005C21.9964 5.11779 22.6769 6.67148 22.7406 8.30977C22.8044 9.94807 22.2466 11.5499 21.1792 12.7944Z"
                                                                                      fill="#A9CC52"/>
                                                                          </g>
                                                                          <defs>
                                                                              <clipPath id="clip0_249_10407">
                                                                                  <rect width="24" height="24" fill="white"/>
                                                                              </clipPath>
                                                                          </defs>
                                                                      </svg>
                                                            </span>` : `<span class="_bookmark" data-bookmark="TIP" data-no="${elem.no}">
                                                                           <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                                                xmlns="http://www.w3.org/2000/svg"><g
                                                                                   clip-path="url(#clip0_204_2957)"><path
                                                                                   d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                                                   id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                                             transform="translate(0.0500488)"/></clipPath></defs></svg>
                                                                    </span>`) + `</div>
                                                            </div>
                                                        </div>`;
            }
            contents_elem.append(component);
        }
    })
}