package com.dao;

import com.mapper.ContentMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class ContentDao {
    private ContentMapper mapper;
    private ContentDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(ContentMapper.class);
    }
}