$(document).ready(function () {
    $('#trace-created').on('show.bs.modal', function () {
        const user_type = $('._animals ._animal input').data().category;
        if (!availableFarmTypes.includes(user_type)) {
            viewAlert({content: '이력을 직접 입력할 수 없는 농장 종류입니다.', zIndex: 2000});
        }
    }).find('input#trace-search').next().on('click', function () {
        let $input = $('input#trace-search');
        console.log($input.val());
        findTrace($input.val()).then((result) => {
            console.log(result);
            if (result.status === 'OK') {
                if (result.data.status) {
                    // TODO 해당 번호로 데이터 가져오기
                    viewModal({
                        zIndex: 1999,
                        btnCount: 2,
                        backDrop: true,
                        title: `이력 조회 결과 : ${$input.val()}`,
                        desc: `연결 가능한 이력을 찾았습니다! 해당 이력을 연결하시겠습니까?<br>
                        이력 상 농장 주소 : ${result.data.address}<br><br>
                        ※ 주의! 이력제에 등록된 주소와 정보가 일치하는지 확인 후 연결해주시길 바랍니다.`,
                        onConfirm: () => {
                            viewAlert({content: `${$input.val()}`});
                        },
                        onShow: () => {
                            $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                        },
                        onShown: () => {
                            $('body .modal-backdrop._second').removeClass('_second').css('z-index', 1040);
                            $('body .modal-backdrop:last-child').addClass('_second').css('z-index', 1080);
                        },
                    })
                } else {
                    viewAlert({content: '존재하지 않거나 개체 종류와 맞지 않는 이력 번호 입니다.', zIndex: 2000})
                }
            }
        })
    })


    $('._trace-breed-delete').on('click', function () {
        $(this).parent().parent().remove();
    })
});


const availableFarmTypes = ['SHEEP_GOAT', 'HORSE', 'RABBIT'];