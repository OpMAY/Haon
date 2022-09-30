package com.service;

import com.dao.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class AdminService {
    private final UserBanDao userBanDao;
    private final BannerDao bannerDao;
    private final SearchKeywordDao searchKeywordDao;
    private final ContentDao contentDao;
    private final CommentDao commentDao;
    private final TraceDao traceDao;
    private final BundleDao bundleDao;
    private final BundleTracesDao bundleTracesDao;
    private final UserDao userDao;
    private final FarmDao farmDao;


}
