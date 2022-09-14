package com.service;

import com.api.trace.TraceApi;
import com.api.trace.response.*;
import com.google.gson.Gson;
import com.model.farm.trace.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.XML;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class TraceService {
    /**
     * CATTLE/CATTLE_NO : 소 개체
     * CATTLE/LOT_NO : 소 묶음
     * PIG/PIG_NO : 돼지 이력
     * PIG/LOT_NO : 돼지 묶음
     * FOWL/HIST_NO : 닭 이력
     * DUCK/HIST_NO : 오리 이력
     * EGG/HIST_NO : 계란 이력
     * FOWL/LOT_NO : 닭 묶음
     * DUCK/LOT_NO : 오리 묶음
     **/
    public static void main(String[] args) {
        TraceApi traceApi = new TraceApi();
        String CATTLE_NO = "002075264204";
        String CATTLE_LOT_NO = "L01709271277007";
        String PIG_NO = "170003000058";
        String PIG_LOT_NO = "L11507319120001";
        String FOWL_HIST_NO = "520041604001";
        String DUCK_HIST_NO = "520041604001";
        String EGG_HIST_NO = "304160070002";
        String FOWL_LOT_NO = "L22004152182001";
        String DUCK_LOT_NO = "L22004152182001";

        String cattle_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
                "- <response>\n" +
                "- <header>\n" +
                "  <resultCode>00</resultCode> \n" +
                "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
                "  </header>\n" +
                "  <notice /> \n" +
                "- <body>\n" +
                "- <items>\n" +
                "- <item>\n" +
                "  <birthYmd>20130712</birthYmd> \n" +
                "  <cattleNo>410002086431813</cattleNo> \n" +
                "  <infoType>1</infoType> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <monthDiff>0</monthDiff> \n" +
                "  <sexNm>거세</sexNm> \n" +
                "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "<farmUniqueNo>CATTLE|CATTLE_NO</farmUniqueNo> \n" +
                "<farmNo>342267</farmNo>\n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <farmAddr>경상북도 의성군 구천면</farmAddr> \n" +
                "  <farmerNm>지태용</farmerNm> \n" +
                "  <infoType>2</infoType> \n" +
                "  <regType>전산등록</regType> \n" +
                "  <regYmd>20130716</regYmd> \n" +
                "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "<farmNo>296064</farmNo>\n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <farmAddr>대구광역시 달성군 하빈면</farmAddr> \n" +
                "  <farmerNm>정미란</farmerNm> \n" +
                "  <infoType>2</infoType> \n" +
                "  <regType>양수</regType> \n" +
                "  <regYmd>20130812</regYmd> \n" +
                "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "<farmNo>296064</farmNo>\n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <farmAddr>경상북도 구미시 선산읍</farmAddr> \n" +
                "  <farmerNm>안승재</farmerNm> \n" +
                "  <infoType>2</infoType> \n" +
                "  <regType>양수</regType> \n" +
                "  <regYmd>20130926</regYmd> \n" +
                "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "<farmNo>344678</farmNo>\n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <farmAddr>경상북도 김천시 아포읍</farmAddr> \n" +
                "  <farmerNm>이병호</farmerNm> \n" +
                "  <infoType>2</infoType> \n" +
                "  <regType>양수</regType> \n" +
                "  <regYmd>20131204</regYmd> \n" +
                "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "<farmNo>209701</farmNo>\n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <farmAddr>경상북도 김천시 대항면</farmAddr> \n" +
                "  <farmerNm>금오산 낙농축협</farmerNm> \n" +
                "  <infoType>2</infoType> \n" +
                "  <regType>양수</regType> \n" +
                "  <regYmd>20140521</regYmd> \n" +
                "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "<farmNo>405972</farmNo>\n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <farmAddr>경상북도 김천시 대광동</farmAddr> \n" +
                "  <farmerNm>금오산낙협</farmerNm> \n" +
                "  <infoType>2</infoType> \n" +
                "  <regType>도축출하</regType> \n" +
                "  <regYmd>20150313</regYmd> \n" +
                "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "<farmNo>342267</farmNo>\n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경상북도 고령군 다산면 송곡리</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>농협고령축산물공판장경제지주주식회사</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <gradeNm>2</gradeNm> \n" +
                "  <infoType>3</infoType> \n" +
                "  <inspectPassYn>합격</inspectPassYn> \n" +
                "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <infoType>4</infoType> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <infoType>5</infoType> \n" +
                "  <injectionYmd>20140924</injectionYmd> \n" +
                "  <injectiondayCnt>170일전</injectiondayCnt> \n" +
                "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
                "  <vaccineorder>3차</vaccineorder> \n" +
                "  </item>\n" +
                "  </items>\n" +
                "  </body>\n" +
                "  </response>\n";
        String cattle_bundle_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
                "- <response>\n" +
                "- <header>\n" +
                "  <resultCode>00</resultCode> \n" +
                "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
                "  </header>\n" +
                "  <notice /> \n" +
                "- <body>\n" +
                "- <items>\n" +
                "- <item>\n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <infoType>8</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150311</butcheryYmd> \n" +
                "  <cattleNo>410002087626476</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002084140158</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>인천광역시 강화군 불은면 신현리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002077720791</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>인천광역시 강화군 불은면 신현리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002302548357</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002302548316</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경기도 안성시 일죽면 금산리 598번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>도드람LPC</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002083720936</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>경기도 이천시 호법면 동산리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002077526022</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>인천광역시 강화군 불은면 신현리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150311</butcheryYmd> \n" +
                "  <cattleNo>410002306309573</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150312</butcheryYmd> \n" +
                "  <cattleNo>410002305882953</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>충청남도 청양군 남양면 온암리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150311</butcheryYmd> \n" +
                "  <cattleNo>410002087626572</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150311</butcheryYmd> \n" +
                "  <cattleNo>410002087631859</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002083275501</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150313</butcheryYmd> \n" +
                "  <cattleNo>410002302432900</cattleNo> \n" +
                "  <corpNo>1348542668</corpNo> \n" +
                "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
                "  <gradeNm>3</gradeNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <lotNo>LOT150317238</lotNo> \n" +
                "  <lsTypeNm>육우</lsTypeNm> \n" +
                "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
                "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "  </items>\n" +
                "  </body>\n" +
                "  </response>\n";

        String pig_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
                "- <response>\n" +
                "- <header>\n" +
                "  <resultCode>00</resultCode> \n" +
                "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
                "  </header>\n" +
                "  <notice /> \n" +
                "- <body>\n" +
                "- <items>\n" +
                "- <item>\n" +
                "  <farmAddr>전라남도 화순군 능주면 남정리</farmAddr> \n" +
                "  <farmUniqueNo>601099</farmUniqueNo> \n" +
                "  <farmerNm>김재용</farmerNm> \n" +
                "  <infoType>1</infoType> \n" +
                "  <pigNo>160109900054</pigNo> \n" +
                "  <traceNoType>PIG|PIG_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>전라남도 화순군 화순읍 서태리 6번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>만나</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150731</butcheryYmd> \n" +
                "  <infoType>3</infoType> \n" +
                "  <inspectPassYn>Y</inspectPassYn> \n" +
                "  <pigNo>160109900054</pigNo> \n" +
                "  <traceNoType>PIG|PIG_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <infoType>4</infoType> \n" +
                "  <pigNo>160109900054</pigNo> \n" +
                "  <processPlaceAddr>전라남도 화순군 화순읍 서태리 6</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜만나</processPlaceNm> \n" +
                "  <processYmd>20150801</processYmd> \n" +
                "  <traceNoType>PIG|PIG_NO</traceNoType> \n" +
                "  </item>\n" +
                "  </items>\n" +
                "  </body>\n" +
                "  </response>\n";
        String pig_bundle_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
                "- <response>\n" +
                "- <header>\n" +
                "  <resultCode>00</resultCode> \n" +
                "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
                "  </header>\n" +
                "  <notice /> \n" +
                "- <body>\n" +
                "- <items>\n" +
                "- <item>\n" +
                "  <corpNo>6218176868</corpNo> \n" +
                "  <infoType>8</infoType> \n" +
                "  <lotNo>L11507319120001</lotNo> \n" +
                "  <processPlaceAddr>경상북도 영천시 도남동 695</processPlaceAddr> \n" +
                "  <processPlaceNm>㈜산청식품</processPlaceNm> \n" +
                "  <processYmd>20150731</processYmd> \n" +
                "  <traceNoType>PIG|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경상북도 영천시 도남동 695번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>(주)삼세</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150730</butcheryYmd> \n" +
                "  <corpNo>6218176868</corpNo> \n" +
                "  <farmAddr>경상북도 포항시 북구 청하면 명안리</farmAddr> \n" +
                "  <farmerNm>강충열</farmerNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <pigNo>170003000058</pigNo> \n" +
                "  <traceNoType>PIG|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "- <item>\n" +
                "  <butcheryPlaceAddr>경상북도 영천시 도남동 695번지</butcheryPlaceAddr> \n" +
                "  <butcheryPlaceNm>(주)삼세</butcheryPlaceNm> \n" +
                "  <butcheryYmd>20150730</butcheryYmd> \n" +
                "  <corpNo>6218176868</corpNo> \n" +
                "  <farmAddr>경상북도 영천시 대창면 대창리</farmAddr> \n" +
                "  <farmerNm>한치호</farmerNm> \n" +
                "  <infoType>9</infoType> \n" +
                "  <pigNo>170132400080</pigNo> \n" +
                "  <traceNoType>PIG|LOT_NO</traceNoType> \n" +
                "  </item>\n" +
                "  </items>\n" +
                "  </body>\n" +
                "  </response>\n";

        String fowl_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>\n" +
                "- <response>\n" +
                "- <header>\n" +
                "  <resultCode>00</resultCode>\n" +
                "  <resultMsg>NORMAL SERVICE.</resultMsg>\n" +
                "  </header>\n" +
                "  <notice />\n" +
                "- <body>\n" +
                "- <items>\n" +
                "- <item>\n" +
                "<brdngEnvrnNm>2(축사내 평사)</brdngEnvrnNm>\n" +
                "<farmAddr>전라북도 고창군 부안면</farmAddr>\n" +
                "<farmIdno>503317</farmIdno>\n" +
                "<histNo>5 200416 040 01</histNo>\n" +
                "  <infoType>1</infoType>\n" +
                "<lvindRgrfc>GGJJR</lvindRgrfc>\n" +
                "<mngrNm>정균석</mngrNm>\n" +
                "<traceNoType>DUCK|HIST_NO</traceNoType>\n" +
                "</item>\n" +
                "- <item>\n" +
                "<abattNm>(주)삼호유황오리</abattNm>\n" +
                "<add0R>전라북도 정읍시 고부면</add0R>\n" +
                "<histNo>5 200416 040 01</histNo>\n" +
                "  <infoType>2</infoType>\n" +
                "<psexmYn>합격</psexmYn>\n" +
                "<rceptDt>2020-04-16</rceptDt>\n" +
                "<traceNoType>DUCK|HIST_NO</traceNoType>\n" +
                "</item>\n" +
                "- <item>\n" +
                "<add0R>전라북도 정읍시 고부면</add0R>\n" +
                "<histNo>5 200416 040 01</histNo>\n" +
                "  <infoType>3</infoType>\n" +
                "<entrpNm>(주)삼호유황오리</entrpNm>\n" +
                "<traceNoType>DUCK|HIST_NO</traceNoType>\n" +
                "  </item>\n" +
                "</items>\n" +
                "  </body>\n" +
                "  </response>\n";
        String fowl_bundle_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
                "- <response>\n" +
                "- <header>\n" +
                "  <resultCode>00</resultCode>\n" +
                "  <resultMsg>NORMAL SERVICE.</resultMsg>\n" +
                "  </header>\n" +
                "  <notice /> \n" +
                "- <body>\n" +
                "- <items>\n" +
                "- <item>\n" +
                "<add0R>충청북도 음성군 금왕읍</add0R>\n" +
                "<entrpNm>농협목우촌</entrpNm>\n" +
                "<infoType>1</infoType>\n" +
                "<lotNo>L22004152182001</lotNo>\n" +
                "<traceNoType>FOWL|LOT_NO</traceNoType>\n" +
                "</item>\n" +
                "- <item>\n" +
                "<add0R>충청남도 당진시 송악읍</add0R>\n" +
                "<entrpNm>(주)한국육계유통(묶음)</entrpNm>\n" +
                "<lotNo>L22004152182001</lotNo>\n" +
                "  <infoType>2</infoType>\n" +
                "<traceNoType>FOWL|LOT_NO</traceNoType>\n" +
                "</item>\n" +
                "- <item>\n" +
                "<farmAddr>경상북도 봉화군 법전면</farmAddr>\n" +
                "<histNo>220041503401</histNo>\n" +
                "<infoType>3</infoType>\n" +
                "<lotNo>L22004152182001</lotNo>\n" +
                "<mngrNm>이윤재</mngrNm>\n" +
                "<traceNoType>FOWL|LOT_NO</traceNoType>\n" +
                "  </item>\n" +
                "</items>\n" +
                "  </body>\n" +
                "  </response>\n";

        String egg_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
                "- <response>\n" +
                "- <header>\n" +
                "  <resultCode>00</resultCode> \n" +
                "  <resultMsg>NORMAL SERVICE.</resultMsg>\n" +
                "  </header>\n" +
                "  <notice />\n" +
                "- <body>\n" +
                "- <items>\n" +
                "- <item>\n" +
                "  <brdngEnvrnNm>3(개선된 케이지,0.075㎡/마리)</brdngEnvrnNm>\n" +
                "<edygOvpstDt>2020-04-15</edygOvpstDt> \n" +
                "<farmIdno>900610</farmIdno>\n" +
                "<frmrNm>제주초록영농조합법인</frmrNm>\n" +
                "<histNo>3 0416 007 0002</histNo>\n" +
                "<infoType>4</infoType>\n" +
                "<issueDt>2020-04-16</issueDt>\n" +
                "<lvindRgrfc>WSZQ1</lvindRgrfc>\n" +
                "<reqerEntrpAddr>제주특별자치도 제주시 애월읍</reqerEntrpAddr>\n" +
                "<reqerEntrpNm>제주초록영농조합법인</reqerEntrpNm>\n" +
                "<successYn>합격</successYn>\n" +
                "<traceNoType>EGG|HIST_NO</traceNoType>\n" +
                "</item>\n" +
                "- <item>\n" +
                "<entrpAddr>제주특별자치도 제주시 애월읍</entrpAddr>\n" +
                "<entrpNm>제주웰빙영농조합법인</entrpNm>\n" +
                "<histNo>3 0416 007 0002</histNo>\n" +
                "<infoType>5</infoType>\n" +
                "<traceNoType>EGG|HIST_NO</traceNoType>\n" +
                "  </item>\n" +
                "</items>\n" +
                "  </body>\n" +
                "  </response>\n";

        String cattle_trace_result_json = XML.toJSONObject(cattle_trace_result_xml).toString(4);
        String cattle_bundle_result_json = XML.toJSONObject(cattle_bundle_result_xml).toString(4);
        String pig_trace_result_json = XML.toJSONObject(pig_trace_result_xml).toString(4);
        String pig_bundle_result_json = XML.toJSONObject(pig_bundle_result_xml).toString(4);
        String fowl_trace_result_json = XML.toJSONObject(fowl_trace_result_xml).toString(4);
        String fowl_bundle_result_json = XML.toJSONObject(fowl_bundle_result_xml).toString(4);
//        System.out.println(cattle_bundle_result_json);
//        System.out.println(pig_trace_result_json);
//        System.out.println(pig_bundle_result_json);
//        System.out.println(fowl_trace_result_json);
//        System.out.println(fowl_bundle_result_json);
        TraceResponse response = new Gson().fromJson(cattle_trace_result_json, TraceResponse.class).getResponse();
        if (response.getHeader().getResultCode().equals("00")) {
            TraceResponseBody body = response.getBody();
            if (body.getItems() != null && body.getItems().getItem() != null && !body.getItems().getItem().isEmpty()) {
                List<TraceData> dataList = body.getItems().getItem();
                TraceData id_data = dataList.get(0);
                TraceType type = getTraceType(id_data);
                switch (type.getTarget()) {
                    case "CATTLE":
                        System.out.println("type CATTLE, cattleNo : " + id_data.getCattleNo());
                        break;
                    case "PIG":
                        System.out.println("type PIG, pigNo : " + id_data.getPigNo());
                        break;
                    case "FOWL":
                        System.out.println("type FOWL, histNo : " + id_data.getHistNo());
                        break;
                    case "DUCK":
                        System.out.println("type DUCK, histNo : " + id_data.getHistNo());
                        break;
                    case "EGG":
                        System.out.println("type EGG, histNo : " + id_data.getHistNo());
                        break;
                    default:
                        break;
                }
                if (id_data.getInfoType() == 1) {
                    // 일반 이력
                    getTraceInfo(dataList);
                } else {
                    // 묶음 이력
                }

                /**
                 * 1~7 : 개체/이력 (TRACE), 8~9 : 묶음 (BUNDLE)
                 * 1 : 개체(소), 사육(돼지)
                 * 2 : 출생 등 신고(소)
                 * 3 : 도축(소/돼지)
                 * 4 : 포장(소/돼지)
                 * 5 : 구제역백신(소) -> No Use
                 * 6 : 질병정보(소) -> No Use
                 * 7 : 브루셀라(소) -> No Use
                 * 8 : 묶음 기본정보(묶음) (BUNDLE)
                 * 9 : 묶음구성내역(묶음) (BUNDLE_TRACE)
                 *
                 * TRACE 의 경우 -> TRACE_TYPE, INFO_TYPE에 맞춰 데이터 분류
                 * BUNDLE 의 경우 -> 해당 Bundle 에 포함되어 있는 Trace를 조회 후 데이터 분류 한 뒤, 해당 bundle에 trace 연결
                 *                -> 만약 DB에 등록되어 있는 Trace가 있는 경우 위 Bundle에 업데이트
                 *                => Trace 생성 함수, bundle 생성 함수, trace - bundle 연결 함수
                 * **/
            }
        }

    }

    private static TraceType getTraceType(TraceData traceData) {
        TraceType traceType;
        switch (traceData.getTraceNoType()) {
            case "CATTLE|CATTLE_NO":
                traceType = TraceType.CATTLE_TRACE;
                break;
            case "CATTLE|LOT_NO":
                traceType = TraceType.CATTLE_BUNDLE;
                break;
            case "PIG|PIG_NO":
                traceType = TraceType.PIG_TRACE;
                break;
            case "PIG|LOT_NO":
                traceType = TraceType.PIG_BUNDLE;
                break;
            case "FOWL|HIST_NO":
                traceType = TraceType.FOWL_TRACE;
                break;
            case "FOWL|LOT_NO":
                traceType = TraceType.FOWL_BUNDLE;
                break;
            case "DUCK|HIST_NO":
                traceType = TraceType.DUCK_TRACE;
                break;
            case "DUCK|LOT_NO":
                traceType = TraceType.DUCK_BUNDLE;
                break;
            case "EGG|HIST_NO":
                traceType = TraceType.EGG_TRACE;
                break;
            default:
                traceType = null;
                break;
        }
        return traceType;
    }

    private static Trace getTraceInfo(List<TraceData> traceDataList) {
        Trace trace = new Trace();
        TraceEntity entity = new TraceEntity();
        List<TraceBreed> breeds = new ArrayList<>();
        List<TraceButchery> butcheries = new ArrayList<>();
        List<TraceProcess> processes = new ArrayList<>();
        TraceData entityData = traceDataList.get(0);
        TraceType target_trace_type = getTraceType(entityData);
        if (target_trace_type == null) {
            return null;
        }
        for (EntityType entityType : EntityType.values()) {
            if (entityType.name().contains(target_trace_type.getTarget())) {
                entity.setEntity_type(entityType);
                break;
            }
        }
        if(target_trace_type.getTarget().equals("CATTLE")) {
            trace.setTrace_code(entityData.getCattleNo());
        } else if (target_trace_type.getTarget().equals("PIG")) {
            trace.setTrace_code(entityData.getPigNo());
        } else {
            trace.setTrace_code(entityData.getHistNo());
        }
        entity.setBirth(entityData.getBirthYmd());
        entity.setGender(entityData.getSexNm());
        entity.setRate(entityData.getGradeNm());
        trace.setEntity(entity);

        for (TraceData traceData : traceDataList) {
            int info_type = traceData.getInfoType();
            if (info_type > 4) {
                break;
            } else if (info_type != 1) {
                if (info_type == 2) {
                    // 사육 정보
                    TraceBreed breed = new TraceBreed();
                    // TODO 사육 정보 Model SET
                    breed.setType(BreedType.getBreedType(traceData.getRegType()));
                    breed.setBreed_issue_date(traceData.getRegYmd());
//                    breed.setBreed_farm_name();
                    breeds.add(breed);
                } else if (info_type == 3) {
                    // 도축 정보
                    TraceButchery butchery = new TraceButchery();
                    // TODO 도축 정보 MODEL SET
                    butcheries.add(butchery);
                } else if (info_type == 4) {
                    // 가공 및 포장 정보
                    TraceProcess process = new TraceProcess();
                    // TODO 도축 정보 MODEL SET
                    processes.add(process);
                }
            }
        }

        trace.setBreed(breeds);
        trace.setButchery(butcheries);
        trace.setProcess(processes);
        return trace;
    }

    /**
     * 1. 이력번호
     * 2. 개체 정보
     * 3. 사육 정보
     * 4. 도축 정보
     * 5. 가공 정보
     * **/

}
