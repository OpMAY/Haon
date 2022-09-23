package com.mapper;

import com.model.common.MFile;
import com.model.farm.Farm;
import com.model.farm.FarmSns;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
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

    List<Farm> getFarmSearchResult(@Param("query") String query, @Param("last_content_no") int last_content_no);

    void updateFarmDescription(@Param("farm_no") int farm_no, @Param("description") String description);

    void updateFarmSns(@Param("farm_no") int farm_no, @Param("farmSns") FarmSns farmSns);

    void updateFarmName(@Param("farm_no") int farm_no, @Param("name") String name);

    void updateFarmHashtag(@Param("farm_no") int farm_no, @Param("hashs") ArrayList<String> hashs);

    void updateFarmProfile(@Param("farm_no") int farm_no, @Param("profile") MFile file);

    void updateFarmBanner(@Param("farm_no") int farm_no, @Param("banner") MFile file);
}
