<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>${project.name}</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<div class="allElements">
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
<script src="/resources/js/myScripts.js"></script>
</html>