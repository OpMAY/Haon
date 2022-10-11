package com.model.farm.trace;

import com.model.common.Time;
import lombok.Data;

import java.util.List;

@Data
public class Trace extends Time {
    private int no;
    private int farm_no;
    private String trace_code;
    private TraceEntity entity;
    private List<TraceBreed> breed;
    private List<TraceButchery> butchery;
    private List<TraceProcess> process;
    private TraceVaccine vaccine;
    private String other_info;
}
