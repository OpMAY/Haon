package com.dao;

import com.mapper.BannerMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class BannerDao {
    private BannerMapper mapper;
    private BannerDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BannerMapper.class);
    }
}