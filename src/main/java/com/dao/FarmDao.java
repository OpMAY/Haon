package com.dao;

import com.mapper.FarmMapper;
import com.model.common.MFile;
import com.model.farm.FARM_TYPE;
import com.model.farm.Farm;
import com.model.farm.FarmSns;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class FarmDao {
    private FarmMapper mapper;

    private FarmDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(FarmMapper.class);
    }

    public List<Farm> getMainFarms() {
        return mapper.getMainFarms();
    }

    public boolean getFarm(int user_no) {
        return mapper.getFarm(user_no);
    }

    public void insertFarm(Farm farm) {
        mapper.insertFarm(farm);
    }

    public Farm getFarmByUserNo(int user_no) {
        return mapper.getFarmByUserNo(user_no);
    }

    public Farm getFarmByFarmNo(int farm_no) {
        return mapper.getFarmByFarmNo(farm_no);
    }

    public boolean isFarmBookmark(int farm_no, int user_no) {
        return mapper.isFarmBookmark(farm_no, user_no);
    }

    public Farm getFarmByNo(int farm_no) {
        return mapper.getFarmByNo(farm_no);
    }

    public List<Farm> getCommunityFarmsOrderByRecent(FARM_TYPE farm_type) {
        return mapper.getCommunityFarmsOrderByRecent(farm_type);
    }

    public List<Farm> getCommunityFarmsOrderByViews(FARM_TYPE farm_type) {
        return mapper.getCommunityFarmsOrderByViews(farm_type);
    }

    public List<Farm> getCommunityFarmsOrderByBookmarks(FARM_TYPE farm_type) {
        return mapper.getCommunityFarmsOrderByBookmarks(farm_type);
    }

    public List<Farm> getCommunityFarmsOrderByRecentReload(FARM_TYPE farm_type, int content_no) {
        return mapper.getCommunityFarmsOrderByRecentReload(farm_type, content_no);

    }

    public List<Farm> getCommunityFarmsOrderByViewsReload(FARM_TYPE farm_type, int content_no) {
        return mapper.getCommunityFarmsOrderByViewsReload(farm_type, content_no);

    }

    public List<Farm> getCommunityFarmsOrderByBookmarksReload(FARM_TYPE farm_type, int content_no) {
        return mapper.getCommunityFarmsOrderByBookmarksReload(farm_type, content_no);
    }

    public List<Farm> getFarmSearchResult(String query, int last_content_no) {
        return mapper.getFarmSearchResult(query, last_content_no);
    }

    public void updateFarmDescription(int farm_no, String description) {
        mapper.updateFarmDescription(farm_no, description);
    }

    public void updateFarmSns(int farm_no, FarmSns farmSns) {
        mapper.updateFarmSns(farm_no, farmSns);
    }

    public void updateFarmName(int farm_no, String name) {
        mapper.updateFarmName(farm_no, name);
    }

    public void updateFarmHashtag(int farm_no, ArrayList<String> hashs) {
        mapper.updateFarmHashtag(farm_no, hashs);
    }

    public void updateFarmProfile(int farm_no, MFile file) {
        mapper.updateFarmProfile(farm_no, file);
    }

    public void updateFarmBanner(int farm_no, MFile file) {
        mapper.updateFarmBanner(farm_no, file);
    }

    public ArrayList<Farm> getNewFarms() {
        return mapper.getNewFarms();
    }
}