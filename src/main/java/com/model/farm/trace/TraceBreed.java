package com.model.farm.trace;

import lombok.Data;

@Data
public class TraceBreed {
    private BreedType type;
    private String breed_farmer_name;
    private String breed_farm_name;
    private String breed_issue_date;
    private String breed_farm_addr;
    private String breed_farm_url;
}
