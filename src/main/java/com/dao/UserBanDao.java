package com.dao;

import com.mapper.CommunityCategoryMapper;
import com.mapper.UserBanMapper;
import com.model.global.UserBan;
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

    public boolean hasUserBan(int user_no) {
        return mapper.hasUserBan(user_no);
    }

    public boolean isUserBan(int user_no) {
        return mapper.isUserBan(user_no);
    }

    public void insertUserBan(UserBan userBan) {
        mapper.insertUserBan(userBan);
    }

    public void removeUserBan(int user_no) {
        mapper.removeUserBan(user_no);
    }
}
