package com.mapper;

import com.model.global.Banner;

import java.util.List;

public interface BannerMapper {
    List<Banner> getBanners();

    void insertBanner(Banner banner);

    void removeBanner(int banner_no);

    void updateBanner(Banner banner);
}
