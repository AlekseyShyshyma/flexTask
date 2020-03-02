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

    .string {
        background-color: #fff;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: solid 1px #dedede;
    }

    .string .data {
        text-align: center;
        width: 25%;
    }

    .string-items {
        width: calc(100% - 275px);
        display: flex;
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

    .string-buttons {
        display: flex;
        justify-content: space-between;
        width: 275px;
        padding: 20px 30px 20px 30px;
        border-left: solid 1px #dedede;
    }

    .data_button-edit {
        background-color: #ffbd69;
    }

    .data_button-edit:hover {
        background-color: #efad59;
    }

    .data_button-delete {
        background-color: #fe346e;
        position: relative;
        width: 50px;
    }

    .data_button-delete:hover {
        background-color: #ee245e;
    }

    .data_button-download {
        margin-left: 15px;
        background-color: #B59076;
    }

    .bottom-pad {
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
        box-shadow: 0 5px 30px #cdcdcd;
    }

    .data_button-add:hover {
        background-color: #34789a;
    }

    .data_button-download:hover {
        background-color: #a58066;
    }

    .data_button-delete::before {
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

    .data_button-delete::after {
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

    .form-times {
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
    .form-times .b {
        position: absolute;
        width: 18px;
        height: 4px;
        background-color: #fff;
        border-radius: 2px;
    }

    .form-times .a {
        transform: rotate(-45deg);
    }

    .form-times .b {
        transform: rotate(45deg);
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


