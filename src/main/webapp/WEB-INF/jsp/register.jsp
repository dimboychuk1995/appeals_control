﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="baseURL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<script type="text/javascript" src="${baseURL}/resources/js/jquery/jquery-1.8.3.js"></script>
    <script src="${baseURL}/resources/js/register.js"></script>
    <script src="${baseURL}/resources/js/jquery.bpopup.min.js"></script>
    <link href="${baseURL}/resources/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="${baseURL}/resources/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="${baseURL}/resources/css/register.css" rel="stylesheet" type="text/css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Логін</title>
</head>
<body>
<div class="container">
    <div class="autor">
        <form:form method="GET" action="${baseURL}/users/register" modelAttribute="user">
            <div class="row">
                <label>Логін Windows</label>
                <input type="text" name="login_w" class="text">
            </div>
            <div class="row">
                <label>Пароль Windows</label>
                <input type="password" name="pass_w" class="passForActiveDirectory">&nbsp;&nbsp;&nbsp;
            </div>
            <div class="register">
                <span class="active-directory">увійти</span>
            </div>

            <div id="reg_form" style="display: none; visibility: visible;">
                <div class="row">
                    <label>П.І.Б.</label>
                    <form:input path="fullname"  style="border:1px solid red;" placeholder="введіть прізвище для пошуку особи"/>
                    <br>
                    <div id="search">
                        <div class="register">
                            <span onclick="loadUser()" class="findUser">Знайти</span>
                        </div>
                    </div>
                </div>
                <div class="row2">
                    <label>Табельний номер</label>
                    <form:input path="tab_num"  readonly="readonly"/>
                </div>
                <div class="row2">
                    <label>Посада</label>
                    <form:input path="job_position"  readonly="readonly"/>
                </div>
                <div class="row2">
                    <label>Email</label>
                    <form:input path="email"  value=""/>
                </div>
                <div class="row2">
                    <label>Логін</label>
                    <form:input path="login" placeholder="Введіть логін"/>
                </div>
                <div class="row2">
                    <label>пароль</label>
                    <form:password path="password" id="somePassword" value="" placeholder="введіть пароль"/>
                </div>
                <div class="row2">
                    <label>повіторіть пароль</label>
                    <input name="repeat_pasword" type="password" value="" placeholder="повторіть пароль">
                </div>
                <input type="submit" id="register-submit" value="зареєструватися">

            </div>
        </form:form>
    </div>
</div>
<div id="element_to_pop_up" style="display:none; position: relative;">
    <span class="b-close">X</span>
    <div id="personSearch_loader">
        <div>
            <img src="${baseURL}/resources/img/loader.gif" alt="завантаження даних" />
        </div>
    </div>
    <div id="rez_search" style="height:550px; overflow: auto;"></div>
    <div class="apply">
        <span>ок</span>
    </div>
</div>
</body>
</html>

