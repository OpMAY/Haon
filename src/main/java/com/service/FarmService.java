package com.service;

import com.dao.FarmDao;
import com.model.common.MFile;
import com.model.farm.Farm;
import com.model.farm.FarmSns;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
@RequiredArgsConstructor
public class FarmService {
    private final FarmDao farmDao;

    public void insertFarm(Farm farm) {
        farmDao.insertFarm(farm);
    }

    public Farm getFarmByUserNo(int user_no) {
        return farmDao.getFarmByUserNo(user_no);
    }

    public Farm getFarmByFarmNo(int farm_no) {
        return farmDao.getFarmByFarmNo(farm_no);
    }

    public boolean isFarmBookmark(int farm_no, int user_no) {
        return farmDao.isFarmBookmark(farm_no, user_no);
    }

    public void updateFarmDescription(int farm_no, String description) {
        farmDao.updateFarmDescription(farm_no, description);
    }

    public void updateFarmSns(int farm_no, FarmSns farmSns) {
        farmDao.updateFarmSns(farm_no, farmSns);
    }

    public void updateFarmName(int farm_no, String name) {
        farmDao.updateFarmName(farm_no, name);
    }

    public void updateFarmHashtag(int farm_no, ArrayList<String> hashs) {
        farmDao.updateFarmHashtag(farm_no, hashs);
    }

    public void updateFarmProfile(int farm_no, MFile file) {
        farmDao.updateFarmProfile(farm_no, file);
    }

    public void updateFarmBanner(int farm_no, MFile file) {
        farmDao.updateFarmBanner(farm_no, file);
    }
}
