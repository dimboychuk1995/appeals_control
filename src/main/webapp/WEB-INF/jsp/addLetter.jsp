<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="baseURL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Звернення громадян</title>
    <script type="text/javascript" src="${baseURL}/resources/js/add.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
                    $('.date').datepicker();
                }
        );

    </script>
</head>

<body>
<p>Додати нове звернення</p>
<form:form method="POST" action="${baseURL}/appeal/add" modelAttribute="appeal" id="form-add">
    <div class="row">
        <label>Вхідний №</label>
        <form:input path="in_number"/>
    </div>
    <div class="row">
        <label>Дата</label>
        <form:input path="in_date" cssClass="date date-in"/>
    </div>
    <div class="row">
        <label>Від кого</label>
        <form:input path="customer"/>
    </div>
    <div class="row">
        <label>Зміст звернення</label>
        <form:input path="text_appeal"/>
    </div>
    <div class="row">
        <label>Вид зверненя</label>
        <form:select path="type_appeal.id" id="type_appeal_id">
            <form:options items="${type_appeals}" itemValue="id" itemLabel="name" />
        </form:select>
    </div>
    <div class="row">
        <label>Призначений виконавець</label>
        <form:input path="executor"/>
    </div>
    <div class="row">
        <label>Термін надання відповіді, дн.</label>
        <form:input path="term_answer" id="term_answer"/>
    </div>
    <div class="row">
        <label>Кінцевий термін</label>
        <form:input path="deadline_term" cssClass="date" id="deadline_term"/>
    </div>
    <div class="row">
        <label>Примітка</label>
        <form:input path="note"/>
    </div>
    <input type="submit" value="Додати"/>
</form:form>

<script>
    $('#form-add').submit(function(){
        var check = false;
        $('#form-add input[type="text"]:not(input[name="note"]),select').each(function(index) {
            if ($(this).val() == null || $(this).val().length < 1 || $(this).val() == 0 ) {
                check = check + 1;
                $(this).css({border: "solid 1px red"});
            }else{
                $(this).css({border: "solid 1px #ccc"});
            }


        });
        if (check) {
            return false;
        }
    });

</script>
<%--
<form:form method="POST" action="${baseURL}/appeal/add" modelAttribute="appeal">
    <table>
        <tr>
            <td>Вхідний №</td>
            <td><form:input path="in_number"/></td>
        </tr>
        <tr>
            <td>Дата</td>
            <td><form:input path="in_date" cssClass="date"/></td>
        </tr>
        <tr>
            <td>Від кого</td>
            <td><form:input path="customer"/></td>
        </tr>
        <tr>
            <td>Зміст звернення</td>
            <td><form:input path="text_appeal"/></td>
        </tr>
        <tr>
            <td>Вид зверненя</td>
            <td>
                <form:select path="type_appeal.id" >
                    <form:options items="${type_appeals}"  itemValue="id" itemLabel="name"/>
                </form:select>
            </td>
        </tr>
        <tr>
            <td>Призначений виконавець</td>
            <td><form:input path="executor"/></td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" value="Додати"/>
            </td>
        </tr>
    </table>
</form:form>
--%>

</body>

</html>

