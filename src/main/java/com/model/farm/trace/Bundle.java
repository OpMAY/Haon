package com.model.farm.trace;

import lombok.Data;

import java.util.List;

@Data
public class Bundle {
    private int no;
    private int farm_no;
    private String bundle_code;
    private String bundle_owner_name;
    private String bundle_owner_addr;
    private List<Trace> traceList;
}
