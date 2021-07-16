<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <title>Create Project</title>
  <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<div class="header" id="myHeader">
  <h2> <a href="/">Issue Tracker</a></h2>
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
  </div>
</div>

</body>
</html>