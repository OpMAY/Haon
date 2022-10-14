package com.mapper;

import com.model.farm.trace.DashBoardTrace;
import com.model.farm.trace.Trace;

import java.util.List;

public interface TraceMapper {
    List<Trace> getFarmTraces(int farmNo);

    boolean isCodeExists(String code);

    void registerTrace(Trace trace);

    void deleteTrace(int no);

    Trace getTraceByNo(int no);

    Trace getTraceByCode(String code);

    Trace getTracePage(int trace_no);

    void editTrace(Trace trace);

    List<Trace> getAllTraces();

    List<Trace> getTracesByCode(String code);
}
