<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>Ticket creation</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<sec:authorize access="!isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2 class="inlineHeader" id="mainSign"> <a href="/">Issue Tracker</a></h2>
        <p class="inlineHeader" id="projectLink"><a href="/allProjects">Projects</a></p>
        <sec:authorize access="!isAuthenticated()">
            <p class="inlineHeader" id="loginLink"><a href="/login">Log In</a></p>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <p class="inlineHeader" id="loginLink"><a href="/logout">Log Out</a></p>
        </sec:authorize>
    </div>
    <div class="forms">
        <div class="headerCreation">
            <h2>Creation of the ticket</h2>
        </div>
        <div class="pageContent">
            <div>
            <form:form method="POST" modelAttribute="ticketForm" class="needs-validation">
                <div>
                    <form:textarea class="ticketContentField"
                                type="text"
                                path="text"
                                placeholder="The content of the ticket"
                                autofocus="true"/>
                    <form:errors path="text"/>${ticketFormErrors}
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
            <div>
                <form action="/project/${project.id}/">
                    <div class="buttonCenter">
                        <button class="submitButton" id="toPrevPageButtonCreateTicket"
                                type="submit">Cancel and back</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
