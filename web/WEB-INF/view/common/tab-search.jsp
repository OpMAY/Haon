<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model.global.keyword.SearchKeyword" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<SearchKeyword> searchKeywordList = (List<SearchKeyword>) request.getAttribute("RECOMMEND_KEYWORDS");
    request.setAttribute("RECOMMEND_KEYWORDS", searchKeywordList);
%>
<div id="tab-search" style="display: none;">
    <div class="form-group d-flex">
        <input type="text"
               placeholder="검색할 내용 입력"
               class="form-control input-underline input-brand-green medium-h4 mr-16"
               id="tab-search-input">
        <svg class="my-auto" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <g clip-path="url(#clip0_249_6871)">
                <path d="M18.031 16.617L22.314 20.899L20.899 22.314L16.617 18.031C15.0237 19.3082 13.042 20.0029 11 20C6.032 20 2 15.968 2 11C2 6.032 6.032 2 11 2C15.968 2 20 6.032 20 11C20.0029 13.042 19.3082 15.0237 18.031 16.617ZM16.025 15.875C17.2941 14.5699 18.0029 12.8204 18 11C18 7.132 14.867 4 11 4C7.132 4 4 7.132 4 11C4 14.867 7.132 18 11 18C12.8204 18.0029 14.5699 17.2941 15.875 16.025L16.025 15.875Z"
                      fill="#222222"/>
            </g>
            <defs>
                <clipPath id="clip0_249_6871">
                    <rect width="24" height="24" fill="white"/>
                </clipPath>
            </defs>
        </svg>
    </div>
    <div class="mt-24">
        <label class="c-gray-dark-low bold-h5">최근 검색어</label>
        <ul class="list-group">
        </ul>
    </div>
    <div class="mt-24">
        <label class="c-gray-dark-low bold-h5">추천 검색어</label>
        <div class="mt-16 _buttons">
            <c:forEach var="keyword" items="${RECOMMEND_KEYWORDS.get(0).keywords}">
                <button type="button" class="btn btn-brand-opacity btn-md btn-hashtag medium-p1"
                        data-href="/search/${keyword}">
                        ${keyword}
                </button>
            </c:forEach>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        let latest_buttons = document.querySelectorAll('#tab-search .list-group .list-group-item');
        latest_buttons.forEach(function (latest_button) {
            latest_button.querySelector('svg').addEventListener('click', function (event) {
                let list_item = this.closest('.list-group-item');
                list_item.remove();
            });
        });
    });
</script>