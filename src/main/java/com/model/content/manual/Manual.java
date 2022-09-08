package com.model.content.manual;

import com.model.common.MFile;
import com.model.content.common.ContentForm;
import lombok.Data;

@Data
public class Manual extends ContentForm {
    private int farm_no;
    private MFile thumbnail;
}
