<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag import="java.time.format.DateTimeFormatter" %>
<%@ tag import="java.util.regex.Pattern" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<%
    String result;
    String regex = "^[0-9]{8}";
    Pattern pattern = Pattern.compile(regex);
    if(pattern.matcher(value).matches()) {
        result = value.substring(0, 4) + "년 " + value.substring(4, 6) + "월 " + value.substring(6) + "일";
    } else {
        result = value;
    }
%>
<%= result %>