package com.service;

import com.dao.FarmDao;
import com.dao.UserDao;
import com.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {
    private final UserDao userDao;
    private final FarmDao farmDao;

    public boolean isRegistered(String id) {
        return userDao.isRegistered(id);
    }

    public void register(User user) {
        userDao.register(user);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    public int getUserById(String id) {
        return userDao.getUserById(id);
    }

    public User getUserByNo(int user_no) {
        return userDao.getUserByNo(user_no);
    }

    public void unregister(int user_no) {
        userDao.unregister(user_no);
    }

    public void updateAgree(User user) {
        userDao.updateAgree(user);
    }
}
