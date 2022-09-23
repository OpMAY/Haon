package com.dao;

import com.mapper.UserMapper;
import com.model.User;
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

    public boolean isRegistered(String id) {
        return mapper.isRegistered(id);
    }

    public void register(User user) {
        mapper.register(user);
    }

    public void updateUser(User user) {
        mapper.updateUser(user);
    }

    public int getUserById(String id) {
        return mapper.getUserById(id).getNo();
    }

    public User getUserByNo(int user_no) {
        return mapper.getUserByNo(user_no);
    }

    public void unregister(int user_no) {
        mapper.unregister(user_no);
    }
}