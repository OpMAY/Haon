package com.dao;

import com.mapper.BundleMapper;
import com.model.farm.trace.Bundle;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class BundleDao {
    private BundleMapper mapper;

    private BundleDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BundleMapper.class);
    }

    public List<Bundle> getFarmBundles(int farm_no) {
        return mapper.getFarmBundles(farm_no);
    }
}