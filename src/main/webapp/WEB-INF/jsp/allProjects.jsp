<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <title>Projects!!</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
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
    <input type="text" id="myInput" onkeyup="searchBy('myInput',0)" placeholder="Search for names..">
    <table id="myTable">
        <thead>
        <tr class="header2">
            <th style="width:60%;">Title of the project
            </th>
            <th style="width:40%;">
                <sec:authorize access="hasRole('ADMIN')">
                    <form action="/createProject">
                        <input type="submit" value="Create project">
                    </form>
                </sec:authorize>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectList}" var="project">
            <tr>
                <td><a href="/project/${project.id}">${project.name}</td>
                <td>
                    <sec:authorize access="hasRole('ADMIN')">
                        <form action="/allProjects" method="post">
                            <input type="hidden" name="projectId" value="${project.id}"/>
                            <input type="hidden" name="action" value="delete"/>
                            <button type="submit">Delete</button>
                        </form>
                    </sec:authorize>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="/resources/js/myScripts.js"></script>


</html>