<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="baseURL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<script type="text/javascript" src="${baseURL}/resources/js/jquery/jquery-1.8.3.js"></script>
    <link href="${baseURL}/resources/css/reset.css" rel="stylesheet" type="text/css"/>
    <link href="${baseURL}/resources/css/main.css" rel="stylesheet" type="text/css"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Логін</title>
    <style>
        .container{
            position: absolute;
            top: 0;
            border-top: 0;;
            opacity: 0.9;
            background: #333333;
            width: 100%;
            height: 100%;
        }
        .autor{
            width: 400px;
            background: #fff;
            margin: 0 auto;
            margin-top: 100px;
            padding: 50px;
            border: solid 1px #ccc;
            border-radius: 10px;
        }
        .password{
            width: 320px;
        }
        .autor input[type="text"],input[type="password"]{
            width: 300px;
            height: 30px;
            color: #555;
            border: solid 1px #ccc;
            box-shadow: inset 0 1px 1px rgba(0,0,0,0.075);
            border-radius: 5px;
            margin: 10px;
            padding: 4px 6px;
        }
        #password{
            width: 200px;
        }
        .autor input[type="submit"]{
            margin-top: 10px;
            color: #fff;
            width: 87px;
            height: 30px;
            line-height: 15px;
            display: inline-block;
            text-shadow: 0 -1px 0 rgba(0,0,0,0.25);
            border-radius: 5px;
            background-image: linear-gradient(to bottom,#62c462,#51a351);
            background-repeat: repeat-x repeat-y;
            border-color: rgba(0,0,0,0.1) rgba(0,0,0,0.1) rgba(0,0,0,0.25);
        }
        .register a{
            color: #fff;
            text-decoration: none;
            line-height: 30px;
            padding-left: 15px;
            padding-right: 15px;
            display: inline-block;
            border-radius: 5px;
            margin: 10px;
            background: #39b3d7;
            border: solid 1px #21afd6;

        }
    </style>
</head>

<body >
<div class="container">
    <div class="autor">
        <form action="<c:url value='${baseURL}/j_spring_security_check' />" method='POST'>
            <div class="login">
                <input type='text' name='j_username'  placeholder="введіть логін" >
            </div>
            <div class="password">
                <input  id="password" type='password' name='j_password' placeholder="введіть пароль">
                <input type="submit" value="Увійти"/>
            </div>

        </form>
        <div class="register"><a href="${baseURL}/users/register">Зареєструватися</a></div>
    </div>
</div>
<%--<form name='f' action="<c:url value='${baseURL}/j_spring_security_check' />" method='POST'>
    Логін: <input type='text' name='j_username' value=''><br/>
    Пароль:<input type='password' name='j_password'/><br/>
    <input name="submit" type="submit" value="ОК"/> <input name="reset" type="reset" value="скинути"/>
</form>
<a href="${baseURL}/users/register">Зареєструватися</a>--%>
</body>

</html>

