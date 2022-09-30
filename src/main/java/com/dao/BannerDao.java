package com.dao;

import com.mapper.BannerMapper;
import com.model.global.Banner;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class BannerDao {
    private BannerMapper mapper;
    private BannerDao(SqlSession sqlSession) {
        this.mapper = sqlSession.getMapper(BannerMapper.class);
    }

    public List<Banner> getBanners() {
        return mapper.getBanners();
    }

    public void insertBanner(Banner banner) {
        mapper.insertBanner(banner);
    }

    public void removeBanner(int banner_no) {
        mapper.removeBanner(banner_no);
    }

    public void updateBanner(Banner banner) {
        mapper.updateBanner(banner);
    }
}