package com.model.farm.trace;

import lombok.Data;

@Data
public class TraceVaccine {
    private boolean vaccine_used;
    private String vaccine_info;
    private String vaccine_date;

    public TraceVaccine() {

    }

    public TraceVaccine(boolean vaccine_used) {
        this.vaccine_used = vaccine_used;
    }
}
