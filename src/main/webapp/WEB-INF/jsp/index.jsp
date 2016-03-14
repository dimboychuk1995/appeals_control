<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="baseURL" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<head>
	<link rel="stylesheet" type="text/css" media="screen" href="${baseURL}/resources/css/jquery/redmond/jquery-ui-1.9.2.custom.min.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="${baseURL}/resources/css/jqgrid/ui.jqgrid.css" />

	<script type="text/javascript" src="${baseURL}/resources/js/jquery/jquery-1.8.3.js"></script>
	<script type="text/javascript">
	    var jq = $;
	</script>
	<script type="text/javascript" src="${baseURL}/resources/js/jquery/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="${baseURL}/resources/js/jqgrid/grid.locale-ua.js" ></script>
	<script type="text/javascript" src="${baseURL}/resources/js/jqgrid/jquery.jqGrid.min.js"></script>
    <script src="${baseURL}/resources/js/jquery.bpopup.min.js"></script>
    <script type="text/javascript" src="${baseURL}/resources/js/main.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Звернення громадян</title>
	
</head>

<body >

<script type="text/javascript">
	jq(function() {
        jq('.date').datepicker({ dateFormat: 'dd.mm.yy' });
		jq("#grid").jqGrid({
		   	url:'${baseURL}/appeal/getAll',
			datatype: 'json',
			mtype: 'GET',
            colNames:
            [
                '', 'Вх.№', 'Дата', 'Від кого', 'Зміст звернення', 'Вид звернення', 'Призначений виконавець',
                'Вих.№', 'Дата', 'За підписом', 'Зміст відповіді', 'Термін надання відповіді, дн.', 'Кінцевий термін',
                'Відповідь надіслана у термін, дн.', 'Працівник'

            ],
            colModel: [
                {name: 'id', index: 'id', width: 25, formatter: returnHyperLink,sortable:false,search:false},
                {name: 'in_number', index: 'in_number', width: 130},
                {name: 'in_date', index: 'in_date', width: 130, sorttype:'date',formatter: 'date',searchrules:{date:true}},
                {name: 'customer', index: 'customer', width: 130},
                {name: 'text_appeal', index: 'text_appeal', width: 130},
                {name: 'type_appeal.name', index: 'name', width: 130},
                {name: 'executor', index: 'executor', width: 130},
                {name: 'out_number', index: 'out_number', width: 130},
                {name: 'out_date', index: 'out_date', width: 130, sorttype:'date',formatter: 'date'},
                {name: 'signature.signature', index: 'signature', width: 130},
                {name: 'text_answer', index: 'text_answer', width: 130},
                {name: 'term_answer', index: 'term_answer', width: 130},
                {name: 'deadline_term', index: 'deadline_term', width: 130, sorttype:'date',formatter: 'date'},
                {name: 'response_term', index: 'response_term', width: 130,sorttype:'integer'},
                {name: 'employee', index: 'employee', width: 130}

            ],
		   	postData: {
			},
			rowNum:20,
		   	rowList:[20,40,60],
		   	height: 250,
		  	autowidth: true,
            shrinkToFit:false,
			rownumbers: true,
		   	pager: '#pager',
		   	sortname: 'in_date',
		    viewrecords: true,
		    sortorder: "desc",
		    caption:"Звернення",
		    emptyrecords: "Порожній список",
            hidegrid: false,
            loadonce: false,
		    loadComplete: function() {
			},
		    jsonReader : {
		        root: "rows",
		        page: "page",
		        total: "total",
		        records: "records",
		        repeatitems: false,
		        cell: "cell",
		        id: "id"
		    },
            afterInsertRow: function(id, data)
            {
               if(data.out_number==null) {
                    $('tr#' + id).css({color:'red'});
                }
            }
		});

        jq("#grid").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : true, defaultSearch:"bw"}

        );
        function returnHyperLink(cellValue, options, rowdata, action)
        {
            return "<a href='${baseURL}/appeal/edit/" + cellValue + "' ><img src='${baseURL}/resources/img/edit.png' width='20' height='21'></a>";
        }

        jq("#grid").jqGrid('navGrid','#pager',
				{edit:false,add:false,del:false,search:true},
				{ },
		        { },
		        { }, 
				{ 
			    	sopt:['eq', 'ne', 'lt', 'gt', 'cn', 'bw', 'ew','nu'],
			        closeOnEscape: true, 
			        	multipleSearch: true, 
			         	closeAfterSearch: true }
		);



	});
</script>
<div class="user">
    <div></div>
    ${currentUser}
</div>
<a href="${baseURL}/reports/reportAll">
<div class="xls">
    <div></div>
    Експорт в xls
</div>
</a>
<div class="overtime" id="expired">
    протерміновані
</div>
<div id="jqgrid" style="margin-top: 37px;">
	<table id="grid"></table>
	<div id="pager"></div>
</div>

<div id="dialog" title="Feature not supported" style="display:none">
	<p>Вибачте, ваш браузер не підтримується!.</p>
</div>
<c:if test="${not empty reminderList}">
<div id="element_to_pop_up" style="display:none; position: relative;">
    <p>Нагадування відповідей</p>
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Вхідний номер</th>
            <th>Кінцевий термін</th>
            <th>Замовник</th>
            <th>Зміст звернення</th>
            <th>Виконавець</th>
            <th>Працівник</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="appeal" items="${reminderList}">
            <tr>
                <td><a href="${baseURL}/appeal/edit/${appeal.id}"><img src="/appeals/resources/img/edit.png" width="20" height="21" /></a></td>
                <td>${appeal.in_number}</td>
                <td><fmt:formatDate pattern="dd.MM.yyyy"
                                    value="${appeal.deadline_term}"/></td>
                <td>${appeal.customer}</td>
                <td>${appeal.text_appeal}</td>
                <td>${appeal.executor}</td>
                <td>${appeal.employee}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
    <span class="b-close">X</span>
</div>
</c:if>
<c:if test="${not empty expiredList}">
<div id="expired_element_to_pop_up" style="display:none; position: relative;">
    <p style="color: red">Протерміновані відповіді</p>
    <table class="table">
        <thead>
        <tr>
            <th>#</th>
            <th>Вхідний номер</th>
            <th>Дата</th>
            <th>Замовник</th>
            <th>Зміст звернення</th>
            <th>Вид звернення</th>
            <th>Виконавець</th>
            <th>Працівник</th>
        </tr>

        </thead>
        <tbody>
        <c:forEach var="appeal" items="${expiredList}">
            <tr>
                <td><a href="${baseURL}/appeal/edit/${appeal.id}"><img src="/appeals/resources/img/edit.png" width="20" height="21" /></a></td>
                <td>${appeal.in_number}</td>
                <td><fmt:formatDate pattern="dd.MM.yyyy"
                                    value="${appeal.in_date}"/></td>
                <td>${appeal.customer}</td>
                <td>${appeal.text_appeal}</td>
                <td>${appeal.type_appeal.name}</td>
                <td>${appeal.executor}</td>
                <td>${appeal.employee}</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
    <span class="b-close">X</span>
</div>
</c:if>
<script>
    window.onload = function(){
        var place = $('[role="columnheader"].ui-state-default.ui-th-column.ui-th-ltr div')[17];
        // console.log(place);
        $(place).css({background: "url(${baseURL}/resources/img/icon_search.png)","background-size":"cover"});
    }

</script>
</body>

</html>

