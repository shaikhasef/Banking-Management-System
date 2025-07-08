<%@ page import="java.util.List, springmvc.model.Transaction" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ import springmvc.model.Transaction;
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
    String currentUser = (String) session.getAttribute("loggedInUser");
%>

<table>
    <tr>
        <th>Transaction</th>
        <th>Amount</th>
        <th>Date</th>
    </tr>
    <% for (Transaction t : transactions) { %>
        <tr>
            <td>
                <% if (t.getSender().equals(currentUser)) { %>
                    You sent <%= t.getAmount() %> to <%= t.getReceiver() %>
                <% } else { %>
                    You received <%= t.getAmount() %> from <%= t.getSender() %>
                <% } %>
            </td>
            <td><%= t.getAmount() %></td>
            <td><%= t.getDate() %></td>
        </tr>
    <% } %>
</table>

</body>
</html>