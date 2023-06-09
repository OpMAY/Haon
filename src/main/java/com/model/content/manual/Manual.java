package com.model.content.manual;

import com.model.common.MFile;
import com.model.content.common.ContentForm;
import lombok.Data;

@Data
public class Manual extends ContentForm {
    private MFile profile_image;
    private boolean is_new_comment;
}
