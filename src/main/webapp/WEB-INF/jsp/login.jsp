<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>
  <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>
<div class="allElements">
  <div class="header" id="myHeader">
    <h2> <a href="/">Issue Tracker</a></h2>
  </div>
  <form method="POST" action="/login">
    <div class="headerCreation">
      <h2>Login</h2>
    </div>
    <div>
      <div class="pageContent">
        <input class="Area" id="userNameArea" name="username" type="text" placeholder="Username"
               autofocus="true"/>
        <input class="Area" id="passwordArea" name="password" type="password" placeholder="Password"/>
        <button class="submitButton" id="inputLogIn" type="submit">Log In</button>
        <p class="registerLink"><a  href="/registration">Register?</a></p>
      </div>
    </div>
  </form>
</div>

</body>
</html>