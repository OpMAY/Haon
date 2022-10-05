package com.model.farm.trace;

import com.model.User;
import com.model.farm.Farm;
import lombok.Data;

@Data
public class AdminFarmTrace {
    private Trace trace;
    private Farm farm;
    private User user;
}
