package com.mapper;

import com.model.farm.trace.Trace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BundleTracesMapper {
    List<Trace> getBundleTraces(int bundle_no);

    boolean checkTraceHasBundle(int trace_no);

    void connectBundleTrace(@Param("bundle_no") int bundle_no, @Param("trace_no") int trace_no);

    void resetBundleTraces(int bundle_no);
}
