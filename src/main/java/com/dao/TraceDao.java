package com.dao;

import com.mapper.TraceMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class TraceDao {
    private TraceMapper mapper;
    private TraceDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(TraceMapper.class);
    }
}