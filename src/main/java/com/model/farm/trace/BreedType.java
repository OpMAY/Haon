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
        String formatted = text.replaceAll(" ", "");
        for(BreedType breedType : BreedType.values()) {
            String keywordFormatted = breedType.getKeyword().replaceAll(" ", "");
            if(keywordFormatted.equals(formatted)) {
                return breedType;
            }
        }
        return BreedType.REGISTER;
    }
}
