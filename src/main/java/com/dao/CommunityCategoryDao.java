package com.dao;

import com.mapper.CommunityCategoryMapper;
import com.model.global.category.CATEGORY_TYPE;
import com.model.global.category.CommunityCategory;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class CommunityCategoryDao {
    private CommunityCategoryMapper mapper;

    private CommunityCategoryDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(CommunityCategoryMapper.class);
    }

    public List<String> getCategories(CATEGORY_TYPE type) {
        return mapper.getCategories(type);
    }

    public void updateCategory(CommunityCategory category) {
        mapper.updateCategory(category);
    }

    public List<CommunityCategory> getAllCategories() {
        return mapper.getAllCategories();
    }

    public CommunityCategory getCommunityCategory(CATEGORY_TYPE type) {
        return mapper.getCommunityCategory(type);
    }
}
