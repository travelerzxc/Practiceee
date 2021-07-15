<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Ticket creation</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<style>

    /* Style the header */
    .header {
        padding: 1px 25px;
        background: #555;
        color: #f1f1f1;
    }

    .header a {
        color: #f1f1f1;
        text-decoration: none;
    }


    #descriptionArea {
        display: block;
        margin-left: auto;
        margin-right: auto;
        font-size: 16px;
        width: 35%;
        padding: 12px 20px;
        height: 150px;
        border: 2px solid #ccc;
        border-radius: 4px;
        background-color: #f8f8f8;
        resize: none;
        margin-bottom: 5px;
    }

    #inputSubmit {
        display: block;
        margin-left: auto;
        margin-right: auto;
        background-color: #555;
        border: 2px solid black;
        color: white;
        padding: 16px 32px;
        text-decoration: none;
        cursor: pointer;
    }

    .headerCreation {
        text-align: center;
    }

    .allElements {
        font-family: Georgia, serif;
    }

</style>
<body>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2><a href="/">Issue tracker</a></h2>
    </div>
    <div class="forms">
        <div class="headerCreation">
            <h2>Creation of the ticket</h2>
        </div>
        <div class="pageContent">
            <form:form method="POST" modelAttribute="ticketForm">
                <div>
                    <form:input class="inputArea"
                                id="userNameArea"
                                type="text"
                                path="text"
                                placeholder="The content of the ticket"
                                autofocus="true"/>
                </div>
                <form:hidden
                        path="project"
                        value="${ticket.project}"
                />
                <form:hidden
                        path="creatingDate"
                        value="${ticket.creatingDate}"
                />
                <form:hidden
                        path="user"
                        value="${ticket.user}"
                />
                <button class="submitButton" type="submit">Create ticket</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>