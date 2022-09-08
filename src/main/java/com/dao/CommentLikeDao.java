package com.dao;

import com.mapper.CommentLikeMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class CommentLikeDao {
    private CommentLikeMapper mapper;
    private CommentLikeDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(CommentLikeMapper.class);
    }
}