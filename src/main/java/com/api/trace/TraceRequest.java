package com.api.trace;

import lombok.Data;

@Data
public class TraceRequest {
    private String traceNo;
    private int optionNo;
    private String corpNo;
    private String serviceKey;
}
