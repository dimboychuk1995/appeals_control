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
        window.onload = function(){

            var currentMenu = "${activeItem}";
            if (currentMenu){
                $('li[link=${activeItem}]').addClass('current-tabs');
                $('.for-tabs').hide();
                var link = "."+$('.current-tabs').attr('link');
                $(link).show();
            };


            $('.tabs li').click(function(){
                var link = "."+$(this).attr('link');
                $('.tabs li').removeClass('current-tabs');
                $(this).addClass('current-tabs');
                console.log(link);
                $('.for-tabs').hide();
                $(link).show();
            });
            $('#typeAppeals').change(function(){
                var id = $(this).val();
                if(parseInt(id)){
                    $.ajax({
                        url: '/appeals/dictionary/getTypeAppeal/'+id,
                        type: 'POST',
                        dataType: 'json',
                        success: function(data){
                            $('#edit_hidden_typeAppeals_id').val(data.id);
                            $('#edit_name').val(data.name);
                            $('#edit_term_to_answer').val(data.term_to_answer);
                            $('#edit_reminder_term').val(data.reminder_term);
                        }
                    })

                }else{
                    $('#edit_hidden_typeAppeals_id').val('');
                    $('#edit_name').val('');
                    $('#edit_term_to_answer').val('');
                    $('#edit_reminder_term').val('');
                }
            });

            $('#signature_select').change(function(){

                var id = $(this).val();
                if(parseInt(id)){
                    $.ajax({
                        url: '/appeals/dictionary/getSignature/'+id,
                        type: 'POST',
                        dataType: 'json',
                        success: function(data){
                            $('#signature_id').val(data.id);
                            $('#signature_signature').val(data.signature);
                        }
                    })

                }else{
                    $('#signature_id').val('');
                    $('#signature_signature').val('');
                }
            });

        }
    </script>
</head>

<body>
<ul class="tabs tabs-new-appeals">
    <li link="add-new-appeals">Види звернень</li>
    <li link="add-new-director">Список осіб, що підписують листи</li>
</ul>
<div class="for-tabs add-new-appeals">
    <div class="row" style="margin-top: 50px">
        <div class="offset4 span4 title-in-tabs" style="float: none">
            Редагування існуючих типів звернень
        </div>
    </div>


    <form:form method="POST" action="${baseURL}/dictionary/editTypeAppeal" modelAttribute="typeAppeal">
        <div class="row">
            <select style="margin-left: 230px" id="typeAppeals">
                <option value="0">виберіть тип звернення</option>
                <c:forEach items="${typeAppealList}" var="typeAppeal">
                    <option value="${typeAppeal.id}">${typeAppeal.name}</option>
                </c:forEach>
            </select>
        </div>
        <form:hidden path="id" id="edit_hidden_typeAppeals_id"/>
        <div class="row">
            <label>Назва</label>
            <form:input type="text" required="true" path="name" id="edit_name"/>
        </div>
        <div class="row">
            <label>Термін відповіді</label>
            <form:input type="number" path="term_to_answer" min="1" max="100" required="true" id="edit_term_to_answer"/>
        </div>
        <div class="row">
            <label>Строк нагадування</label>
            <form:input type="number" path="reminder_term" min="1" max="100" required="true" id="edit_reminder_term"/>
            <input type="submit" value="Зберегти" style="margin-left: 125px;">
        </div>
    </form:form>
    <hr style="border: dashed 1px #ccc">
    <div class="row" style="margin-top: 10px">
        <div class="offset4 span4 title-in-tabs" style="float: none">
            Добавлення нового типу звернення
        </div>
    </div>
    <form:form method="POST" action="${baseURL}/dictionary/addTypeAppeal" modelAttribute="typeAppeal">
        <div class="row">
            <label>Назва</label>
            <form:input path="name" required="true"/>
        </div>
        <div class="row">
            <label>Термін відповіді</label>
            <form:input type="number" path="term_to_answer" min="1" max="100" required="true"/>
        </div>
        <div class="row">
            <label>Строк нагадування</label>
            <form:input type="number" path="reminder_term" min="1" max="100" required="true"/>
            <button class="submit"  style="margin-left: 140px;">додати</button>
        </div>

    </form:form>
</div>
<div class="for-tabs add-new-director">
    <div class="row" style="margin-top: 50px">
        <div class="offset4 span4 title-in-tabs" style="float: none">
           Редагування ПІБ Осіб
        </div>
    </div>

    <form:form method="POST" action="${baseURL}/dictionary/editSignature" modelAttribute="signature" style="margin-left:100px">
        <form:hidden path="id" id="signature_id"/>
        <div class="row">
            <select style="margin-left: 229px" id="signature_select">
                <option value="0">виберіть особу</option>
                <c:forEach items="${signaturesList}" var="signature">
                    <option value="${signature.id}">${signature.signature}</option>
                </c:forEach>
            </select>
        </div>
            <div class="row">
                <label>ПІБ</label>
                <form:input path="signature" id="signature_signature" required="true"/>
            </div>

        <input type="submit" value="Зберегти">
    </form:form>
    <hr style="border: dashed 1px #ccc; margin-top: 20px">
    <div class="row" style="margin-top: 10px">
        <div class="offset4 span4 title-in-tabs" style="float: none">
            Добавлення нових осіб
        </div>
    </div>
    <form:form method="POST" action="${baseURL}/dictionary/addSignature" modelAttribute="signature" style="margin-left:100px">
        <div class="row">
            <label>ПІБ</label>
            <form:input path="signature" required="true"/>
        </div>
        <button class="submit">додати</button>
    </form:form>
</div>


</body>

</html>

