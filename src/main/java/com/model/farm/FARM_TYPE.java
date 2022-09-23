package com.model.farm;

public enum FARM_TYPE {
    CATTLE("CATTLE", "소", false),
    PIG("PIG", "돼지", false),
    FOWL("FOWL", "닭", false),
    DUCK("DUCK", "오리", false),
    RABBIT("RABBIT", "토끼", true),
    HORSE("HORSE", "말", true),
    SHEEP_GOAT("SHEEP_GOAT", "양 & 염소", true),
    NONE("NONE", "해당 없음", false),
    ADMIN("ADMIN", "관리자", true);
    private final String code;
    private final String kor_name;
    private final boolean manual_available;

    FARM_TYPE(String code, String kor_name, boolean manual_available) {
        this.code = code;
        this.kor_name = kor_name;
        this.manual_available = manual_available;
    }

    public String getCode() {
        return code;
    }

    public String getKorName() {
        return kor_name;
    }
    public boolean isManual_available() {
        return manual_available;
    }
}
