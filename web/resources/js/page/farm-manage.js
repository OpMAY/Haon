$(document).ready(function () {
    $('[data-action="change-description"]').click(function () {
        let target = this;
        let modal = target.closest('.modal');
        let description = $('#summernote').summernote('code');
        let description_regex = /^.{10,8000}$/gm;
        if ($(description).text().length === 0) {
            description = '<p>' + description + '</p>';
        }
        if (!description_regex.test($(description).text())) {
            if (!description_regex.test(description)) {
                viewAlert({content: '게시글 내용을 정확히 입력해주세요. 10글자 이상, 8000글자 이내'});
                $(modal).modal('hide');
                return false;
            }
        }

        updateFarmHouseDetails(description).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                if (result.data.status) {
                    viewAlert({content: '농장 소개를 변경하였습니다.'});
                    deleteChild($('.summernote-container')[0]);
                    $('.summernote-container').append(description);
                    modal.data('origin', description);
                    $(modal).modal('hide');
                }
            }
        });
    });
    $('[data-action="change-sns"]').click(function () {
        let target = this;
        let modal = target.closest('.modal');
        let instagram = target.closest('.modal').querySelector('[name="instagram"]').value;
        let blog = target.closest('.modal').querySelector('[name="blog"]').value;
        let homepage = target.closest('.modal').querySelector('[name="homepage"]').value;
        console.log(instagram, blog, homepage);
        if(instagram.trim().length > 0 && !isValidUrl(instagram)) {
            viewAlert({content: '인스타그램 주소를 올바르게 입력해주세요.'});
            return false;
        }
        if(blog.trim().length > 0 && !isValidUrl(blog)) {
            viewAlert({content: '블로그 주소를 올바르게 입력해주세요.'});
            return false;
        }
        if(homepage.trim().length > 0 && !isValidUrl(homepage)) {
            viewAlert({content: '홈페이지 주소를 올바르게 입력해주세요.'});
            return false;
        }
        updateFarmHouseSNS(instagram, blog, homepage).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                if (result.data.status) {
                    modal.querySelector('[name="instagram"]').value = instagram;
                    modal.querySelector('[name="blog"]').value = blog;
                    modal.querySelector('[name="homepage"]').value = homepage;
                    $(modal.querySelector('[name="instagram"]')).data('origin', instagram);
                    $(modal.querySelector('[name="blog"]')).data('origin', blog);
                    $(modal.querySelector('[name="homepage"]')).data('origin', homepage);


                    viewAlert({content: 'SNS를 변경하였습니다.'});
                    $(modal).modal('hide');
                }
            }
        });
    });
    $('[data-action="change-name"]').click(function () {
        let target = this;
        let modal = target.closest('.modal');
        let name = modal.querySelector('[name="name"]');
        updateFarmHouseName(name.value).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                if (result.data.status) {
                    $('.farm-detail ._info-container ._title ._text').html(`${name.value}`);
                    viewAlert({content: '농장 이름을 변경하였습니다.'});
                    $(name).data('origin', name.value);
                    $(modal).modal('hide');
                }
            }
        });
    });
    $('[data-action="change-hashtag"]').click(function () {
        let target = this;
        let modal = target.closest('.modal');
        let hash_elements = modal.querySelectorAll('.btn-hashtag-container > .btn-hashtag span:first-child');
        let hashs = new Array();

        hash_elements.forEach(function (e) {
            hashs.push(e.innerText.trim());
        });

        updateFarmHouseHashTag(JSON.stringify(hashs)).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                if (result.data.status) {
                    let hash_container = $('.farm-detail ._info-container ._recommends > div:first-child');
                    deleteChild(hash_container[0]);
                    hashs.forEach(function (hash) {
                        hash_container.append(createHashTag(hash));
                    });
                    viewAlert({content: '해시태그를 변경하였습니다.'});
                    $(modal).modal('hide');
                }
            }
        });
    });
    $('[data-action="change-profile"]').click(function () {
        let target = this;
        let modal = target.closest('.modal');
        let file_input = modal.querySelector('[type="file"]');
        let preview = modal.querySelector('._preview-img');
        updateFarmHouseProfile(file_input.files[0]).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                if (result.data.status) {
                    viewAlert({content: '농장 프로필 이미지를 변경했습니다.'});
                    $('._profile-image').css('background-image', `url('${result.data.file.url}')`);
                    $(preview).data('originUrl', result.data.file.url);
                    $(modal).modal('hide');
                }
            }
        });
    });
    $('[data-action="change-banner"]').click(function () {
        let target = this;
        let modal = target.closest('.modal');
        let file_input = modal.querySelector('[type="file"]');
        let preview = modal.querySelector('._preview-img');
        updateFarmHouseBanner(file_input.files[0]).then((result) => {
            setLoading(false);
            if (result.status === 'OK') {
                if (result.data.status) {
                    viewAlert({content: '농장 이미지를 변경했습니다.'});
                    $('._detail-banner').css('background-image', `url('${result.data.file.url}')`);
                    $(preview).data('originUrl', result.data.file.url);
                    $(modal).modal('hide');
                }
            }
        });
    });
});

const createHashTag = (text) => {
    return `<button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-h5">
                    ${text}
            </button>`;
}

const createHashtagElement = (text) => {
    return `<span class="btn btn-brand-opacity btn-md btn-hashtag btn-icon default-pointer">
                      <span class="bold-h5 my-auto">${text}</span>
                      <span class="_close cursor-pointer my-auto p-8 pl-16">
                        <svg
                                width="25"
                                height="25"
                                viewBox="0 0 25 25"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              clip-rule="evenodd"
                              d="M12.5 1.04175C6.17183 1.04175 1.04163 6.17196 1.04163 12.5001C1.04163 18.8282 6.17183 23.9584 12.5 23.9584C18.8281 23.9584 23.9583 18.8282 23.9583 12.5001C23.9583 6.17196 18.8281 1.04175 12.5 1.04175ZM16.3614 10.1115C16.5512 9.91508 16.6562 9.65195 16.6538 9.37883C16.6514 9.10571 16.5419 8.84445 16.3487 8.65131C16.1556 8.45818 15.8943 8.34863 15.6212 8.34626C15.3481 8.34388 15.085 8.44888 14.8885 8.63862L12.5 11.0272L10.1114 8.63862C10.0153 8.53913 9.90038 8.45978 9.7733 8.40518C9.64621 8.35059 9.50952 8.32186 9.37121 8.32065C9.2329 8.31945 9.09573 8.34581 8.96772 8.39818C8.8397 8.45056 8.7234 8.52791 8.62559 8.62571C8.52779 8.72352 8.45044 8.83982 8.39806 8.96784C8.34569 9.09586 8.31933 9.23302 8.32053 9.37133C8.32173 9.50964 8.35047 9.64633 8.40506 9.77342C8.45965 9.90051 8.53901 10.0154 8.6385 10.1115L11.027 12.5001L8.6385 14.8886C8.53901 14.9847 8.45965 15.0997 8.40506 15.2267C8.35047 15.3538 8.32173 15.4905 8.32053 15.6288C8.31933 15.7671 8.34569 15.9043 8.39806 16.0323C8.45044 16.1603 8.52779 16.2766 8.62559 16.3745C8.7234 16.4723 8.8397 16.5496 8.96772 16.602C9.09573 16.6544 9.2329 16.6807 9.37121 16.6795C9.50952 16.6783 9.64621 16.6496 9.7733 16.595C9.90038 16.5404 10.0153 16.461 10.1114 16.3615L12.5 13.973L14.8885 16.3615C15.085 16.5513 15.3481 16.6563 15.6212 16.6539C15.8943 16.6515 16.1556 16.542 16.3487 16.3489C16.5419 16.1557 16.6514 15.8945 16.6538 15.6213C16.6562 15.3482 16.5512 15.0851 16.3614 14.8886L13.9729 12.5001L16.3614 10.1115Z"
                              fill="#A9CC52"/>
                      </svg>
                      </span>
                    </span>`;
}

const loadFile = function (event, target) {
    let file = event.target.files[0];
    let reader = new FileReader();
    let modal = target.closest('.modal');
    reader.onload = function (event) {
        let preview = modal.querySelector('._preview-img');
        $(preview).css('background-image', `url('${reader.result}')`);
        if (preview.style.display !== 'block') {
            $(preview).show();
        }
    };
    reader.onloadend = function (event) {
        let text_input = modal.querySelector('input[type="text"]');
        text_input.value = `${file.name}`;
    };
    reader.readAsDataURL(event.target.files[0]);
};