package com.dao;

import com.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class UserDao {
    private UserMapper mapper;
    private UserDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(UserMapper.class);
    }
}