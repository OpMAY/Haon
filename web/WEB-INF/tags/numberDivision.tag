<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag import="java.time.LocalDateTime" %>
<%@ tag import="java.time.Duration" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" required="true" type="java.lang.Integer" %>
<%@ attribute name="divide" required="true" type="java.lang.Integer" %>
<%@ attribute name="share" required="true" type="java.lang.Boolean" %>
<%
    Integer result = null;
    if (value != null && divide != null) {
        if (share) {
            result = value / divide;
        } else {
            result = value % divide;
        }
    }
%>
<%= result %>