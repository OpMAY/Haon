package com.api.trace.response;

import lombok.Data;

@Data
public class TraceData {
    // Data
    private String butcheryPlaceAddr; // 도축장 주소
    private String butcheryPlaceNm; // 도축장 명
    private String butcheryYmd; // 도축 일자
    private String cattleNo; // 소 개체 번호
    private String corpNo; // 사업자 번호
    private String farmAddr; // 농장주소
    private String gradeNm; // 등급명
    // 조회 정보 옵션값 1~7 : 개체/이력, 8~9 : 묶음 1 : 개체(소), 사육(돼지) 2 : 출생 등 신고(소) 3 : 도축(소/돼지) 4 : 포장(소/돼지) 5 : 구제역백신(소) 6 : 질병정보(소) 7 : 브루셀라(소)  8 : 묶음 기본정보(묶음) 9 : 묶음구성내역(묶음)
    private int infoType; // 조회 정보
    private String lotNo; // 묶음 번호
    private String lsTypeNm; // 소의 종류
    // CATTLE/CATTLE_NO : 소 개체 CATTLE/LOT_NO : 소 묶음 PIG/PIG_NO : 돼지 이력 PIG/LOT_NO : 돼지 묶음 FOWL/HIST_NO : 닭 이력 DUCK/HIST_NO : 오리 이력 EGG/HIST_NO : 계란 이력 FOWL/LOT_NO : 닭 묶음 DUCK/LOT_NO : 오리 묶음
    private String traceNoType; // 묶음 구분
    private boolean inspectYn; // 브루셀라 접종 유무
    private String flatEartagNo; // 재부착번호
    private String pigNo; // 돼지 이력 번호
    private String processPlaceAddr; // 포장 처리 업소 주소
    private String processPlaceNm; // 포장 처리 업소명
    private String regYmd; // 신고년월일
    private String sexNm; // 성별 (암, 수)
    private String vaccineOrder; // 구제역 백신 접종 차수 (13차)
    private String regType; // 신고 구분
    private String inspectPassYn; // 위생 검사 결과 (합격, 불합격)
    private String injectionYmd; // 구제역 예방접종 최종일자
    private String farmUniqueNo; // 농장 식별 번호
    private String inspectDt; // 브루셀라 검사 최종일자
    private String injectiondayCnt; // 구제역 백신접종경과일
    private Integer monthDiff; // 수입경과 월
    private String birthYmd; // 출생일자
    private String processYmd; // 포장 처리 일자
    private String farmerNm; // 소유주 명
    private String nationNm; // 수입 국가
    private String inspectDesc; // 질명 유무
    private String insfat; // 근내 지방도
    private String farmNo; // 농장번호
    private String histNo; // 이력번호 (첫번째 자리가 2인 경우는 닭, 3인 경우는 계란, 5인경우는 오리)
    private String farmIdno; // 농장 식별 번호
    private String mngrNm; // 농장 경영자명
    private String brdngEnvrnNm; // 사육환경
    private String lvindRgrfc; // 축산업 등록 번호
    private String abattNm; // 작업장명
    private String add0R; // 도축장 소재지
    private String rceptDt; // 도축일자
    private String psexmYn; // 도축검사 결과
    private String entrpNm; // 업체명
    private String frmrNm; // 농장 경영자 명
    private String reqerEntrpNm; // 신청인 업체명
    private String reqerEntrpAddr; // 신청인 업체 주소
    private String issueDt; // 발급 일자
    private String edygOvpstDt; // 식용란 산란 일자
    private String successYn; // 선별 검사 결과
    private String entrpAddr; // 거래처 소재지
}
