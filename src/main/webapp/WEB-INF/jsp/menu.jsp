<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="baseURL" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <script type="text/javascript">
        $(document).ready(function () {
        var currenrMenu = "${active}";
        if (currenrMenu){
                        $('.${active}').addClass('current-menu');
   }
                }
        );

    </script>
</head>
<body>
<div class="header">
    <div class="title1"><h1>Контроль</h1></div>
    <div class="title2"><h1>термінів</h1></div>
    <div class="header-nav">
        <div class="row">
                <div class="span2 menu main"><a href="${baseURL}">Головна</a></div>
            <security:authorize access="hasAnyRole('ADMIN', 'EXECUTOR')">
                <div class="span2 menu addAppeal"><a href="${baseURL}/appeal/add">Нове зверення</a></div>
            </security:authorize>
            <security:authorize access="hasAnyRole('ADMIN', 'EXECUTOR')">
                <div class="span2 menu reports"><a href="${baseURL}/reports">Звіти</a></div>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <div class="span2 menu dictionary"><a href="${baseURL}/dictionary">Довідники</a></div>
            </security:authorize>
            <div class="span2 menu"><a href="${baseURL}/j_spring_security_logout">Вийти</a></div>
        </div>
    </div>
</div>
</body>
</html>
