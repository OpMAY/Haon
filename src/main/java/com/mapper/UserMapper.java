package com.mapper;

import com.model.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    boolean isRegistered(@Param("id") String id);

    void register(User user);

    void updateUser(User user);

    User getUserById(@Param("id") String id);

    User getUserByNo(@Param("user_no") int user_no);

    void unregister(@Param("user_no") int user_no);

    void updateAgree(User user);
}
