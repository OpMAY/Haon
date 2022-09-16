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

    public boolean isRegistered(String email) {
        return userDao.isRegistered(email);
    }

    public void register(User user) {
        userDao.register(user);
    }
}
