package com.model.farm.trace;

import lombok.Data;

@Data
public class TraceEntity {
    private EntityType entity_type;
    private String birth;
    private String gender; // 암, 수
    private String rate;
}
