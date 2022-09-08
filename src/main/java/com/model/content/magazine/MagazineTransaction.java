package com.model.content.magazine;

import com.model.content.common.UserContentTransaction;
import lombok.Data;

/**
 * Magazine Like, Magazine Bookmark 에서 모두 쓰임
 * **/
@Data
public class MagazineTransaction extends UserContentTransaction {
    private int magazine_no;
}
