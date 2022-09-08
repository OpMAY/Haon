package com.model.content.tips;

import com.model.content.common.UserContentTransaction;
import lombok.Data;

/**
 * Tips Like, Tips Bookmark 에서 모두 쓰임
 **/
@Data
public class TipsTransaction extends UserContentTransaction {
    private int tips_no;
}
