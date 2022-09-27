<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String HEADER_TITLE = (String) request.getAttribute("HEADER_TITLE");
    request.setAttribute("HEADER_TITLE", HEADER_TITLE);
%>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
          crossorigin="anonymous">
    <!-- Base -->
    <link rel="stylesheet" href="/resources/css/base/reset.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/base/default.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/base/common.css?vc=${RESOURCES_VERSION}">
    <!-- Theme -->
    <link rel="stylesheet" href="/resources/css/theme/theme.css?vc=${RESOURCES_VERSION}">
    <!-- Layout -->
    <link rel="stylesheet" href="/resources/css/layout/layout.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/layout/res-layout.css?vc=${RESOURCES_VERSION}">
    <!-- Plugin -->
    <link rel="stylesheet" href="/resources/css/plugin/sample.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/plugin/datepicker/bootstrap-datepicker.css?vc=${RESOURCES_VERSION}"/>
    <link rel="stylesheet" href="/resources/css/plugin/owl/owl.carousel.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/plugin/owl/owl.theme.default.css?vc=${RESOURCES_VERSION}">
    <!-- State -->
    <link rel="stylesheet" href="/resources/css/state/state.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/state/res-state.css?vc=${RESOURCES_VERSION}">
    <!-- Module -->
    <link rel="stylesheet" href="/resources/css/module/module.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/module/res-module.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/module/checkbox.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/module/element.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/module/res-element.css?vc=${RESOURCES_VERSION}">
    <link rel="stylesheet" href="/resources/css/module/modal.css?vc=${RESOURCES_VERSION}">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/module/summernote.css">
    <title>${HEADER_TITLE}</title>
</head>