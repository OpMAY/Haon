package com.mapper;

import com.model.farm.trace.Bundle;

import java.util.List;

public interface BundleMapper {
    List<Bundle> getFarmBundles(int farm_no);
}
