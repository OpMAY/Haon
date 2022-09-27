<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag import="java.time.format.DateTimeFormatter" %>
<%@ tag import="com.util.Format" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<%
    if (value.length() > 200) {
        value = Format.summernoteHTMLToString(value.substring(0, 200));
    } else {
        value = Format.summernoteHTMLToString(value);
    }
    value = value.replaceAll("'","");
%>
<%= value %>