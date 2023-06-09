package com.mapper;

import com.model.farm.Farm;
import com.model.farm.trace.Bundle;

import java.util.List;

public interface BundleMapper {
    List<Bundle> getFarmBundles(int farm_no);

    void createNewFarmBundle(Bundle bundle);

    boolean isCodeExists(String bundle_code);

    void deleteBundle(int bundle_no);

    Bundle getTracePackagePage(int bundle_no);

    Bundle getBundleByCode(String code);

    Bundle getBundleByNo(int bundle_no);

    List<Bundle> getAllBundles();

    List<Bundle> getBundlesByCode(String code);
}
