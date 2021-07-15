<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
  <title>Главная</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<div class="allElements">
  <div class="header" id="myHeader">
    <h2> <a href="/">Issue Tracker</a></h2>
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
          <p><a href="/login">Войти</a></p>
          <p><a href="/registration">Зарегистрироваться</a></p>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
          <p><a href="/logout">Выйти</a></p>
        </sec:authorize>
        <p><a href="/allProjects">Cписок проектов</a></p>
        <sec:authorize access="hasRole('ADMIN')">
          <p><a href="/admin">Пользователи и прочее</a></p>
        </sec:authorize>
      </div>
    </div>
  </div>
</div>
</body>
</html>