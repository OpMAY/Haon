package com.dao;

import com.mapper.CommunityCategoryMapper;
import com.mapper.SearchKeywordMapper;
import com.model.global.keyword.SearchKeyword;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class SearchKeywordDao {
    private SearchKeywordMapper mapper;
    private SearchKeywordDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(SearchKeywordMapper.class);
    }

    public List<String> getSearchKeywords() {
        return mapper.getSearchKeywords();
    }

    public List<String> getRecommendKeywords() {
        return mapper.getRecommendKeywords();
    }

    public List<SearchKeyword> getAllKeywords() {
        return mapper.getAllKeywords();
    }

    public void updateSearchKeyword(SearchKeyword searchKeyword) {
        mapper.updateSearchKeyword(searchKeyword);
    }
}
