package com.dao;

import com.mapper.FarmMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class FarmDao {
    private FarmMapper mapper;
    private FarmDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(FarmMapper.class);
    }
}