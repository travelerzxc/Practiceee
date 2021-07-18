<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<head>
    <title>${project.name}</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<body>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2> <a href="/">Issue Tracker</a></h2>
    </div>
    <div class="projectNameHeader">
        <h3>${project.name}</h3>
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
                        <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
                            <form action="/project/${project.id}/createTicket">
                                <input type="submit" value="Create ticket">
                            </form>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                            <form action="/login">
                                <input type="submit" value="Log in to create a ticket!">
                            </form>
                        </sec:authorize>
                    </th>
                </tr>
                </thead>
                <tbody class="allTickets">
                <c:forEach items="${tickets}" var="ticket">
                    <tr class="row_1">
                        <td class="col_1" rowspan="3">${ticket.user.username}</td>
                        <td class="col_2" id="dateContainer">${ticket.creatingDate}</td>
                        <td align="right" width="10%">
                            <sec:authorize access="hasRole('ADMIN')">
                                <form action="/project/${project.id}" method="post">
                                    <input type="hidden" name="ticketId" value="${ticket.id}"/>
                                    <input type="hidden" name="action" value="delete"/>
                                    <button type="submit">Delete ticket</button>
                                </form>
                            </sec:authorize>
                        </td>
                        <td align="right" width="5%" class="col_3" id="idContainer">#${ticket.id}</td>
                    </tr>
                    <tr class="row_2" id="contentContainer">
                        <td colspan="3">${ticket.text}</td>
                    </tr>
                    <tr id="row_3">
                        <td colspan="2" align="left">
                            <c:forEach items="${ticket.marks}" var="tag">
                                <div class="tagsLine">
                                    <p>${tag.name}</p>
                                </div>
                            </c:forEach>
                        </td>
                        <td align="right" width="10%">
                            <sec:authorize access="hasRole('ADMIN')">
                                <form action="/project/${project.id}/editTicketTags/${ticket.id}">
                                    <button align="left" type="submit">Edit tags</button>
                                </form>
                            </sec:authorize>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
<script src="/resources/js/myScripts.js"></script>
<script>
    var $rows = $('#table tr');
    $('#search').keyup(function() {
        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

        $rows.show().filter(function() {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val);
        }).hide();
    });
</script>
</html>