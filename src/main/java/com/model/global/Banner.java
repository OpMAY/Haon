package com.model.global;

import com.model.common.MFile;
import com.model.common.Time;
import lombok.Data;

@Data
public class Banner extends Time {
    private int no;
    private MFile img;
    private String url;
    private boolean status;
}
