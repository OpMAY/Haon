package com.model.content.question;

import com.model.common.MFile;
import com.model.content.common.ContentForm;
import lombok.Data;

@Data
public class Question extends ContentForm {
    private MFile profile_image;
    private boolean is_new_comment;
}
