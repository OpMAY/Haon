package com.mapper;

import com.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    boolean isRegistered(@Param("email") String email);

    void register(User user);
}
