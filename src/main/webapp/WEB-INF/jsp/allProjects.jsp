<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<head>
    <meta charset="UTF-8">
    <title>Orders</title>
</head>
<style>
    #myInput {
        width: 20%;
        font-size: 16px;
        padding: 12px 20px 12px 40px;
        border: 1px solid #ddd;
        margin-bottom: 12px;
        margin-top: 12px;
        margin-left: 25%;
    }

    #myTable {
        table-layout: fixed;
        border-collapse: collapse;
        width: 50%;
        border: 1px solid #ddd;
        font-size: 18px;
        margin-left: 25%;
    }

    #myTable th, #myTable td {
        text-align: left;
        padding: 12px;
        overflow:hidden;
    }

    #myTable tr {
        border-bottom: 1px solid #ddd;
    }

    #myTable tr.header2, #myTable tr:hover {
        background-color: #f1f1f1;
    }

    /* Style the header */
    .header {
        padding: 1px 25px;
        background: #555;
        color: #f1f1f1;
        display:block;
        margin-left: auto;
        margin-right: auto;
    }

    .header a {
        color: #f1f1f1;
        text-decoration: none;
    }

    .content {
        padding: 14px;
    }

    .sticky {
        position: fixed;
        top: 0;
        width: 100%
    }

    .sticky + .content {
        padding-top: 102px;
    }

    .allElements {
        font-family: Georgia, serif;
    }
</style>
<body>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2> <a href="/">Issue Tracker</a></h2>
    </div>
    <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">
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
<script>
    /////11111
    function myFunction() {
        // Declare variables
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
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

    //////////3333
    // When the user scrolls the page, execute myFunction
    window.onscroll = function() {myFunction2()};

    // Get the header
    var header = document.getElementById("myHeader");

    // Get the offset position of the navbar
    var sticky = header.offsetTop;

    // Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
    function myFunction2() {
        if (window.pageYOffset > sticky) {
            header.classList.add("sticky");
        } else {
            header.classList.remove("sticky");
        }
    }
</script>


</html>