<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Main</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
  <div class="allText">
    <div class="welcomeHeader">
      <sec:authorize access="!isAuthenticated()">
        <h3>Welcome!</h3>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
        <h3>Welcome, ${pageContext.request.userPrincipal.name}!</h3>
      </sec:authorize>
    </div>
    <div class="pageContent">
      <div class="pageCenter">
        <sec:authorize access="!isAuthenticated()">
          <p><a href="/login">Log in</a></p>
          <p><a href="/registration">Register</a></p>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <p><a href="/logout">Log out</a></p>
        </sec:authorize>
        <p><a href="/allProjects">Projects list</a></p>
        <sec:authorize access="hasRole('ADMIN')">
          <p><a href="/admin">Users list</a></p>
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
          <p><a href="/tagTypes">Tag list</a></p>
        </sec:authorize>
      </div>
    </div>
  </div>
</div>
</body>
</html>