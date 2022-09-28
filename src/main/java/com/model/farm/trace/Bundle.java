package com.model.farm.trace;

import com.model.common.Time;
import lombok.Data;

import java.util.List;

@Data
public class Bundle extends Time {
    private int no;
    private int farm_no;
    private String bundle_code;
    private String bundle_owner_name;
    private String bundle_owner_addr;
    private List<Trace> traceList;
}
