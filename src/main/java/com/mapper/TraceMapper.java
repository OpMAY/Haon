package com.mapper;

import com.model.farm.trace.Trace;

import java.util.List;

public interface TraceMapper {
    List<Trace> getFarmTraces(int farmNo);

    boolean isCodeExists(String code);

    void registerTrace(Trace trace);
}
