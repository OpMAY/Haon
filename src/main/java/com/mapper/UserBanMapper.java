package com.mapper;

import com.model.global.UserBan;

public interface UserBanMapper {
    boolean hasUserBan(int user_no);

    boolean isUserBan(int user_no);

    void insertUserBan(UserBan userBan);

    void removeUserBan(int user_no);
}
