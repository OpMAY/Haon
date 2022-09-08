package com.dao;

import com.mapper.BundleMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class BundleDao {
    private BundleMapper mapper;

    private BundleDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BundleMapper.class);
    }
}