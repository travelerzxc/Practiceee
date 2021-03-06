<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <title>Create Project</title>
  <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<sec:authorize access="!hasRole('ADMIN')">
  <% response.sendRedirect("/"); %>
</sec:authorize>
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
    <h2>Creation of the project</h2>
  </div>
  <div class="pageContent">
    <form:form method="POST" modelAttribute="projectForm">
      <div>
        <form:input class="inputArea" type="text" path="name" placeholder="Project name"
                    autofocus="true"/>
        <form:errors path="name"/>
          ${projectFormErrors}
      </div>
      <div>
        <form:textarea id="descriptionArea" type="textArea" path="description" placeholder="Description"/>
      </div>
      <form:hidden
              path="user"
              value="${project.user.id}"
      />
      <form:hidden
              path="creatingDate"
              value="${project.creatingDate}"
      />
      <button class="submitButton" id="inputCenter" type="submit">Create project!</button>
    </form:form>
    <div>
      <form action="/allProjects">
      <div class="buttonCenter">
        <button class="submitButton" id="toPrevPageButtonCreateTicket"
                type="submit">Back to all projects page</button>
      </div>
      </form>
    </div>
  </div>

</div>

</body>
</html>
