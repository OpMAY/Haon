package com.mapper;

import com.model.farm.trace.Trace;

import java.util.List;

public interface BundleTracesMapper {
    List<Trace> getBundleTraces(int bundle_no);
}
