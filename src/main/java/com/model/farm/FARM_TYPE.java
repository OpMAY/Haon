package com.model.farm;

public enum FARM_TYPE {
    CATTLE("CATTLE", "소"), PIG("PIG", "돼지"), FOWL("FOWL", "닭"), DUCK("DUCK", "오리"), RABBIT("RABBIT", "토끼"), HORSE("HORSE", "말"),
    SHEEP_GOAT("SHEEP_GOAT", "양 & 염소"), NONE("NONE", "해당 없음");
    private final String code;
    private final String kor_name;

    FARM_TYPE(String code, String kor_name) {
        this.code = code;
        this.kor_name = kor_name;
    }

    public String getCode() {
        return code;
    }

    public String getKorName() {
        return kor_name;
    }
}
