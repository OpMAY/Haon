package com.model.content.common;

public enum COMMENT_TYPE {
    BOARD("자유 게시판"), MAGAZINE("최신 매거진"), MANUAL("축산 메뉴얼"), TIP("팁과 노하우"), QUESTION("질문과 답변"), FARM("농장");
    private final String kor_name;

    COMMENT_TYPE(String kor_name) {
        this.kor_name = kor_name;
    }

    public String getKorName() {
        return kor_name;
    }
}
