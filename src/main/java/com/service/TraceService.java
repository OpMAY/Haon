package com.service;

import com.api.trace.TraceApi;
import com.api.trace.response.*;
import com.dao.*;
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

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Slf4j
@Service
@RequiredArgsConstructor
public class TraceService {
    private final UserDao userDao;
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

    @Transactional
    public Message editTrace(Trace trace, int user_no, boolean isAdmin) {
        Message message = new Message();
        if (isAdmin) {
            log.info("trace : {}", trace);
            Farm farm = farmDao.getFarmByFarmNo(trace.getFarm_no());
            if (farm == null) {
                message.put("status", false);
            } else {
                traceDao.editTrace(trace);
                message.put("status", true);
            }
        } else {
            Farm farm = farmDao.getFarmByUserNo(user_no);
            if (farm != null) {
                if (trace.getFarm_no() != farm.getNo()) {
                    message.put("status", false);
                    message.put("type", 401);
                } else {
                    if (!farm.getType().isManual_available()) {
                        message.put("status", false);
                        message.put("type", 400);
                    } else {
                        traceDao.editTrace(trace);
                        message.put("status", true);
                    }
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
                        if (trace.getEntity().getEntity_type().name().equals(farm.getType().getCode())) {
                            if (trace.getEntity().getEntity_type().equals(EntityType.PIG)) {
                                message.put("address", response.getBody().getItems().getItem().get(0).getFarmAddr());
                            } else if (trace.getEntity().getEntity_type().equals(EntityType.CATTLE)) {
                                String address = "";
                                String farmNo = response.getBody().getItems().getItem().get(0).getFarmNo();
                                for (TraceData traceData : response.getBody().getItems().getItem()) {
                                    if (traceData.getInfoType() == 2 && traceData.getFarmNo().equals(farmNo)) {
                                        address = traceData.getFarmAddr();
                                        break;
                                    }
                                }
                                message.put("address", address);
                            } else if (trace.getEntity().getEntity_type().equals(EntityType.FOWL) || trace.getEntity().getEntity_type().equals(EntityType.DUCK)) {
                                String address = "";
                                for (TraceData traceData : response.getBody().getItems().getItem()) {
                                    if (traceData.getInfoType() == 1 && traceData.getFarmAddr() != null) {
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
                try {
                    String traceCode;
                    if (type.getTarget().equals("CATTLE")) {
                        traceCode = traceData.getCattleNo();
                    } else if (type.getTarget().equals("PIG")) {
                        traceCode = traceData.getPigNo();
                    } else {
                        traceCode = traceData.getLotNo();
                    }
                    TraceResponse response = TraceApi.apiRequest(traceCode).getResponse();
                    log.info("{}", response);
                    String resultCode = response.getHeader().getResultCode();
                    if (resultCode.equals("00")) {
                        TraceResponseBody body = response.getBody();
                        if (body.getItems() != null && body.getItems().getItem() != null && !body.getItems().getItem().isEmpty()) {
                            Trace trace = getTraceInfo(body.getItems().getItem(), traceCode);
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

        if (target_trace_type.getTarget().equals("PIG")) {
            // 돼지는 사육 농장 정보가 InfoType 1에 들어감 (사육정보 or 등록 정보로 추정)
            TraceBreed breed = new TraceBreed();
            breed.setType(BreedType.REGISTER);
            breed.setBreed_farm_addr(entityData.getFarmAddr());
            breed.setBreed_farmer_name(entityData.getFarmerNm());
            breeds.add(breed);
        }

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
                        butchery.setButchery_rate(entityData.getGradeNm());
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
                    if (!processCompanyNames.contains(traceData.getEntrpNm()) && processCompanyNames.size() <= 10) {
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
        for (Bundle bundle : bundles) {
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

    public Message getTraceByCode(String code, int user_no) {
        Message message = new Message();
        Trace trace = traceDao.getTraceByCode(code);
        Farm farm = farmDao.getFarmByUserNo(user_no);
        if (trace != null) {
            if (farm != null && trace.getFarm_no() != farm.getNo()) {
                message.put("status", -1);
            } else if (bundleTracesDao.checkTraceHasBundle(trace.getNo())) {
                message.put("status", -2);
                message.put("data", trace);
            } else {
                message.put("data", trace);
                message.put("status", 0);
            }
        } else {
            message.put("status", -3);
        }
        return message;
    }

    public Message getPublicBundleCode(String bundle_code, int user_no) {
        Farm farm = farmDao.getFarmByUserNo(user_no);
        Message message = new Message();
        if (bundleDao.isCodeExists(bundle_code)) {
            // 코드 이미 존재?
            message.put("status", false);
            message.put("type", 1);
        } else {
            if (bundle_code.startsWith("L")) {
                TraceResponse response;
                try {
                    response = TraceApi.apiRequest(bundle_code).getResponse();
                } catch (JsonSyntaxException e) {
                    message.put("status", false);
                    message.put("type", -1);
                    response = null;
                }
                if (response != null) {
                    if (response.getHeader().getResultCode().equals("00")) {
                        // CHECK SAME TYPE
                        Bundle bundle = getBundleInfo(response.getBody().getItems().getItem(), bundle_code);
                        TraceType type = getTraceType(response.getBody().getItems().getItem().get(0));
                        if (type.getTarget().equals(farm.getType().getCode())) {
                            message.put("name", bundle.getBundle_owner_name());
                            message.put("address", bundle.getBundle_owner_addr());
                            message.put("status", true);
                            message.put("data", bundle);
                        } else {
                            message.put("status", false);
                            message.put("type", 2);
                        }
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

    @Transactional
    public Message createManualBundle(List<Integer> traceList, int user_no) {
        Message message = new Message();
        Farm farm = farmDao.getFarmByUserNo(user_no);
        Bundle bundle = new Bundle();
        List<Trace> traces = new ArrayList<>();
        boolean duplicate = false;
        for (int trace_no : traceList) {
            traces.add(traceDao.getTraceByNo(trace_no));
            if ((bundleTracesDao.checkTraceHasBundle(trace_no))) {
                message.put("status", false);
                duplicate = true;
                break;
            }
        }
        bundle.setTraceList(traces);
        Trace firstTrace = traceDao.getTraceByNo(traceList.get(0));
        if (!duplicate) {
            bundle.setFarm_no(farm.getNo());
            bundle.setBundle_owner_name(userDao.getUserByNo(farm.getUser_no()).getName());
            bundle.setBundle_owner_addr(firstTrace.getBreed().get(0).getBreed_farm_addr());
            bundle.setBundle_code(TraceCodeGenerator.makeBundleCode(bundle));
            bundleDao.createNewFarmBundle(bundle);
            for (Trace trace : bundle.getTraceList()) {
                bundleTracesDao.connectBundleTrace(bundle.getNo(), trace.getNo());
            }
            message.put("status", true);
        }
        return message;
    }

    @Transactional
    public Message createPublicBundle(Bundle bundle, int user_no) {
        Message message = new Message();
        Farm farm = farmDao.getFarmByUserNo(user_no);
        if (farm != null) {
            if (bundle.getBundle_code() != null) {
                if (bundleDao.isCodeExists(bundle.getBundle_code())) {
                    message.put("status", false);
                } else {
                    message.put("status", true);
                    bundle.setFarm_no(farm.getNo());
                    boolean duplicate = false;
                    for (Trace trace : bundle.getTraceList()) {
                        if (traceDao.isCodeExists(trace.getTrace_code())) {
                            message.put("status", false);
                            duplicate = true;
                            break;
                        }
                    }
                    if (!duplicate) {
                        bundleDao.createNewFarmBundle(bundle);
                        for (Trace trace : bundle.getTraceList()) {
                            trace.setFarm_no(farm.getNo());
                            traceDao.registerTrace(trace);
                            bundleTracesDao.connectBundleTrace(bundle.getNo(), trace.getNo());
                        }
                    }
                }
            } else {
                message.put("status", false);
            }
        } else {
            message.put("status", false);
        }
        return message;
    }

    @Transactional
    public void deleteBundle(int bundle_no) {
        bundleDao.deleteBundle(bundle_no);
    }

    public Bundle getTracePackagePage(int bundle_no) {
        Bundle bundle = bundleDao.getTracePackagePage(bundle_no);
        List<Trace> traces = bundleTracesDao.getBundleTraces(bundle.getNo());
        bundle.setTraceList(traces);
        return bundle;
    }

    public Trace getTracePage(int trace_no) {
        return traceDao.getTracePage(trace_no);
    }

    public Message searchByCode(String code) {
        // TODO Like list 로 변경
        Message message = new Message();
        List<Trace> traces = traceDao.getTracesByCode(code);
        List<Bundle> bundles = bundleDao.getBundlesByCode(code);
        for(Bundle bundle : bundles) {
            bundle.setTraceList(bundleTracesDao.getBundleTraces(bundle.getNo()));
        }
        message.put("traces" , traces);
        message.put("bundles", bundles);
        if(traces.isEmpty() && bundles.isEmpty()) {
            message.put("status", false);
        } else {
            message.put("status", true);
        }
        return message;
    }

    public Message getBundleModalData(int no) {
        Message message = new Message();
        Bundle bundle = bundleDao.getBundleByNo(no);
        if (bundle != null) {
            bundle.setTraceList(bundleTracesDao.getBundleTraces(bundle.getNo()));
            message.put("bundle", bundle);
            message.put("status", true);
        } else {
            message.put("status", false);
        }
        return message;
    }

    @Transactional
    public Message updateBundle(List<Integer> traceList, int bundle_no, int user_no) {
        Message message = new Message();
        boolean b = false;
        for (Integer trace_no : traceList) {
            if (traceDao.getTraceByNo(trace_no) == null) {
                b = true;
                break;
            }
        }
        if (!b) {
            bundleTracesDao.resetBundleTraces(bundle_no);
            for (Integer trace_no : traceList) {
                bundleTracesDao.connectBundleTrace(bundle_no, trace_no);
            }
            message.put("status", true);
        } else {
            message.put("status", false);
        }
        return message;
    }

    public Message checkTraceInBundle(int trace_no, int user_no) {
        Message message = new Message();
        Farm farm = farmDao.getFarmByUserNo(user_no);
        message.put("type", farm.getType().isManual_available());
        message.put("status", bundleTracesDao.checkTraceHasBundle(trace_no));
        return message;
    }

    @Transactional
    public Message connectTraceBundle(int trace_no, int bundle_no) {
        Message message = new Message();
        if (bundleTracesDao.checkTraceHasBundle(trace_no)) {
            message.put("status", false);
        } else {
            bundleTracesDao.connectBundleTrace(bundle_no, trace_no);
            message.put("status", true);
        }
        return message;
    }

    @Transactional
    public Message disconnectTraceBundle(int trace_no, int bundle_no) {
        Message message = new Message();
        if (bundleTracesDao.checkBundleAbleToDisconnect(bundle_no)) {
            bundleTracesDao.disconnectTraceBundle(trace_no, bundle_no);
            message.put("status", true);
        } else {
            message.put("status", false);
        }

        return message;
    }

    public Message getAvailableTraceFromBundleFarm(String code, int bundle_no) {
        Message message = new Message();
        Bundle bundle = bundleDao.getBundleByNo(bundle_no);
        Farm farm = farmDao.getFarmByFarmNo(bundle.getFarm_no());
        Trace trace = traceDao.getTraceByCode(code);
        if (trace != null) {
            if (trace.getFarm_no() != farm.getNo()) {
                message.put("status", false);
                message.put("text", "묶음 이력과 연결할 수 없는 이력입니다.");
            } else if (bundleTracesDao.checkTraceHasBundle(trace.getNo())) {
                message.put("status", false);
                message.put("text", "이미 다른 묶음 이력에 연결되어있는 이력입니다.");
            } else {
                message.put("status", true);
                message.put("no", trace.getNo());
            }
        } else {
            message.put("status", false);
            message.put("text", "존재하지 않는 이력입니다.");
        }
        return message;
    }

    public List<DashBoardTrace> getNewDashboardTraces() {
        return bundleTracesDao.getNewDashboardTraces();
    }


    /**
     * 1. 이력번호
     * 2. 개체 정보
     * 3. 사육 정보
     * 4. 도축 정보
     * 5. 가공 정보
     * **/

}
