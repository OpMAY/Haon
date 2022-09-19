package com.mapper;

import com.model.farm.Farm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FarmMapper {
    List<Farm> getMainFarms();

    boolean getFarm(@Param("user_no") int user_no);

    void insertFarm(Farm farm);

    Farm getFarmByUserNo(@Param("user_no") int user_no);
}
