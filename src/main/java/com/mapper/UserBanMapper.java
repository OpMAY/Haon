package com.mapper;

import com.model.global.UserBan;
import org.apache.ibatis.annotations.Param;

public interface UserBanMapper {
    boolean isUserBan(int user_no);

    void insertUserBan(UserBan userBan);

    void removeUserBan(int user_no);

    UserBan getActiveUserBan(@Param("user_no") int user_no);
}
