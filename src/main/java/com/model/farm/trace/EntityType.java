package com.model.farm.trace;

public enum EntityType {
    CATTLE("소"),
    PIG("돼지"),
    FOWL("닭"),
    DUCK("오리"),
    RABBIT("토끼"),
    HORSE("말"),
    SHEEP_GOAT("양 & 염소");

    private final String typeName;

    EntityType(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeName() {
        return typeName;
    }
}
