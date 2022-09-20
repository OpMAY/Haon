package com.service;

import com.dao.FarmDao;
import com.model.farm.Farm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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
}
