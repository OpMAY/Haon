package com.model.farm;

import com.model.Agree;
import com.model.common.MFile;
import lombok.Data;

import java.util.List;

@Data
public class Farm {
    private int no;
    private int user_no;
    private String name;
    private FARM_TYPE type;
    private MFile profile_image;
    private MFile farm_image;
    private String description;
    private List<String> hashtag;
    private FarmSns sns;
    private Agree agree;
}
