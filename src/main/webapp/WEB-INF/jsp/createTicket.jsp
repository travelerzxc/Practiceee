<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Ticket creation</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2><a href="/">Issue Tracker</a></h2>
    </div>
    <div class="forms">
        <div class="headerCreation">
            <h2>Creation of the ticket</h2>
        </div>
        <div class="pageContent">
            <form:form method="POST" modelAttribute="ticketForm">
                <div>
                    <form:textarea class="ticketContentField"
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
                <button class="submitButton" id="inputCenter" type="submit">Create ticket</button>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>