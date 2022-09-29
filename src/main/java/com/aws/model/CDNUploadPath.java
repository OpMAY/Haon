package com.aws.model;

public enum CDNUploadPath {
    TEST("files/test/"),
    BANNER("files/admin/banner/"),
    ADMIN("files/admin/"),
    USER("files/user/"),
    COMMUNITY("files/community/"),
    SUMMERNOTE("files/summernote/rest/file/");

    private final String path;

    CDNUploadPath(String path) {
        this.path = path;
    }
    public String getPath() {
        return path;
    }
}
