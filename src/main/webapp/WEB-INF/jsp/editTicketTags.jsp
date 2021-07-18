<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <meta charset="UTF-8">
    <title>Ticket Tags</title>
    <link rel="stylesheet" href="/resources/css/myStyle.css">
</head>
<style>
    #tagSelection {
        border-color: black;
        border-width: 3px;
        width: 300px;
        height: 50px;
        background-color: #dddddd;
        font-size: 18px;
        padding: 2px;
        margin-top: 15px;
    }

    .addTicketZoneHeader {
        text-align:center;
        font-size: 18px;
        font-weight: bold;
    }
</style>
<body>
<div class="allElements">
    <div class="header" id="myHeader">
        <h2> <a href="/">Issue Tracker</a></h2>
    </div>
    <div class="addTicketZone">
        <div class="addTicketZoneHeader">
            <h2>Attach new tag for your ticket!</h2>
        </div>
    <form action="/project/${id}/editTicketTags/${ticketId}" method="post">
        <div class="selectCenter">
            <select id="tagSelection">
                <c:forEach items="${existingTags}" var="tag">
                    <option class="lt" value="${tag.id}">${tag.name}</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden"  id="inputTagId" name="tagId"  />
        <input type="hidden" name="ticketId" value="${ticket.id}"/>
        <input type="hidden" name="action" value="addTagToTicket"/>
        <div class="buttonCenter">
            <button class="submitButton" id="addTagButton" type="submit" onclick=getSelectValue()>Add tag</button>
        </div>
     </form>
    </div>
    <input type="text" class="findBy" id="findByID" onkeyup="searchBy('findByID',0)" placeholder="Search for IDs..">
    <input type="text" class="findBy" id="findByName" onkeyup="searchBy('findByName',1)" placeholder="Search for names..">
    <table id="myTable">
        <thead>
        <tr class="header2">
            <th>ID</th>
            <th>Names</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
                <c:forEach items="${ticket.marks}" var="tag">
                    <tr>
                        <td>${tag.id}</td>
                        <td>${tag.name}</td>
                        <td>
                           <form action="/project/${id}/editTicketTags/${ticketId}" method="post">
                               <input type="hidden" name="ticketId" value="${ticket.id}"/>
                               <input type="hidden" name="tagId" value="${tag.id}"/>
                               <input type="hidden" name="action" value="deleteTicketTag"/>
                                <button id="deleteButton" type="submit">Delete</button>
                           </form>
                        </td>
                    </tr>
                </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="/resources/js/myScripts.js">
</script>
</html>