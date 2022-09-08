package com.dao;

import com.mapper.DislikeMapper;
import com.mapper.TestMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class DislikeDao {
    private DislikeMapper mapper;
    private DislikeDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(DislikeMapper.class);
    }
}