$('.dropdown-menu').on('click', 'a.dropdown-item', function (event) {
    let type = $(this).parent().data().type;
    let item = $(this).parent().data().item;
    let dropdown_item = this;
    if ($(this).hasClass('farm')) {
        // Only for Farm Detail

    } else {
        if (type === 'to') {
            window.location.href = dropdown_item.querySelector('div').dataset.to;
        } else {
            let input = dropdown_item.closest('.dropdown').querySelector('[data-toggle="dropdown"] .dropdown-input');
            if (type === 'category') {
                if (input.value !== dropdown_item.querySelector('div').dataset.value) {
                    // 카테고리에 맞춰 새로 불러오기
                    let order = $('[data-type="order"]').closest('.dropdown').find('[data-toggle="dropdown"] .dropdown-input').data().type;
                    let category = dropdown_item.querySelector('div').dataset.value;
                    loadMoreContents(item, 0, order, category).then((result) => listFormatOnResult(result, item, true))
                    if (item === 'farm') {
                        let header_farm_list_group = document.getElementById('header-desc').querySelector('.list-group:first-child');
                        let now_selected = header_farm_list_group.querySelector('.is-active');
                        if (now_selected !== undefined && now_selected !== null) {
                            if (category !== '') {
                                let category_selected = header_farm_list_group.querySelector(`[data-href="/community/farms?type=${category}"]`)
                                if (now_selected !== category_selected) {
                                    now_selected.classList.remove('is-active');
                                    category_selected.classList.add('is-active');
                                }
                            } else {
                                now_selected.classList.remove('is-active');
                            }
                        } else {
                            if (category !== '') {
                                let category_selected = header_farm_list_group.querySelector(`[data-href="/community/farms?type=${category}"]`)
                                category_selected.classList.add('is-active');
                            }
                        }

                    }
                }
            } else if (type === 'order') {
                if (input.value !== dropdown_item.textContent) {
                    // 순서에 맞춰 새로 불러오기
                    let category = $('[data-type="category"]').closest('.dropdown').find('[data-toggle="dropdown"] .dropdown-input').data().type;
                    let order = dropdown_item.querySelector('div').dataset.value;
                    loadMoreContents(item, 0, order, category).then((result) => listFormatOnResult(result, item, true))
                }
            }
            let text = dropdown_item.textContent.trim();
            if (input.disabled) {
                input.removeAttribute('disabled');
                input.value = text;
                $(input).data('type', dropdown_item.querySelector('div').dataset.value);
                input.setAttribute('disabled', 'disabled');
            } else if (input.readonly) {
                input.removeAttribute('readonly');
                input.value = text;
                $(input).data('type', dropdown_item.querySelector('div').dataset.value);
                input.setAttribute('readonly', 'readonly');
            } else {
                input.value = text;
            }
        }
    }
});

function listFormatOnResult(result, item, is_new) {
    console.log(result);
    if (result.status === 'OK') {
        let contents_elem = $('._content-list');
        if (is_new) {
            contents_elem.children(':not(.no-data)').remove();
        }
        let data = result.data.list;
        if (data !== undefined && data !== null && data.length > 0) {
            if(contents_elem.find('.no-data').length > 0){
                contents_elem.find('.no-data').remove();
            }
            switch (item) {
                case 'board':
                    data.forEach((elem, idx) => {
                        contents_elem.append(`<div class="col" data-no="${elem.no}">
                        <div class="_board-container" data-type="board">
                            <div class="_content ellipsis-one-line">
                                <span class="medium-h4">${elem.title}</span>
                            </div>
                            <div class="_info">
                                <span class="bold-h5 c-brand-green d-none">New!</span>
                                <span class="medium-h5 c-gray-light ml-8">${elem.views} Views</span>
                            </div>
                        </div>
                    </div>`)
                    })
                    break;
                case 'tip':
                    data.forEach((elem, idx) => {
                        let component;
                        if (elem.thumbnail?.url === null) {
                            component =
                                `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}">
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
                                                </span>`
                                + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIPS"
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
                                    </span>` : `<span class="_bookmark" data-bookmark="TIPS" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) +
                                `</div>
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
                                    </span>`
                                + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIPS"
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
                                    </span>` : `<span class="_bookmark" data-bookmark="TIPS" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) +
                                `</div>
                                    </div>
                                </div>`;
                        }
                        contents_elem.append(component);
                    })
                    break;
                case 'magazine':
                    data.forEach((elem, idx) => {
                        let component;
                        if (elem.thumbnail?.url === null) {
                            component =
                                `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}">
                                        <div class="card community-card is-empty">
                                            <div class="background-image _profile"
                                                 style="background-image:url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                                            <div class="card-body _body">
                                                <h5 class="card-title _title bold-h4 c-gray-dark-low">${elem.title}</h5>
                                                <div class="card-text _description medium-h5 c-gray-medium">${elem.content}</div>
                                            </div>
                                            <div class="_footer">
                                                <span class="_views medium-p1 c-gray-light">
                                                  <span class="_count">${elem.views}</span> Views
                                                </span>`
                                + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIPS"
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
                                    </span>` : `<span class="_bookmark" data-bookmark="TIPS" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) +
                                `</div>
                                    </div>
                                </div>`;
                        } else {
                            component = `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}">
                            <div class="card community-card">
                                <div class="background-image _thumbnail"
                                     style="background-image:url('${elem.thumbnail.url}')">
                                    <div class="background-image _profile"
                                         style="background-image:url('../../resources/assets/images/sample/sample_profile_1.png')"></div>
                                </div>
                                <div class="card-body _body">
                                    <h5 class="card-title _title bold-h4 c-gray-dark-low">${elem.title}</h5>
                                    <div class="card-text _description medium-h5 c-gray-medium">${elem.content}</div>
                                </div>
                                <div class="_footer">
                                    <span class="_views medium-p1 c-gray-light">
                                      <span class="_count">${elem.views}</span> Views
                                    </span>`
                                + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIPS"
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
                                    </span>` : `<span class="_bookmark" data-bookmark="TIPS" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) +
                                `</div>
                                    </div>
                                </div>`;
                        }
                        contents_elem.append(component);
                    })
                    break;
                case 'manual':
                    data.forEach((elem, idx) => {
                        let component;
                        if (elem.thumbnail?.url === null) {
                            component =
                                `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}">
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
                                                </span>`
                                + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIPS"
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
                                    </span>` : `<span class="_bookmark" data-bookmark="TIPS" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) +
                                `</div>
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
                                    </span>`
                                + (elem._bookmark ? `<span class="_bookmark is-active" data-bookmark="TIPS"
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
                                    </span>` : `<span class="_bookmark" data-bookmark="TIPS" data-no="${elem.no}">
                                                   <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"><g
                                                           clip-path="url(#clip0_204_2957)"><path
                                                           d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/></g><defs><clipPath
                                                           id="clip0_204_2957"><rect width="24.0923" height="24"
                                                                                     transform="translate(0.0500488)"/></clipPath></defs></svg>
                                            </span>`) +
                                `</div>
                                    </div>
                                </div>`;
                        }
                        contents_elem.append(component);
                    })
                    break;
                case 'question':
                    data.forEach((elem, idx) => {
                        let component = `<div class="col" data-no="${elem.question.no}">
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
                        </div>`;
                        contents_elem.append(component);
                    })
                    break;
                case 'farm':
                    data.forEach((elem, idx) => {
                        console.log(elem._bookmark);
                        let korName;
                        switch (elem.type) {
                            case 'CATTLE' :
                                korName = '소';
                                break;
                            case 'PIG' :
                                korName = '돼지';
                                break;
                            case 'FOWL' :
                                korName = '닭';
                                break;
                            case 'DUCK' :
                                korName = '오리';
                                break;
                            case 'RABBIT' :
                                korName = '토끼';
                                break;
                            case 'HORSE' :
                                korName = '말';
                                break;
                            case 'SHEEP_GOAT' :
                                korName = '양 & 염소';
                                break;
                            case 'NONE' :
                                korName = '해당 없음';
                                break;
                            default:
                                korName = '해당 없음';
                                break;
                        }
                        let component = `<div class="col p-8 d-flex align-items-stretch" data-no="${elem.no}">
                        <div class="card farm-card">
                            <div class="background-image _thumbnail"
                                 style="background-image: url('${elem.profile_image.url}')">
                            ` + (elem._bookmark ? `<div class="_bookmark is-active" data-bookmark="FARM" data-no="${elem.no}">
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
                                    </div>` :
                                `<div class="_bookmark" data-bookmark="FARM" data-no="${elem.no}">
                                        <svg width="25" height="24" viewBox="0 0 25 24" fill="none"
                                             xmlns="http://www.w3.org/2000/svg">
                                            <g
                                                    clip-path="url(#clip0_204_2957)">
                                                <path
                                                        d="M21.3105 12.794L21.3236 12.808L12.0962 22L2.86887 12.808L2.88192 12.794C1.81038 11.5496 1.25052 9.9477 1.31451 8.30941C1.3785 6.67111 2.06163 5.11742 3.227 3.95968C4.39237 2.80194 5.95389 2.12567 7.59866 2.06639C9.24342 2.00711 10.8499 2.5692 12.0962 3.64002C13.3425 2.5692 14.949 2.00711 16.5938 2.06639C18.2386 2.12567 19.8001 2.80194 20.9655 3.95968C22.1308 5.11742 22.814 6.67111 22.8779 8.30941C22.9419 9.9477 22.3821 11.5496 21.3105 12.794ZM4.64267 5.38302C4.22319 5.80089 3.89045 6.29697 3.66343 6.84293C3.43641 7.3889 3.31956 7.97407 3.31956 8.56502C3.31956 9.15597 3.43641 9.74114 3.66343 10.2871C3.89045 10.8331 4.22319 11.3292 4.64267 11.747L12.0962 19.172L19.5498 11.747C20.3969 10.9031 20.8729 9.7585 20.8729 8.56502C20.8729 7.37154 20.3969 6.22694 19.5498 5.38302C18.7026 4.5391 17.5536 4.065 16.3555 4.065C15.1575 4.065 14.0085 4.5391 13.1613 5.38302L8.90199 9.62602L7.48255 8.21002L10.6567 5.04802C9.7886 4.35736 8.69544 4.0096 7.58617 4.07121C6.4769 4.13283 5.42932 4.5995 4.64367 5.38202L4.64267 5.38302Z"/>
                                            </g>
                                            <defs>
                                                <clipPath
                                                        id="clip0_204_2957">
                                                    <rect width="24.0923" height="24"
                                                          transform="translate(0.0500488)"/>
                                                </clipPath>
                                            </defs>
                                        </svg>
                                    </div>`)
                            +
                            `</div>
                                <div class="card-body _body">
                                <h5 class="card-title _title bold-h4 c-basic-black">${elem.name}</h5>
                                <p class="card-text _farm-type bold-h5 c-brand-green">${korName}</p>
                                <div class="_hashs">
                                    `;
                        elem.hashtag.forEach((hash, indx) => {
                            component = component + `<span class="_hash c-gray-medium medium-p1">${hash}</span>`;
                        });
                        component = component + `
                                </div>
                            </div>
                            <div class="_footer">
                                <button type="button" class="btn btn-brand-opacity btn-block bold-h5" data-no="${elem.no}">
                                    농장 자세히 보기
                                </button>
                            </div>
                        </div>
                    </div>`
                        contents_elem.append(component);
                    })
                    break;
                default:
                    break;
            }
        } else {
            if (is_new) {
                viewAlert({content: '조건에 맞는 데이터가 없습니다.'});
                contents_elem.append(`<div class="no-data bold-h4 c-gray-light mx-auto" style="text-align: center; min-height: 400px; padding: 186px 0">
                    <span>조건에 맞는 데이터가 없습니다.</span>
                </div>`);
            } else {
                viewAlert({content: '더이상 불러올 데이터가 없습니다.'});
            }
        }
    }
}