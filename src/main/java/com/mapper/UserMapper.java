package com.mapper;

import com.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    boolean isRegistered(@Param("id") String id);

    void register(User user);

    void updateUser(User user);

    User getUserById(@Param("id") String id);
}
