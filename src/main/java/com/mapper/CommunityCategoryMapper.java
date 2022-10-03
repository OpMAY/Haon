package com.mapper;

import com.model.global.category.CATEGORY_TYPE;
import com.model.global.category.CommunityCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommunityCategoryMapper {
    List<String> getCategories(CATEGORY_TYPE type);

    void updateCategory(CommunityCategory category);

    List<CommunityCategory> getAllCategories();

    CommunityCategory getCommunityCategory(@Param("type") CATEGORY_TYPE type);
}
