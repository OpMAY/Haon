package com.dao;

import com.mapper.BundleTracesMapper;
import com.model.farm.trace.Trace;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class BundleTracesDao {
    private BundleTracesMapper mapper;
    private BundleTracesDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BundleTracesMapper.class);
    }

    public List<Trace> getBundleTraces(int bundle_no) {
        return mapper.getBundleTraces(bundle_no);
    }

    public boolean checkTraceHasBundle(int trace_no) {
        return mapper.checkTraceHasBundle(trace_no);
    }
}