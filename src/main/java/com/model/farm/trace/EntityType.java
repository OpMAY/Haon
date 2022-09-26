package com.model.farm.trace;

public enum EntityType {
    CATTLE("소", "0"),
    PIG("돼지", "1"),
    FOWL("닭", "2"),
    DUCK("오리", "5"),
    RABBIT("토끼", "6"),
    HORSE("말", "7"),
    SHEEP_GOAT("양 & 염소", "8");

    private final String typeName;

    private final String speciesCode;

    EntityType(String typeName, String speciesCode) {
        this.typeName = typeName;
        this.speciesCode = speciesCode;
    }

    public String getTypeName() {
        return typeName;
    }
    public String getSpeciesCode() {
        return speciesCode;
    }
}
