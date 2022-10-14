package com.dao;

import com.mapper.BundleMapper;
import com.model.farm.Farm;
import com.model.farm.trace.Bundle;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class BundleDao {
    private BundleMapper mapper;

    private BundleDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BundleMapper.class);
    }

    public List<Bundle> getFarmBundles(int farm_no) {
        return mapper.getFarmBundles(farm_no);
    }

    public void createNewFarmBundle(Bundle bundle) {
        mapper.createNewFarmBundle(bundle);
    }

    public boolean isCodeExists(String bundle_code) {
        return mapper.isCodeExists(bundle_code);
    }

    public void deleteBundle(int bundle_no) {
        mapper.deleteBundle(bundle_no);
    }

    public Bundle getTracePackagePage(int bundle_no) {
        return mapper.getTracePackagePage(bundle_no);
    }

    public Bundle getBundleByCode(String code) {
        return mapper.getBundleByCode(code);
    }

    public Bundle getBundleByNo(int bundle_no) {
        return mapper.getBundleByNo(bundle_no);
    }

    public List<Bundle> getAllBundles() {
        return mapper.getAllBundles();
    }

    public List<Bundle> getBundlesByCode(String code) {
        return mapper.getBundlesByCode(code);
    }
}