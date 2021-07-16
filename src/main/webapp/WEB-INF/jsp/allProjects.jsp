<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<head>
    <meta charset="UTF-8">
    <title>Projects!!</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2> <a href="/">Issue Tracker</a></h2>
    </div>
    <input type="text" id="myInput" onkeyup="searchBy('myInput',0)" placeholder="Search for names..">
    <table id="myTable">
        <thead>
        <tr class="header2">
            <th style="width:60%;">Title of the project
            </th>
            <th style="width:40%;">
                <form action="/createProject">
                    <input type="submit" value="Create project">
                </form>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectList}" var="project">
            <tr>
                <td><a href="/project/${project.id}">${project.name}</td>
                <td>
                    <form action="/allProjects" method="post">
                        <input type="hidden" name="projectId" value="${project.id}"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="/resources/js/myScripts.js"></script>


</html>