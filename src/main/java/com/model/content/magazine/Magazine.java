package com.model.content.magazine;

import com.model.common.MFile;
import com.model.content.common.ContentForm;
import lombok.Data;

@Data
public class Magazine extends ContentForm {
    private MFile thumbnail;
    private boolean is_show;
}
