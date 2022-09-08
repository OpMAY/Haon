package com.model.content.tips;

import com.model.common.MFile;
import com.model.content.common.ContentForm;
import lombok.Data;

@Data
public class Tips extends ContentForm {
    private int farm_no;
    private MFile thumbnail;
}
