package com.dao;

import com.mapper.LikeMapper;
import com.mapper.TestMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class LikeDao {
    private LikeMapper mapper;

    private LikeDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(LikeMapper.class);
    }
}