package com.dao;

import com.mapper.CommunityCategoryMapper;
import com.mapper.UserBanMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class UserBanDao {

    private UserBanMapper mapper;

    private UserBanDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(UserBanMapper.class);
    }


}
