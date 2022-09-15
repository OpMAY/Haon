package com.model.farm.trace;

import lombok.Data;

import java.util.List;

@Data
public class Trace {
    private int no;
    private int farm_no;
    private String trace_code;
    private TraceEntity entity;
    private List<TraceBreed> breed;
    private List<TraceButchery> butchery;
    private List<TraceProcess> process;
}
