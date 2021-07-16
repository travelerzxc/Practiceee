<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <meta charset="UTF-8">
    <title>Admin page</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2> <a href="/">Issue Tracker</a></h2>
    </div>
    <div class="addTicketZone">
   <%-- <form:form method="POST" modelAttribute="tagForm"> --%>
        <input class="Area" id="addTagField" name="name" type="text" path="name" placeholder="New tag name"/>
        <button class="submitButton" id="addTagButton" type="submit">Create tag</button>
    <%--</form:form> --%>
    </div>
        <input type="text" class="findBy" id="findByID" onkeyup="searchBy('findByID',0)" placeholder="Search for IDs..">
        <input type="text" class="findBy" id="findByName" onkeyup="searchBy('findByName',1)" placeholder="Search for names..">
    <table id="myTable">
        <thead>
        <tr class="header2">
            <th>ID</th>
            <th>Names</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
<%--        <c:forEach items="${allTags}" var="tag">--%>
<%--            <tr>--%>
<%--                <td>${tag.id}</td>--%>
<%--                <td>${tag.name}</td>--%>
<%--                <td>--%>
<%--                    <form action="/tagTypes" method="post">--%>
<%--                        <input type="hidden" name="userId" value="${tag.id}"/>--%>
<%--                        <input type="hidden" name="action" value="delete"/>--%>
<%--                        <button id="deleteButton" type="submit">Delete</button>--%>
<%--                    </form>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
        </tbody>
    </table>
</div>
</body>
<script src="/resources/js/myScripts.js"></script>
</html>
