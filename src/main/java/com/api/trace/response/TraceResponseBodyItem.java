package com.api.trace.response;

import lombok.Data;

import java.util.List;

@Data
public class TraceResponseBodyItem {
    private List<TraceData> item;
    private List<String> content;
}
