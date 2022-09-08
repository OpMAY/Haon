package com.dao;

import com.mapper.CommentDislikeMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class CommentDislikeDao {
    private CommentDislikeMapper mapper;
    private CommentDislikeDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(CommentDislikeMapper.class);
    }
}