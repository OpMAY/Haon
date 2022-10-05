package com.model;

import com.model.farm.Farm;
import lombok.Data;

@Data
public class AdminUser {
    private User user;
    private Farm farm;
    private boolean isBan;

    public AdminUser() {

    }

    public AdminUser(User user, Farm farm, boolean isBan) {
        this.user = user;
        this.farm = farm;
        this.isBan = isBan;
    }
}
