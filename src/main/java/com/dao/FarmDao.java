package com.dao;

import com.mapper.FarmMapper;
import com.model.farm.Farm;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class FarmDao {
    private FarmMapper mapper;
    private FarmDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(FarmMapper.class);
    }

    public List<Farm> getMainFarms() {
        return mapper.getMainFarms();
    }
}