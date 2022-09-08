package com.model.content.manual;

import com.model.content.common.UserContentTransaction;
import lombok.Data;

/**
 * Manual Like, Manual Bookmark 에서 모두 쓰임
 * **/
@Data
public class ManualTransaction extends UserContentTransaction {
    private int manual_no;
}
