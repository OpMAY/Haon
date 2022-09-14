package com.model.farm.trace;

public enum BreedType {
    REGISTER("전산 등록"),
    AMNIOTIC("양수"),
    SLAUGHTER("도축 출하");

    private final String keyword;

    BreedType(String keyword) {
        this.keyword = keyword;
    }

    public String getKeyword() {
        return keyword;
    }

    public static BreedType getBreedType(String text) {
        for(BreedType breedType : BreedType.values()) {
            if(breedType.getKeyword().equals(text)) {
                return breedType;
            }
        }
        return BreedType.REGISTER;
    }
}
