package com.api.trace.response;

import lombok.Data;

import java.util.List;

@Data
public class TraceResponse {
    private TraceResponse response;
    private TraceResponseHeader header;
    private TraceResponseBody body;
    private List<String> content;
    private String notice;
}





