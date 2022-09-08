package com.service;

import com.dao.BannerDao;
import com.dao.FarmDao;
import com.dao.UserDao;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class GlobalService {
    private final BannerDao bannerDao;
    private final UserDao userDao;
    private final FarmDao farmDao;
}
