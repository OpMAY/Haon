package com.mapper;

import com.model.global.keyword.SearchKeyword;

import java.util.List;

public interface SearchKeywordMapper {
    List<String> getSearchKeywords();

    List<String> getRecommendKeywords();
    List<SearchKeyword> getAllKeywords();

    void updateSearchKeyword(SearchKeyword searchKeyword);
}
