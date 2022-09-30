package com.model.global.category;

import lombok.Data;

import java.util.List;

@Data
public class CommunityCategory {
    private int no;
    private CATEGORY_TYPE type;
    private List<String> categories;
}
