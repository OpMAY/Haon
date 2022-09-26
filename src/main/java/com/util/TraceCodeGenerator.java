package com.util;

import com.model.farm.trace.Bundle;
import com.model.farm.trace.EntityType;
import com.model.farm.trace.Trace;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Slf4j
public class TraceCodeGenerator {

    public static String makeTraceCode(Trace trace) {
        EntityType type = trace.getEntity().getEntity_type();
        if (unavailable_entity_types.contains(type)) {
            return null;
        } else {
            // 코드 규칙
            // 소고기 -> 확장코드 (2), 코드구분 (1), 식별코드 (8), 체크번호 (1) -> 12자리
            // 돼지고기 -> 축종 (1), 농장식별번호 (6), 출하 순번(5) -> 12자리
            /**
             * 1. 닭고기
             *    -> 축종 코드 2 (1), 도축 일자 [YYMMDD] (6), 작업장 코드 (3), 일련번호(2)
             * 2. 오리고기
             *    -> 축종 코드 5 (1), 도축 일자 [YYMMDD] (6), 작업장 코드 (3), 일련번호 (2)
             * 3. 계란
             *    -> 축종 코드 3 (1), 산란일자 [MMDD] (4), 작업장 코드 (3), 일련 번호 (4)
             * **/
            /**
             * 1. 문제점
             *    1) 현재 토끼, 말, 양 & 염소 농장 및 작업장을 식별할 수 있는 코드가 없음
             *    2) 축종 코드는 임의로 설정하겠지만 추후 문제가 될 수있는 소지가 많음
             *    3) 도축 및 산란 일자 기준으로 잡을 것이기 때문에 이력제 자체는 도축 및 가공이 된 상태여야함
             * 2. 해결 방안
             *    1) 사업자 등록번호 등 해당 농장을 식별할 수 있는 코드만 찾아 이를 통해 대체 (임시방편)
             *    2) 토끼 6, 말 7, 양 & 염소 8 로 지정
             *    3) 등록 일자 기준으로 선정
             * **/
            String time = Time.TimeFormatCurrent("yymmdd"); // 6
            int farmNo = trace.getFarm_no();
            String workCode = Integer.toString(trace.getFarm_no()); // 3
            if(farmNo < 10) {
                workCode = "00" + workCode;
            } else if (farmNo < 100) {
                workCode = "0" + workCode;
            } else if (farmNo >= 1000) {
                workCode = workCode.substring(0, 2);
            }
            String record = "01"; // 2
            return type.getSpeciesCode() + time + workCode + record;
        }
    }

    public static String makeBundleCode(Bundle bundle) {
        // 묶음 번호 규칙
        // 고정 코드 [L] (1), 구분 코드 [0 = 소, 1 = 돼지] (1), 묶음 날짜 코드 (6), 영업자코드 (4), 일련번호 (3) -> 15자리

        return "";
    }

    private static final List<EntityType> unavailable_entity_types = new ArrayList<>(Arrays.asList(new EntityType[]{
            EntityType.CATTLE,
            EntityType.DUCK,
            EntityType.FOWL,
            EntityType.PIG
    }));
}
