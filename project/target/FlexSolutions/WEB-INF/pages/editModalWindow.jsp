<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Edit User</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
    <script defer src="https://use.fontawesome.com/releases/v5.12.1/js/all.js"></script>
</head>
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }


    body {
        font-family: 'Montserrat', sans-serif;
        font-size: 16px;
        color: #323232;
        background-color: #efefef;
    }

    .string .data {
        text-align: center;
        width: 25%;
    }


    .data_button {
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



    header {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        z-index: 100;
        box-shadow: 0 5px 30px #cdcdcd;
    }

    header > .string {
        font-weight: 700;
        height: 50px;
        display: flex;
        align-items: center;
    }

    .modal-wrapper,
    .modal-wrapper-edit {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: rgba(21, 21, 21, 0.85);
        z-index: 1000;
    }

    .modal-wrapper form,
    .modal-wrapper-edit form {
        width: 450px;
        background-color: #fff;
        padding-bottom: 15px;
        border-radius: 6px;
    }

    .modal-wrapper form .form-head,
    .modal-wrapper-edit .form-head {
        background-color: #4488aa;
        color: #fff;
        font-weight: 700;
        text-align: center;
        padding: 20px;
        position: relative;
        border-radius: 6px 6px 0 0;
    }


    .modal-wrapper form fieldset,
    .modal-wrapper-edit form fieldset {
        border: none;
        padding: 30px 30px 15px 30px;
        text-align: center;
    }

    .modal-wrapper form fieldset input,
    .modal-wrapper form fieldset button,
    .modal-wrapper-edit form fieldset input,
    .modal-wrapper-edit form fieldset button {
        width: 100%;
        border: none;
        outline: none;
        border-radius: 6px;
    }

    .modal-wrapper form fieldset input:focus,
    .modal-wrapper-edit form fieldset input:focus {
        border-color: #ffbd69;
    }

    .modal-wrapper form fieldset button,
    .modal-wrapper-edit form fieldset button{
        margin-top: 10px;
        background-color: #ffbd69;
    }

    .modal-wrapper form fieldset button:hover,
    .modal-wrapper-edit form fieldset button:hover {
        background-color: #efad59;
    }

    .modal-wrapper form fieldset input,
    .modal-wrapper-edit form fieldset input {
        padding: 15px;
        border: solid 1px #dedede;
        margin-bottom: 15px;
    }

    .container {
        margin-top: 50px;
        padding-bottom: 100px;
    }
</style>
<body>

<c:url var="redirect" value="save/${pageId}"/>
<div class="modal-wrapper-edit">
    <form:form action="${redirect}" commandName="student">
        <div class="form-head">
            <span class="form-title">Edit student's data</span>
        </div>
        <fieldset>
            <form:hidden path="id"/>
            <form:input path="name"/>
            <form:input path="surname"/>
            <form:input path="age"/>
            <form:input path="dateOfBirth"/>
            <form:input path="faculty"/>
            <button type="submit" class="data_button">Edit data</button>
        </fieldset>
    </form:form>
</div>
</body>
</html>


