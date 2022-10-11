<%@ tag import="com.util.Format" %>
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<%
    System.out.println("jsp Test : " + value);
%>
<%=Format.deformatTexareaContent(value) %>