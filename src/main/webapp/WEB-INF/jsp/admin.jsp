<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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

<script>
  function searchBy(elementID,col) {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById(elementID);
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
      td = tr[i].getElementsByTagName("td")[col];
      if (td) {
        txtValue = td.textContent || td.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  }


  window.onscroll = function() {myFunction2()};
  var header = document.getElementById("myHeader");
  var sticky = header.offsetTop;

  function myFunction2() {
    if (window.pageYOffset > sticky) {
      header.classList.add("sticky");
    } else {
      header.classList.remove("sticky");
    }
  }
</script>
</html>