package com.dao;

import com.mapper.TraceMapper;
import com.model.farm.trace.DashBoardTrace;
import com.model.farm.trace.Trace;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class TraceDao {
    private TraceMapper mapper;
    private TraceDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(TraceMapper.class);
    }

    public List<Trace> getFarmTraces(int farmNo) {
        return mapper.getFarmTraces(farmNo);
    }
    public boolean isCodeExists(String code) {
        return mapper.isCodeExists(code);
    }

    public void registerTrace(Trace trace) {
        mapper.registerTrace(trace);
    }

    public void deleteTrace(int no) {
        mapper.deleteTrace(no);
    }

    public Trace getTraceByNo(int no) {
        return mapper.getTraceByNo(no);
    }

    public Trace getTraceByCode(String code) {
        return mapper.getTraceByCode(code);
    }

    public Trace getTracePage(int trace_no) {
        return mapper.getTracePage(trace_no);
    }

    public void editTrace(Trace trace) {
        mapper.editTrace(trace);
    }

    public List<Trace> getAllTraces() {
        return mapper.getAllTraces();
    }

}