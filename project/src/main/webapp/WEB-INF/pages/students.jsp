<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Test task for FlexSolutions by Aleksey Shyshyma</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <script defer src="https://use.fontawesome.com/releases/v5.12.1/js/all.js"></script>
</head>
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        text-decoration: none;
    }

    body
    {
        font-family: 'Montserrat', sans-serif;
        font-size: 16px;
        color: #323232;
        background-color: #efefef;
    }

    .string
    {
        background-color: #fff;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: solid 1px #dedede;
    }

    .string .data
    {
        text-align: center;
        width: 25%;
    }

    .string-items
    {
        width: calc(100% - 275px);
        display: flex;
    }

    .data_button
    {
        width: 150px;
        height: 50px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 15px;
        background-color: #4488aa;
        border-radius: 6px;
        color: #fff;
        font-weight: 700;
        border: none;
        cursor: pointer;
        transition: 0.3s;
        text-decoration: none;
    }

    .string-buttons
    {
        display: flex;
        justify-content: space-between;
        width: 275px;
        padding: 20px 30px 20px 30px;
        border-left: solid 1px #dedede;
    }

    .data_button-edit
    {
        background-color: #ffbd69;
    }

    .data_button-edit:hover
    {
        background-color: #efad59;
    }

    .data_button-delete
    {
        background-color: #fe346e;
        position: relative;
        width: 50px;
    }

    .data_button-delete:hover
    {
        background-color: #ee245e;
    }

    .data_button-download
    {
        margin-left: 15px;
        background-color: #B59076;
    }

    .bottom-pad
    {
        position: fixed;
        bottom: 0;
        right: 0;
        left: 0;
        border-top: solid 1px #dedede;
        padding: 0 30px 0 30px;
        display: flex;
        background-color: #fff;
        height: 100px;
        align-items: center;
        display: flex;
        justify-content: space-between;
        box-shadow: 0 5px 30px #cdcdcd;
    }

    .data_button-add:hover
    {
        background-color: #34789a;
    }

    .data_button-download:hover
    {
        background-color: #a58066;
    }

    .data_button-delete::before
    {
        content: '';
        width: 22px;
        height: 4px;
        background-color: #fff;
        position: absolute;
        top: calc(50% - 2px);
        left: calc(50% - 11px);
        transform: rotate(-45deg);
        border-radius: 2px;
    }

    .data_button-delete::after
    {
        content: '';
        width: 22px;
        height: 4px;
        background-color: #fff;
        position: absolute;
        top: calc(50% - 2px);
        left: calc(50% - 11px);
        transform: rotate(45deg);
        border-radius: 2px;
    }

    header
    {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        z-index: 100;
        box-shadow: 0 5px 30px #cdcdcd;
    }

    header > .string
    {
        font-weight: 700;
        height: 50px;
        display: flex;
        align-items: center;
    }

    .modal-wrapper,
    .modal-wrapper-edit
    {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        display: none;
        justify-content: center;
        align-items: center;
        background-color: rgba(21, 21, 21, 0.85);
        z-index: 1000;
    }

    .modal-wrapper form,
    .modal-wrapper-edit form
    {
        width: 450px;
        background-color: #fff;
        padding-bottom: 15px;
        border-radius: 6px;
    }

    .modal-wrapper form .form-head,
    .modal-wrapper-edit .form-head
    {
        background-color: #4488aa;
        color: #fff;
        font-weight: 700;
        text-align: center;
        padding: 20px;
        position: relative;
        border-radius: 6px 6px 0 0;
    }

    .form-times
    {
        position: absolute;
        top: calc(50% - 15px);
        right: 15px;
        width: 30px;
        height: 30px;
        border: none;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: transparent;
        cursor: pointer;
    }

    .form-times .a,
    .form-times .b
    {
        position: absolute;
        width: 18px;
        height: 4px;
        background-color: #fff;
        border-radius: 2px;
    }

    .form-times .a
    {
        transform: rotate(-45deg);
    }

    .form-times .b
    {
        transform: rotate(45deg);
    }

    .modal-wrapper form fieldset,
    .modal-wrapper-edit form fieldset
    {
        border: none;
        padding: 30px 30px 15px 30px;
        text-align: center;
    }

    .modal-wrapper form fieldset input,
    .modal-wrapper form fieldset button,
    .modal-wrapper-edit form fieldset input,
    .modal-wrapper-edit form fieldset button
    {
        width: 100%;
        border: none;
        outline: none;
        border-radius: 6px;
    }

    .modal-wrapper form fieldset input:focus,
    .modal-wrapper-edit form fieldset input:focus
    {
        border-color: #ffbd69;
    }

    .modal-wrapper form fieldset button,
    .modal-wrapper-edit form fieldset button
    {
        margin-top: 10px;
        background-color: #ffbd69;
    }

    .modal-wrapper form fieldset button:hover,
    .modal-wrapper-edit form fieldset button:hover
    {
        background-color: #efad59;
    }

    .modal-wrapper form fieldset input,
    .modal-wrapper-edit form fieldset input
    {
        padding: 15px;
        border: solid 1px #dedede;
        margin-bottom: 15px;
    }

    .container
    {
        margin-top: 50px;
        padding-bottom: 100px;
    }

    .pagination
    {
        display: flex;
        justify-content: flex-end;
    }


    .pagination a
    {
         width: 35px;
         height: 35px;
         border-radius: 50%;
         background-color: #555;
         color: #fff;
         margin-left: 8px;
         border: none;
         cursor: pointer;
         font-weight: bold;
         text-decoration: none;
         display: flex;
        justify-content: center;
        align-items: center;
     }

    .pagination a:hover
    {
        background-color: #323232;
        color: #fff;
    }

    .buttons_row
    {
        display: flex;
    }

    .paginnnation {
        display: inline-block;
        color: black;
        float: left;
        padding: 8px 16px;
        margin-left: 8px;
        text-decoration: none;
        background-color: #4CAF50;
        color: white;
    }



</style>
<body>
<c:url var="addAction" value="/students/add"/>
<div class="modal-wrapper">
    <form:form action="${addAction}" commandName="student">
        <div class="form-head">
            <span class="form-title">Add new student</span>
            <div class="form-times">
                <div class="a"></div>
                <div class="b"></div>
            </div>
        </div>
        <fieldset>
            <form:input path="name" placeholder="Name(only eng letters without numbers)"/>
            <form:input path="surname" placeholder="Surname(only eng letters without numbers)"/>
            <form:input path="age" placeholder="Age(integer)"/>
            <form:input path="dateOfBirth" placeholder="Date of birth in format:DD/MM/YEAR"/>
            <form:input path="faculty" placeholder="Department"/>
                <button type="submit" class="data_button">Add Student</button>
        </fieldset>
    </form:form>
</div>
<c:if test="${!empty listStudents}">
<div class="container">
    <header>
        <div class="string">
            <div class="string-items">
                <div class="data">Name</div>
                <div class="data">Surname</div>
                <div class="data">Age</div>
                <div class="data">Date of birth</div>
                <div class="data">Department</div>
            </div>
        </div>
    </header>
    <c:forEach items="${stud}" var="student">
        <div class="string">
            <div class="string-items">
                <div class="data">${student.name}</div>
                <div class="data">${student.surname}</div>
                <div class="data">${student.age}</div>
                <div class="data">${student.dateOfBirth}</div>
                <div class="data">${student.faculty}</div>
            </div>
            <div class="string-buttons">
                <td><a href="<c:url value='/edit/${student.id}/${paggination.pageId}'/>" class="data_button data_button-edit">Edit</a></td>
                <a href="<c:url value='/remove/${student.id}/${paggination.pageId}'/>"><button class="data_button data_button-delete"></button></a>
            </div>
        </div>
    </c:forEach>
    </c:if>
    <div class="bottom-pad">
        <div class="buttons_row">
            <button class="data_button data_button-add">Add Element</button>
            <a href="/downloadXLS"><button class="data_button data_button-download"><i class="fas fa-download" style="margin-right: 5px;"></i>Download</button></a>
        </div>

        <div class="pagination">
            <c:forEach var = "i" begin = "1" end = "${(listStudents.size()/paggination.countOfStudens) + 1}">
            <a href="/studentspage/${i}">${i}</a>
            </c:forEach>
        </div>
</div>
    <script type="text/javascript">
        let editButtons = document.getElementsByClassName('data_button-edit');
        let formTitle = document.getElementsByClassName('form-title')[0];
        let modalWindow = document.getElementsByClassName('modal-wrapper')[0];
        let addButton = document.getElementsByClassName('data_button-add')[0].onclick = function() {
            modalWindow.style.display = 'flex';
            formTitle.innerHTML = "Add Element";
        }
        let closeWindow = document.getElementsByClassName('form-times')[0].onclick = function() {
            modalWindow.style.display = 'none';
        }

        for(let i = 0; i < editButtons.length; i++) {
            editButtons[i].onclick = function() {
                modalWindow.style.display = 'flex';
                formTitle.innerHTML = "Edit Element";
            }
        }
    </script>
</body>
</html>

