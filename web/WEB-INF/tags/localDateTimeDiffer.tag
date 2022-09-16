<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag import="java.time.LocalDateTime" %>
<%@ tag import="java.time.Duration" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" required="true" type="java.time.LocalDateTime" %>
<%
    boolean bool = false;
    if(value != null) {
        bool = Duration.between(value, LocalDateTime.now()).toDays() > 1;
    }
    System.out.println(9/4);
%>
<%= bool %>