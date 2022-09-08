package com.dao;

import com.mapper.BundleTracesMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class BundleTracesDao {
    private BundleTracesMapper mapper;
    private BundleTracesDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BundleTracesMapper.class);
    }
}