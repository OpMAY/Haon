<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag import="java.time.format.DateTimeFormatter" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<%
    String result;
    if (value != null) {
        System.out.println(value);
        try {
            String year = value.substring(0, value.indexOf("년"));
            String month = value.substring(value.indexOf("년") + 2, value.indexOf("월"));
            String day = value.substring(value.indexOf("월") + 2, value.indexOf("일"));
            result = year + "-" + month + "-" + day;
        } catch (Exception e) {
            result = "-";
        }
    } else {
        result = "-";
    }
%>
<%= result %>