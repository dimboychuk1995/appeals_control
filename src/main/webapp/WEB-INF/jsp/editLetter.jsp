<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="baseURL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <script type="text/javascript" src="${baseURL}/resources/js/edit.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Звернення громадян</title>
    <script type="text/javascript">
        $(document).ready(function () {
                    $('.date').datepicker();
                }
        );

    </script>
</head>

<body>

<script type="text/javascript"></script>

<%--<p>Редагування зверненя</p>--%>
    <ul class="tabs">
        <li class="current-tabs" link="in-letter">вхідний лист</li>
        <li link="out-letter">вихідний лист</li>
        <li link="remind">нагадування</li>
    </ul>

<form:form method="POST" action="${baseURL}/appeal/edit/${appeal.id}" modelAttribute="appeal" id="form-add">
<div class="for-tabs in-letter">
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
            <form:options items="${type_appeals}" itemValue="id" itemLabel="name"/>
        </form:select>

    </div>
    <div class="row">
        <label>Призначений виконавець</label>
        <form:input path="executor"/>
    </div>
    <div class="row">
        <label>Примітка</label>
        <form:input path="note"/>
    </div>
 </div>
<div class="for-tabs out-letter">
    <div class="row">
        <label>Вих.№</label>
        <label><form:input path="out_number"/></label>
    </div>
    <div class="row">
        <label>Дата</label>
        <form:input path="out_date" cssClass="date date-out"/>
    </div>
    <div class="row">
        <label>За підписом</label>
        <form:select path="signature.id">
            <form:option value="0">&nbsp;</form:option>
            <form:options items="${signatures}" itemValue="id" itemLabel="signature"/>
        </form:select>

    </div>
    <div class="row">
        <label>Зміст відповіді</label>
        <label><form:input path="text_answer"/></label>
    </div>
    <div class="row">
        <label>Термін надання відповіді, дн.</label>
        <form:input path="term_answer"/>
    </div>
    <div class="row">
        <label>Кінцевий термін</label>
        <form:input path="deadline_term" cssClass="date"/>
    </div>
    <div class="row">
        <label>Відповідь надіслана у термін, дн.</label>
        <form:input path="response_term" cssClass="response_term"/>
    </div>
    <div class="row">
        <label>Працівник канцелярії, який зареєстрував вхідний лист</label>
        <form:input path="employee"/>
    </div>
</div>
<div class="for-tabs remind">
    <div class="row">
        <label>По телефону:</label>
        <form:input path="reminder_telephone" cssClass="insertDate remind_input" style="width:165px;" readonly="true"/>
        <form:checkbox path="telephone_check" cssClass="checkbox-reminder"/>
    </div>
    <div class="row">
        <label>По email:</label>
        <form:input path="email" placeholder="@email" style="width:165px;"/>
        <form:input path="reminder_email" readonly="true" cssClass="remind_input" style="width:165px;" placeholder="дата"/>
        <form:checkbox path="email_check" onclick="return false"/>
        <security:authorize access="hasAnyRole('ADMIN', 'EXECUTOR')">
        <a href="#" id="sendEmail">Відправити</a>
        </security:authorize>
    </div>
    <div class="row">
        <label>Через SC:</label>
        <form:input path="reminder_sc" cssClass="synergyDate remind_input" style="width:165px;" readonly="true"/>
        <form:checkbox path="sc_check" cssClass="synergyCheckbox"/>
    </div>
</div>
    <security:authorize access="hasAnyRole('ADMIN', 'EXECUTOR')">
    <input type="submit" value="Зберегти"/>
    <a href="${baseURL}/appeal/delete/${appeal.id}" class="submit delete" onclick="return confirmDelete()">Видалити</a>
    </security:authorize>
</form:form>

<%--<script>
    $('#form-add').submit(function () {
        var check = false;
        $('#form-add input[type="text"],select').each(function (index) {
            if ($(this).val().length < 1 || $(this).val() == 0) {
                check = check + 1;
                $(this).css({border: "solid 1px red"});
            } else {
                $(this).css({border: "solid 1px #ccc"});
            }


        });
        if (check) {
            return false;
        }
    });

</script>--%>
</body>

</html>

