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

    public void connectBundleTrace(int bundle_no, int trace_no) {
        mapper.connectBundleTrace(bundle_no, trace_no);
    }

    public void resetBundleTraces(int bundle_no) {
        mapper.resetBundleTraces(bundle_no);
    }

    public boolean checkBundleAbleToDisconnect(int bundle_no) {
        return mapper.checkBundleAbleToDisconnect(bundle_no);
    }

    public void disconnectTraceBundle(int trace_no, int bundle_no) {
        mapper.disconnectTraceBundle(trace_no, bundle_no);
    }
}