package com.mapper;

import com.model.farm.Farm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FarmMapper {
    List<Farm> getMainFarms();

    boolean getFarm(@Param("user_no") int user_no);

    void insertFarm(Farm farm);

    Farm getFarmByUserNo(@Param("user_no") int user_no);

    Farm getFarmByFarmNo(@Param("farm_no") int farm_no);

    boolean isFarmBookmark(@Param("farm_no") int farm_no, @Param("user_no") int user_no);

    Farm getFarmByNo(int farm_no);

    List<Farm> getCommunityFarmsOrderByRecent();

    List<Farm> getCommunityFarmsOrderByViews();
    
    List<Farm> getCommunityFarmsOrderByBookmarks();

    List<Farm> getCommunityFarmsOrderByRecentReload(@Param("content_no") int content_no);

    List<Farm> getCommunityFarmsOrderByViewsReload(@Param("content_no") int content_no);

    List<Farm> getCommunityFarmsOrderByBookmarksReload(@Param("content_no") int content_no);
}
