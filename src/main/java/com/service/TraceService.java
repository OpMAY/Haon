package com.service;

import com.api.trace.TraceApi;
import com.api.trace.response.*;
import com.dao.BundleDao;
import com.dao.BundleTracesDao;
import com.dao.FarmDao;
import com.dao.TraceDao;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.model.farm.Farm;
import com.model.farm.trace.*;
import com.response.Message;
import com.util.TraceCodeGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.XML;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class TraceService {
    private final FarmDao farmDao;
    private final TraceDao traceDao;
    private final BundleDao bundleDao;
    private final BundleTracesDao bundleTracesDao;

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

    public List<Trace> getFarmTraces(int user_no) {
        Farm farm = farmDao.getFarmByUserNo(user_no);
        return traceDao.getFarmTraces(farm.getNo());
    }

    @Transactional
    public Message registerTrace(Trace trace, int user_no) {
        Message message = new Message();
        Farm farm = farmDao.getFarmByUserNo(user_no);
        if (farm != null) {
            if (trace.getTrace_code() != null) {
                if (traceDao.isCodeExists(trace.getTrace_code())) {
                    message.put("status", false);
                } else {
                    message.put("status", true);
                    trace.setFarm_no(farm.getNo());
                    traceDao.registerTrace(trace);
                }
            } else {
                // TODO Trace Code Generate
                // VALID ONLY FOR RABBIT, HORSE, SHEEP, GOAT
                trace.setFarm_no(farm.getNo());
                String code = TraceCodeGenerator.makeTraceCode(trace);
                if (code != null) {
                    trace.setTrace_code(code);
                    traceDao.registerTrace(trace);
                    message.put("status", true);
                } else {
                    message.put("status", false);
                }
            }
        }
        return message;
    }

    public Message isCodeValid(String code, int user_no) {
        Farm farm = farmDao.getFarmByUserNo(user_no);
        Message message = new Message();
        if (traceDao.isCodeExists(code)) {
            // 코드 이미 존재?
            message.put("status", false);
            message.put("type", 1);
        } else {
            if (Character.isDigit(code.charAt(0))) {
                // 묶음인지 아닌지?
                TraceResponse response;
                try {
                    response = TraceApi.apiRequest(code).getResponse();
                } catch (JsonSyntaxException e) {
                    message.put("status", false);
                    message.put("type", -1);
                    response = null;
                }
                if (response != null) {
                    if (response.getHeader().getResultCode().equals("00")) {
                        // CHECK SAME TYPE
                        Trace trace = getTraceInfo(response.getBody().getItems().getItem(), code);
                        if(trace.getEntity().getEntity_type().name().equals(farm.getType().getCode())) {
                            if(trace.getEntity().getEntity_type().equals(EntityType.PIG)) {
                                message.put("address", response.getBody().getItems().getItem().get(0).getFarmAddr());
                            } else if (trace.getEntity().getEntity_type().equals(EntityType.CATTLE)) {
                                String address = "";
                                String farmNo = response.getBody().getItems().getItem().get(0).getFarmNo();
                                for(TraceData traceData : response.getBody().getItems().getItem()) {
                                    if(traceData.getInfoType() == 2 && traceData.getFarmNo().equals(farmNo)) {
                                        address = traceData.getFarmAddr();
                                        break;
                                    }
                                }
                                message.put("address", address);
                            } else if (trace.getEntity().getEntity_type().equals(EntityType.FOWL) || trace.getEntity().getEntity_type().equals(EntityType.DUCK)) {
                                String address = "";
                                for(TraceData traceData : response.getBody().getItems().getItem()) {
                                    if(traceData.getInfoType() == 1 && traceData.getFarmAddr() != null) {
                                        address = traceData.getFarmAddr();
                                        break;
                                    }
                                }
                                message.put("address", address);
                            }
                            message.put("status", true);
                            message.put("data", trace);
                        } else {
                            message.put("status", false);
                            message.put("type", 2);
                        }
                        // return status false, type = bundle
//                    message.put("data", getBundleInfo(response.getBody().getItems().getItem()));
//                    message.put("address", response.getBody().getItems().getItem().get(1).getButcheryPlaceAddr());
                    } else {
                        message.put("status", false);
                        message.put("type", -1);
                    }
                }
            } else {
                message.put("status", false);
                message.put("type", 0);
            }
        }
        return message;
    }

    public void requestInfo(String code) {
        TraceResponse response = null;
        try {
            response = TraceApi.apiRequest(code).getResponse();
        } catch (JsonSyntaxException e) {
            log.info("해당 번호 없음");
        }
        if (response != null && response.getHeader().getResultCode().equals("00")) {
            TraceResponseBody body = response.getBody();
            if (body.getItems() != null && body.getItems().getItem() != null && !body.getItems().getItem().isEmpty()) {
                List<TraceData> dataList = body.getItems().getItem();
                TraceData id_data = dataList.get(0);
                TraceType type = getTraceType(id_data);
                if (type.isBundle()) {
                    // 묶음 이력
                    Bundle bundle = getBundleInfo(dataList, code);
                    log.info("bundle : " + bundle);
                } else {
                    // 일반 이력
                    Trace trace = getTraceInfo(dataList, code);
                    log.info("trace : " + trace);
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
        } else {
            if (response != null) {
                log.info("API 호출 오류 : {}", response.getHeader().getResultCode());
            }
        }
    }

    private Bundle getBundleInfo(List<TraceData> traceDataList, String code) {
        Bundle bundle = new Bundle();
        List<Trace> traceList = new ArrayList<>();
        TraceType type = getTraceType(traceDataList.get(0));
        for (TraceData traceData : traceDataList) {
            if ((type.getTarget().equals("CATTLE") || type.getTarget().equals("PIG")) && traceData.getInfoType() == 8
                    || (type.getTarget().equals("FOWL") || type.getTarget().equals("DUCK")) && traceData.getInfoType() == 1) {
                bundle.setBundle_code(traceData.getLotNo());
                bundle.setBundle_owner_addr(traceData.getProcessPlaceAddr());
                bundle.setBundle_owner_name(traceData.getProcessPlaceNm());
            } else if ((type.getTarget().equals("CATTLE") || type.getTarget().equals("PIG")) && traceData.getInfoType() == 9
                    || (type.getTarget().equals("FOWL") || type.getTarget().equals("DUCK")) && traceData.getInfoType() == 3) {
                //                switch (type.getTarget()) {
//                    case "CATTLE":
//                        trace_code = traceData.getCattleNo();
//                        break;
//                    case "PIG":
//                        trace_code = traceData.getPigNo();
//                        break;
//                    case "FOWL":
//                    case "DUCK":
//                        trace_code = traceData.getHistNo();
//                        break;
//                    default:
//                        break;
//                }
                try {
                    TraceResponse response = TraceApi.apiRequest(code).getResponse();
                    log.info("{}", response);
                    String resultCode = response.getHeader().getResultCode();
                    if (resultCode.equals("00")) {
                        TraceResponseBody body = response.getBody();
                        if (body.getItems() != null && body.getItems().getItem() != null && !body.getItems().getItem().isEmpty()) {
                            Trace trace = getTraceInfo(body.getItems().getItem(), code);
                            traceList.add(trace);
                        }
                    } else {
                        System.out.println("API 통신 오류 : " + resultCode);
                    }
                } catch (JsonSyntaxException e) {
                    log.info("Match 데이터 없음");
                }
            }
        }

        bundle.setTraceList(traceList);
        return bundle;
    }

    private Trace getTraceInfo(List<TraceData> traceDataList, String code) {
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
        trace.setTrace_code(code);
        entity.setBirth(entityData.getBirthYmd());
        entity.setGender(entityData.getSexNm());
        entity.setRate(entityData.getGradeNm());
        trace.setEntity(entity);

        // 돼지 OR 소
        if (target_trace_type.getTarget().equals("CATTLE") || target_trace_type.getTarget().equals("PIG")) {
            for (TraceData traceData : traceDataList) {
                int info_type = traceData.getInfoType();
                if (info_type > 4) {
                    break;
                } else if (info_type != 1) {
                    if (info_type == 2) {
                        // 사육 정보
                        TraceBreed breed = new TraceBreed();
                        breed.setType(BreedType.getBreedType(traceData.getRegType()));
                        breed.setBreed_issue_date(traceData.getRegYmd());
                        /** TODO API 에선 농장의 이름을 제공해주지 않는 대신, 농장 고유 번호를 제공하거나, 농장주 이름을 제공
                         농장주 이름이 사람 이름일 수도 있고, 회사 이름일 수도 있음
                         1. 농장 번호로 농장 이름 검색 API?
                         2. 기본적으로 농장을 등록할 때 농장 번호를 입력?

                         회원 가입 시 농장 식별 번호 입력 후
                         -> DB에 있으면 연결
                         -> 없으면 연결 X
                         **/
//                    breed.setBreed_farm_name();
                        breed.setBreed_farmer_name(traceData.getFarmerNm());
                        breed.setBreed_farm_addr(traceData.getFarmAddr());
                        breeds.add(breed);
                    } else if (info_type == 3) {
                        // 도축 정보
                        TraceButchery butchery = new TraceButchery();
                        butchery.setButchery_result(traceData.getInspectPassYn());
                        butchery.setButchery_corp(traceData.getButcheryPlaceNm());
                        butchery.setButchery_addr(traceData.getButcheryPlaceAddr());
                        butchery.setButchery_date(traceData.getButcheryYmd());
                        butcheries.add(butchery);
                    } else if (info_type == 4) {
                        // 가공 및 포장 정보
                        TraceProcess process = new TraceProcess();
                        process.setProcess_date(traceData.getProcessYmd());
                        process.setProcess_addr(traceData.getProcessPlaceAddr());
                        process.setProcess_corp(traceData.getProcessPlaceNm());
                        processes.add(process);
                    }
                }
            }
        } else if (target_trace_type.getTarget().equals("FOWL") || target_trace_type.getTarget().equals("DUCK")) {
            // 닭 or 오리 => info_type => 1 : 사육 정보, 2 : 도축 정보, 3 : 식육포장처리정보 => process
            List<String> processCompanyNames = new ArrayList<>();
            for (TraceData traceData : traceDataList) {
                int info_type = traceData.getInfoType();
                if (info_type == 1) {
                    TraceBreed breed = new TraceBreed();
                    breed.setBreed_farmer_name(traceData.getFarmerNm());
                    breed.setType(BreedType.REGISTER);
                    breed.setBreed_farm_addr(traceData.getFarmAddr());
                    breeds.add(breed);
                } else if (info_type == 2) {
                    TraceButchery butchery = new TraceButchery();
                    butchery.setButchery_result(traceData.getPsexmYn());
                    butchery.setButchery_addr(traceData.getButcheryPlaceAddr());
                    butchery.setButchery_corp(traceData.getButcheryPlaceNm());
                    butchery.setButchery_date(traceData.getButcheryYmd());
                    butcheries.add(butchery);
                } else if (info_type == 3) {
                    if(!processCompanyNames.contains(traceData.getEntrpNm()) && processCompanyNames.size() <= 10) {
                        TraceProcess process = new TraceProcess();
                        process.setProcess_corp(traceData.getEntrpNm());
                        process.setProcess_addr(traceData.getEntrpAddr());
                        // PROCESS DATE 없음
                        processes.add(process);
                        processCompanyNames.add(traceData.getEntrpNm());
                    }
                }
            }
        } else {
            // 계란, info_type => 4: 선별 포장 처리, 5 : 수집 판매정보
            // 달갈 농장은 데이터 형식 자체가 다름 => 어떻게 할지? => 제거 2022-09-15
//            for (TraceData traceData : traceDataList) {
//                int info_type = traceData.getInfoType();
//                if (info_type == 4) {
//                    /**
//                     * 선별 포장 처리 제공 데이터
//                     * - 사육 환경
//                     * - 식용란 산란 일자
//                     * - 농장 식별 번호
//                     * - 농장 이름
//                     * - 발급 일자
//                     * - 축산업 등록 번호
//                     * - 신청인 업체명
//                     * - 신청인 업체 주소
//                     * - 선별 검사 결과
//                     */
//                    if (traceData.getSuccessYn().equals("합격")) {
//
//                    }
//
//
//                } else if (info_type == 5) {
//                    /**
//                     * 수집 판매 정보 제공 데이터
//                     * - 업체 주소
//                     * - 업체 명
//                     */
//                }
//            }
        }
        trace.setBreed(breeds);
        trace.setButchery(butcheries);
        trace.setProcess(processes);
        return trace;
    }

    private TraceType getTraceType(TraceData traceData) {
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

    public List<Bundle> getFarmBundles(int user_no) {
        Farm farm = farmDao.getFarmByUserNo(user_no);
        List<Bundle> bundles = bundleDao.getFarmBundles(farm.getNo());
        for(Bundle bundle : bundles) {
            List<Trace> traces = bundleTracesDao.getBundleTraces(bundle.getNo());
            bundle.setTraceList(traces);
        }
        return bundles;
    }

    @Transactional
    public void deleteTrace(int no) {
        traceDao.deleteTrace(no);
    }

    public Message getTraceModalData(int no) {
        Message message = new Message();
        Trace trace = traceDao.getTraceByNo(no);
        message.put("trace", trace);
        return message;
    }


    /**
     * 1. 이력번호
     * 2. 개체 정보
     * 3. 사육 정보
     * 4. 도축 정보
     * 5. 가공 정보
     * **/

}

//
//
//    String cattle_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
//            "- <response>\n" +
//            "- <header>\n" +
//            "  <resultCode>00</resultCode> \n" +
//            "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
//            "  </header>\n" +
//            "  <notice /> \n" +
//            "- <body>\n" +
//            "- <items>\n" +
//            "- <item>\n" +
//            "  <birthYmd>20130712</birthYmd> \n" +
//            "  <cattleNo>410002086431813</cattleNo> \n" +
//            "  <infoType>1</infoType> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <monthDiff>0</monthDiff> \n" +
//            "  <sexNm>거세</sexNm> \n" +
//            "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "<farmUniqueNo>CATTLE|CATTLE_NO</farmUniqueNo> \n" +
//            "<farmNo>342267</farmNo>\n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <farmAddr>경상북도 의성군 구천면</farmAddr> \n" +
//            "  <farmerNm>지태용</farmerNm> \n" +
//            "  <infoType>2</infoType> \n" +
//            "  <regType>전산등록</regType> \n" +
//            "  <regYmd>20130716</regYmd> \n" +
//            "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "<farmNo>296064</farmNo>\n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <farmAddr>대구광역시 달성군 하빈면</farmAddr> \n" +
//            "  <farmerNm>정미란</farmerNm> \n" +
//            "  <infoType>2</infoType> \n" +
//            "  <regType>양수</regType> \n" +
//            "  <regYmd>20130812</regYmd> \n" +
//            "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "<farmNo>296064</farmNo>\n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <farmAddr>경상북도 구미시 선산읍</farmAddr> \n" +
//            "  <farmerNm>안승재</farmerNm> \n" +
//            "  <infoType>2</infoType> \n" +
//            "  <regType>양수</regType> \n" +
//            "  <regYmd>20130926</regYmd> \n" +
//            "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "<farmNo>344678</farmNo>\n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <farmAddr>경상북도 김천시 아포읍</farmAddr> \n" +
//            "  <farmerNm>이병호</farmerNm> \n" +
//            "  <infoType>2</infoType> \n" +
//            "  <regType>양수</regType> \n" +
//            "  <regYmd>20131204</regYmd> \n" +
//            "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "<farmNo>209701</farmNo>\n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <farmAddr>경상북도 김천시 대항면</farmAddr> \n" +
//            "  <farmerNm>금오산 낙농축협</farmerNm> \n" +
//            "  <infoType>2</infoType> \n" +
//            "  <regType>양수</regType> \n" +
//            "  <regYmd>20140521</regYmd> \n" +
//            "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "<farmNo>405972</farmNo>\n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <farmAddr>경상북도 김천시 대광동</farmAddr> \n" +
//            "  <farmerNm>금오산낙협</farmerNm> \n" +
//            "  <infoType>2</infoType> \n" +
//            "  <regType>도축출하</regType> \n" +
//            "  <regYmd>20150313</regYmd> \n" +
//            "<traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "<farmNo>342267</farmNo>\n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경상북도 고령군 다산면 송곡리</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>농협고령축산물공판장경제지주주식회사</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <gradeNm>2</gradeNm> \n" +
//            "  <infoType>3</infoType> \n" +
//            "  <inspectPassYn>합격</inspectPassYn> \n" +
//            "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <infoType>4</infoType> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <infoType>5</infoType> \n" +
//            "  <injectionYmd>20140924</injectionYmd> \n" +
//            "  <injectiondayCnt>170일전</injectiondayCnt> \n" +
//            "  <traceNoType>CATTLE|CATTLE_NO</traceNoType> \n" +
//            "  <vaccineorder>3차</vaccineorder> \n" +
//            "  </item>\n" +
//            "  </items>\n" +
//            "  </body>\n" +
//            "  </response>\n";
//    String cattle_bundle_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
//            "- <response>\n" +
//            "- <header>\n" +
//            "  <resultCode>00</resultCode> \n" +
//            "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
//            "  </header>\n" +
//            "  <notice /> \n" +
//            "- <body>\n" +
//            "- <items>\n" +
//            "- <item>\n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <infoType>8</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150311</butcheryYmd> \n" +
//            "  <cattleNo>410002087626476</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002084140158</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>인천광역시 강화군 불은면 신현리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002077720791</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>인천광역시 강화군 불은면 신현리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002302548357</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002302548316</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경기도 안성시 일죽면 금산리 598번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>도드람LPC</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002083720936</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>경기도 이천시 호법면 동산리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002077526022</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>인천광역시 강화군 불은면 신현리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150311</butcheryYmd> \n" +
//            "  <cattleNo>410002306309573</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150312</butcheryYmd> \n" +
//            "  <cattleNo>410002305882953</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>충청남도 청양군 남양면 온암리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150311</butcheryYmd> \n" +
//            "  <cattleNo>410002087626572</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경기도 부천시 오정구 삼정동 12-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>농협경제지주주식회사 부천축산물공판장</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150311</butcheryYmd> \n" +
//            "  <cattleNo>410002087631859</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>충청남도 서산시 고북면 신상리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002083275501</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>인천광역시 서구 가좌동 477-4번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>삼성식품</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150313</butcheryYmd> \n" +
//            "  <cattleNo>410002302432900</cattleNo> \n" +
//            "  <corpNo>1348542668</corpNo> \n" +
//            "  <farmAddr>강원도 철원군 갈말읍 군탄리</farmAddr> \n" +
//            "  <gradeNm>3</gradeNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <lotNo>LOT150317238</lotNo> \n" +
//            "  <lsTypeNm>육우</lsTypeNm> \n" +
//            "  <processPlaceAddr>서울특별시 송파구 가락1동 가락농수산물시장 내 대체매장 지하1층</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜농협목우촌한육우사업소</processPlaceNm> \n" +
//            "  <traceNoType>CATTLE|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "  </items>\n" +
//            "  </body>\n" +
//            "  </response>\n";
//
//    String pig_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
//            "- <response>\n" +
//            "- <header>\n" +
//            "  <resultCode>00</resultCode> \n" +
//            "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
//            "  </header>\n" +
//            "  <notice /> \n" +
//            "- <body>\n" +
//            "- <items>\n" +
//            "- <item>\n" +
//            "  <farmAddr>전라남도 화순군 능주면 남정리</farmAddr> \n" +
//            "  <farmUniqueNo>601099</farmUniqueNo> \n" +
//            "  <farmerNm>김재용</farmerNm> \n" +
//            "  <infoType>1</infoType> \n" +
//            "  <pigNo>160109900054</pigNo> \n" +
//            "  <traceNoType>PIG|PIG_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>전라남도 화순군 화순읍 서태리 6번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>만나</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150731</butcheryYmd> \n" +
//            "  <infoType>3</infoType> \n" +
//            "  <inspectPassYn>Y</inspectPassYn> \n" +
//            "  <pigNo>160109900054</pigNo> \n" +
//            "  <traceNoType>PIG|PIG_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <infoType>4</infoType> \n" +
//            "  <pigNo>160109900054</pigNo> \n" +
//            "  <processPlaceAddr>전라남도 화순군 화순읍 서태리 6</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜만나</processPlaceNm> \n" +
//            "  <processYmd>20150801</processYmd> \n" +
//            "  <traceNoType>PIG|PIG_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "  </items>\n" +
//            "  </body>\n" +
//            "  </response>\n";
//    String pig_bundle_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
//            "- <response>\n" +
//            "- <header>\n" +
//            "  <resultCode>00</resultCode> \n" +
//            "  <resultMsg>NORMAL SERVICE.</resultMsg> \n" +
//            "  </header>\n" +
//            "  <notice /> \n" +
//            "- <body>\n" +
//            "- <items>\n" +
//            "- <item>\n" +
//            "  <corpNo>6218176868</corpNo> \n" +
//            "  <infoType>8</infoType> \n" +
//            "  <lotNo>L11507319120001</lotNo> \n" +
//            "  <processPlaceAddr>경상북도 영천시 도남동 695</processPlaceAddr> \n" +
//            "  <processPlaceNm>㈜산청식품</processPlaceNm> \n" +
//            "  <processYmd>20150731</processYmd> \n" +
//            "  <traceNoType>PIG|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경상북도 영천시 도남동 695번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>(주)삼세</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150730</butcheryYmd> \n" +
//            "  <corpNo>6218176868</corpNo> \n" +
//            "  <farmAddr>경상북도 포항시 북구 청하면 명안리</farmAddr> \n" +
//            "  <farmerNm>강충열</farmerNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <pigNo>170003000058</pigNo> \n" +
//            "  <traceNoType>PIG|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "- <item>\n" +
//            "  <butcheryPlaceAddr>경상북도 영천시 도남동 695번지</butcheryPlaceAddr> \n" +
//            "  <butcheryPlaceNm>(주)삼세</butcheryPlaceNm> \n" +
//            "  <butcheryYmd>20150730</butcheryYmd> \n" +
//            "  <corpNo>6218176868</corpNo> \n" +
//            "  <farmAddr>경상북도 영천시 대창면 대창리</farmAddr> \n" +
//            "  <farmerNm>한치호</farmerNm> \n" +
//            "  <infoType>9</infoType> \n" +
//            "  <pigNo>170132400080</pigNo> \n" +
//            "  <traceNoType>PIG|LOT_NO</traceNoType> \n" +
//            "  </item>\n" +
//            "  </items>\n" +
//            "  </body>\n" +
//            "  </response>\n";
//
//    String fowl_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>\n" +
//            "- <response>\n" +
//            "- <header>\n" +
//            "  <resultCode>00</resultCode>\n" +
//            "  <resultMsg>NORMAL SERVICE.</resultMsg>\n" +
//            "  </header>\n" +
//            "  <notice />\n" +
//            "- <body>\n" +
//            "- <items>\n" +
//            "- <item>\n" +
//            "<brdngEnvrnNm>2(축사내 평사)</brdngEnvrnNm>\n" +
//            "<farmAddr>전라북도 고창군 부안면</farmAddr>\n" +
//            "<farmIdno>503317</farmIdno>\n" +
//            "<histNo>5 200416 040 01</histNo>\n" +
//            "  <infoType>1</infoType>\n" +
//            "<lvindRgrfc>GGJJR</lvindRgrfc>\n" +
//            "<mngrNm>정균석</mngrNm>\n" +
//            "<traceNoType>DUCK|HIST_NO</traceNoType>\n" +
//            "</item>\n" +
//            "- <item>\n" +
//            "<abattNm>(주)삼호유황오리</abattNm>\n" +
//            "<add0R>전라북도 정읍시 고부면</add0R>\n" +
//            "<histNo>5 200416 040 01</histNo>\n" +
//            "  <infoType>2</infoType>\n" +
//            "<psexmYn>합격</psexmYn>\n" +
//            "<rceptDt>2020-04-16</rceptDt>\n" +
//            "<traceNoType>DUCK|HIST_NO</traceNoType>\n" +
//            "</item>\n" +
//            "- <item>\n" +
//            "<add0R>전라북도 정읍시 고부면</add0R>\n" +
//            "<histNo>5 200416 040 01</histNo>\n" +
//            "  <infoType>3</infoType>\n" +
//            "<entrpNm>(주)삼호유황오리</entrpNm>\n" +
//            "<traceNoType>DUCK|HIST_NO</traceNoType>\n" +
//            "  </item>\n" +
//            "</items>\n" +
//            "  </body>\n" +
//            "  </response>\n";
//    String fowl_bundle_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
//            "- <response>\n" +
//            "- <header>\n" +
//            "  <resultCode>00</resultCode>\n" +
//            "  <resultMsg>NORMAL SERVICE.</resultMsg>\n" +
//            "  </header>\n" +
//            "  <notice /> \n" +
//            "- <body>\n" +
//            "- <items>\n" +
//            "- <item>\n" +
//            "<add0R>충청북도 음성군 금왕읍</add0R>\n" +
//            "<entrpNm>농협목우촌</entrpNm>\n" +
//            "<infoType>1</infoType>\n" +
//            "<lotNo>L22004152182001</lotNo>\n" +
//            "<traceNoType>FOWL|LOT_NO</traceNoType>\n" +
//            "</item>\n" +
//            "- <item>\n" +
//            "<add0R>충청남도 당진시 송악읍</add0R>\n" +
//            "<entrpNm>(주)한국육계유통(묶음)</entrpNm>\n" +
//            "<lotNo>L22004152182001</lotNo>\n" +
//            "  <infoType>2</infoType>\n" +
//            "<traceNoType>FOWL|LOT_NO</traceNoType>\n" +
//            "</item>\n" +
//            "- <item>\n" +
//            "<farmAddr>경상북도 봉화군 법전면</farmAddr>\n" +
//            "<histNo>220041503401</histNo>\n" +
//            "<infoType>3</infoType>\n" +
//            "<lotNo>L22004152182001</lotNo>\n" +
//            "<mngrNm>이윤재</mngrNm>\n" +
//            "<traceNoType>FOWL|LOT_NO</traceNoType>\n" +
//            "  </item>\n" +
//            "</items>\n" +
//            "  </body>\n" +
//            "  </response>\n";
//
//    String egg_trace_result_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?> \n" +
//            "- <response>\n" +
//            "- <header>\n" +
//            "  <resultCode>00</resultCode> \n" +
//            "  <resultMsg>NORMAL SERVICE.</resultMsg>\n" +
//            "  </header>\n" +
//            "  <notice />\n" +
//            "- <body>\n" +
//            "- <items>\n" +
//            "- <item>\n" +
//            "  <brdngEnvrnNm>3(개선된 케이지,0.075㎡/마리)</brdngEnvrnNm>\n" +
//            "<edygOvpstDt>2020-04-15</edygOvpstDt> \n" +
//            "<farmIdno>900610</farmIdno>\n" +
//            "<frmrNm>제주초록영농조합법인</frmrNm>\n" +
//            "<histNo>3 0416 007 0002</histNo>\n" +
//            "<infoType>4</infoType>\n" +
//            "<issueDt>2020-04-16</issueDt>\n" +
//            "<lvindRgrfc>WSZQ1</lvindRgrfc>\n" +
//            "<reqerEntrpAddr>제주특별자치도 제주시 애월읍</reqerEntrpAddr>\n" +
//            "<reqerEntrpNm>제주초록영농조합법인</reqerEntrpNm>\n" +
//            "<successYn>합격</successYn>\n" +
//            "<traceNoType>EGG|HIST_NO</traceNoType>\n" +
//            "</item>\n" +
//            "- <item>\n" +
//            "<entrpAddr>제주특별자치도 제주시 애월읍</entrpAddr>\n" +
//            "<entrpNm>제주웰빙영농조합법인</entrpNm>\n" +
//            "<histNo>3 0416 007 0002</histNo>\n" +
//            "<infoType>5</infoType>\n" +
//            "<traceNoType>EGG|HIST_NO</traceNoType>\n" +
//            "  </item>\n" +
//            "</items>\n" +
//            "  </body>\n" +
//            "  </response>\n";
//
//    String cattle_trace_result_json = XML.toJSONObject(cattle_trace_result_xml).toString(4);
//    String cattle_bundle_result_json = XML.toJSONObject(cattle_bundle_result_xml).toString(4);
//    String pig_trace_result_json = XML.toJSONObject(pig_trace_result_xml).toString(4);
//    String pig_bundle_result_json = XML.toJSONObject(pig_bundle_result_xml).toString(4);
//    String fowl_trace_result_json = XML.toJSONObject(fowl_trace_result_xml).toString(4);
//    String fowl_bundle_result_json = XML.toJSONObject(fowl_bundle_result_xml).toString(4);
////        System.out.println(cattle_trace_result_json);
////        System.out.println(cattle_bundle_result_json);
////        System.out.println(pig_trace_result_json);
//        System.out.println(pig_bundle_result_json);
////        System.out.println(fowl_trace_result_json);
////        System.out.println(fowl_bundle_result_json);
//                TraceResponse response = new Gson().fromJson(fowl_trace_result_json, TraceResponse.class).getResponse();