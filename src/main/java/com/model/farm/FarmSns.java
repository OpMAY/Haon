package com.model.farm;

import lombok.Data;

@Data
public class FarmSns {
    private String instagram;
    private String blog;
    private String homepage;

    public FarmSns() {

    }

    public FarmSns(String instagram, String blog, String homepage) {
        this.instagram = instagram;
        this.blog = blog;
        this.homepage = homepage;
    }
}