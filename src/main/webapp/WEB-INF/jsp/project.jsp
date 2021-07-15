<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>Title</title>
</head>
<style>

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

    .fullBodyContainer {
        font-family: Georgia, serif;
    }

    .projectNameHeader {
        text-align: center;
        font-size: 32px;
    }

    .withoutHeadersContainer {
        width: 95%;
        display:block;
        margin-left: auto;
        margin-right: auto;

    }
    .descriptionZone {
        border: 3px solid black;
        background: #f8f8f8;
        padding: 10px;
        border-radius: 10px 10px;;
        margin-bottom: 10px;
        word-break: break-all;
    }

    .projectDescriptionHeader {
        text-align:center;
        font-size: 18px;
        font-weight: bold;
    }

    .ticketTableZone {
        border: 3px solid black;
        background: #f8f8f8;
        padding: 10px;
        border-radius: 10px 10px;
    }
    .ticketHeader {
        text-align:center;
        font-size: 18px;
        font-weight: bold;
    }

    .ticketsTable {
        border-collapse: collapse;
        width: 100%;
        border: 1px solid #ddd;
        font-size: 18px;
    }

    .ticketsTable th, .ticketsTable td {
        padding: 12px;
    }

    .ticketsTable tr {
        border: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
    }

    #ticketTableHeader {
        background-color: #555;
        text-align: left;
    }

    .col_1 {
        text-align: center;
        font-weight: bold;
        border: 1px solid #ddd;
        width: 10%;
    }

    #dateContainer {
        font-size: 14px;
        text-decoration: underline;
        margin-left: auto;
    }

    #idContainer {
        font-size: 14px;
    }

    #contentContainer {
        vertical-align: top;
        height: 150px;
        word-break: break-all;
    }

    .tagsLine {
        display: inline-block;
        font-size: 14px;
        word-break: break-all;
    }

    #myInput {
        width: 20%;
        font-size: 16px;
        padding: 12px 20px 12px 40px;
        border: 1px solid #ddd;
        margin-bottom: 12px;
        margin-top: 12px;
        margin-left: 25%;
    }

</style>
<body>
<div class="fullBodyContainer">
    <div class="header" id="myHeader">
        <h2> <a href="/">Issue tracker</a></h2>
    </div>
    <div class="projectNameHeader">
        <h3> ${project.name}</h3>
    </div>
    <div class="withoutHeadersContainer">
        <div class="descriptionZone">
            <div class="projectDescriptionHeader">
                <p>Project description</p>
            </div>
            <div class="descriptionText">
                <p>${project.description}</p>
            </div>
        </div>
        <div class="ticketTableZone">
            <div class="ticketHeader">
                <p>Tickets</p>
            </div>
            <table class="ticketsTable">
                <thead class="col_1" id="ticketTableHeader">
                <tr>
                    <th colspan="3">
                    </th>
                    <th width="10%" align="right">
                        <form action="/project/${project.id}/createTicket">
                            <input type="submit" value="Create ticket">
                        </form>
                    </th>
                </tr>
                </thead>
                <tbody class="allTickets">
                <c:forEach items="${tickets}" var="ticket">
                <tr class="row_1">
                    <td>${ticket.user.username}
                    </td>
                    <td> ${ticket.id}
                    </td>
                    <td> ${ticket.text}">
                    <td align="right" width="10%">
                    <form action="/project/${project.id}" method="post">
                        <input type="hidden" name="ticketId" value="${ticket.id}"/>
                        <input type="hidden" name="action" value="delete"/>
                        <button type="submit">Delete ticket</button>
                    </form>
                    </td>
                </tr>


<%--                    <tr id="row_3">--%>
<%--                        <td colspan="2" align="left">--%>
<%--                            <c:forEach items="${ticket.tags}" var="tag">--%>
<%--                                <div class="tagsLine">--%>
<%--                                    <p>${tag.name}></p>--%>
<%--                                    <button type="submit">Delete</button>--%>
<%--                                </div>--%>
<%--                            </c:forEach>--%>
<%--                        </td>--%>
<%--                        <td align="right" width="10%">--%>
<%--                            <button align="left" type="submit">Edit tags</button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
<script>
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
</script>
</html>