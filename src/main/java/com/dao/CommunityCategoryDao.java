package com.dao;

import com.mapper.CommentLikeMapper;
import com.mapper.CommunityCategoryMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class CommunityCategoryDao {
    private CommunityCategoryMapper mapper;
    private CommunityCategoryDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(CommunityCategoryMapper.class);
    }
}
