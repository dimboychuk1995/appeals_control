<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="baseURL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Звернення громадян</title>
    <script>
        $(function () {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            if (month == 1) {
                month = 12;
                year--;
            } else {
                month--;
            }
            $('select[name=month]').val(month);
            $('select[name=year]').val(year);
        })
    </script>
</head>

<body>
<form action="${baseURL}/reports/report2" method="GET">
    <div class="row">
        <label class="label-for-report">Інформація про дотримання термінів:</label>
        <select name="month" style="width: 100px; margin-left: 20px;">
            <c:forEach var="month" items="${months}">
                <option value="${month.key}">${month.value}</option>
            </c:forEach>
        </select>
        <select name="year" style="width: 100px;margin-left: 20px;">
            <c:forEach var="year" items="${years}">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>
        <button class="submit">сформувати</button>
    </div>
</form>
<form action="${baseURL}/reports/report3" method="GET">
    <div class="row">
        <label class="label-for-report">Звіт по наданих відповідях:</label>
        <select name="month" style="width: 100px; margin-left: 20px;">
            <c:forEach var="month" items="${months}">
                <option value="${month.key}">${month.value}</option>
            </c:forEach>
        </select>
        <select name="year" style="width: 100px;margin-left: 20px;">
            <c:forEach var="year" items="${years}">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>
        <button class="submit">сформувати</button>
    </div>
</form>
<form action="${baseURL}/reports/report4" method="GET">
    <div class="row">
        <label class="label-for-report">Звіт по листах, термін надання відповіді по яких не вийшов</label>
        <select name="month" style="width: 100px; margin-left: 20px;">
            <c:forEach var="month" items="${months}">
                <option value="${month.key}">${month.value}</option>
            </c:forEach>
        </select>
        <select name="year" style="width: 100px;margin-left: 20px;">
            <c:forEach var="year" items="${years}">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>
        <button class="submit">сформувати</button>
    </div>
</form>
<form action="${baseURL}/reports/report5" method="GET">
    <div class="row">
        <label class="label-for-report">Звіт по листах, відповідь по яких не надана у визначений термін</label>
        <select name="month" style="width: 100px; margin-left: 20px;">
            <c:forEach var="month" items="${months}">
                <option value="${month.key}">${month.value}</option>
            </c:forEach>
        </select>
        <select name="year" style="width: 100px;margin-left: 20px;">
            <c:forEach var="year" items="${years}">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>
        <button class="submit">сформувати</button>
    </div>
</form>
</body>

</html>

