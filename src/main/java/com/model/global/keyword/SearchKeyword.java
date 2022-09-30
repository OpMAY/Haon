package com.model.global.keyword;

import lombok.Data;

import java.util.List;

@Data
public class SearchKeyword {
    private int no;
    private KEYWORD_TYPE type;
    private List<String> keywords;
}
