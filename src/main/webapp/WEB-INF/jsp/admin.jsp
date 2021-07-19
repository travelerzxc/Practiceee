<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
  <meta charset="UTF-8">
  <title>Admin page</title>
  <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<sec:authorize access="!hasRole('ADMIN')">
  <% response.sendRedirect("/"); %>
</sec:authorize>
<div class="allElements">
  <div class="header" id="myHeader">
    <h2> <a href="/">Issue Tracker</a></h2>
  </div>
  <input type="text" class="findBy" id="findByID" onkeyup="searchBy('findByID',0)" placeholder="Search for IDs..">
  <input type="text" class="findBy" id="findByName" onkeyup="searchBy('findByName',1)" placeholder="Search for names..">
  <table id="myTable">
    <thead>
    <tr class="header2">
    <th>ID</th>
    <th>UserName</th>
    <th>Roles</th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${allUsers}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.username}</td>
        <td>
          <c:forEach items="${user.roles}" var="role">${role.name} ; </c:forEach>
        </td>
        <td>
          <form action="${pageContext.request.contextPath}/admin" method="post">
            <input type="hidden" name="userId" value="${user.id}"/>
            <input type="hidden" name="action" value="delete"/>
            <button id="deleteButton" type="submit">Delete</button>
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