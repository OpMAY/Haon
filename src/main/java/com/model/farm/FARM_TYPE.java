package com.model.farm;

public enum FARM_TYPE {
    CATTLE("CATTLE"), PIG("PIG"), FOWL("FOWL"), DUCK("DUCK"), RABBIT("RABBIT"), HORSE("HORSE"),
    SHEEP_GOAT("SHEEP_GOAT"), NONE("NONE");
    private final String code;

    FARM_TYPE(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
