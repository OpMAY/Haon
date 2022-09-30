package com.dao;

import com.mapper.CommunityCategoryMapper;
import com.mapper.SearchKeywordMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class SearchKeywordDao {
    private SearchKeywordMapper mapper;
    private SearchKeywordDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(SearchKeywordMapper.class);
    }
}
