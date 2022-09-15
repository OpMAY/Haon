package com.api.trace.response;

public enum TraceType {
    CATTLE_TRACE("CATTLE", false, "CATTLE|CATTLE_NO"),
    CATTLE_BUNDLE("CATTLE", true, "CATTLE|LOT_NO"),
    PIG_TRACE("PIG", false, "PIG|PIG_NO"),
    PIG_BUNDLE("PIG", true, "PIG|LOT_NO"),
    FOWL_TRACE("FOWL", false, "FOWL|HIST_NO"),
    FOWL_BUNDLE("FOWL", true, "FOWL|LOT_NO"),
    DUCK_TRACE("DUCK", false, "DUCK|HIST_NO"),
    DUCK_BUNDLE("DUCK", true, "DUCK|LOT_NO"),
    EGG_TRACE("EGG", false, "EGG|HIST_NO");

    private final String target;
    private final boolean is_bundle;
    private final String trace_no_type;

    TraceType(String target, boolean is_bundle, String trace_no_type) {
        this.target = target;
        this.is_bundle = is_bundle;
        this.trace_no_type = trace_no_type;
    }

    public String getTarget() {
        return target;
    }

    public boolean isBundle() {
        return is_bundle;
    }

    public String getTraceNoType() {
        return trace_no_type;
    }
}
