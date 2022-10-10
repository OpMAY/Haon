package com.model.farm.trace;

import com.model.common.Time;
import com.model.farm.FARM_TYPE;
import lombok.Data;

@Data
public class DashBoardTrace extends Time {
    private String name;
    private String farm_name;
    private boolean is_bundle;
    private FARM_TYPE type;
    private String code;
    private int no;
}
