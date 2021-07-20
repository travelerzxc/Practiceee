<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Registration</title>
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
  <%--@elvariable id="userForm" type=""--%>
  <div class="forms">
    <form:form method="POST" modelAttribute="userForm">
      <div class="headerCreation">
        <h2>Registration</h2>
      </div>
      <div class="pageContent">
          <div>
          <form:input class="inputArea" id="userNameArea" type="text" path="username" placeholder="Username"
                      autofocus="true"/>
          <form:errors path="username"/>${usernameError}
          </div>
          <div>
            <form:input class="inputArea" id="passwordArea" type="password" path="password" placeholder="Password"/>
          </div>
          <div>
            <form:input  class="inputArea" id="confirmPasswordArea" type="password" path="passwordConfirm"
                        placeholder="Confirm your password"/>
            <form:errors path="password"/>
              ${passwordError}
          </div>
        <button class="submitButton" id="inputCenter" type="submit">Registration</button>
      </div>
    </form:form>
  </div>
</div>
</body>
</html>

