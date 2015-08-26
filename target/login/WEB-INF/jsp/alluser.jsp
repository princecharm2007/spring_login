<%--
  Created by IntelliJ IDEA.
  User: Echo
  Date: 2015/8/23
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<table>
    <tr>
        <td>Name</td>
        <td>Sex</td>
        <td>Address</td>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.name}</td>
            <td>${user.sex}</td>
            <td>${user.address}</td>
        </tr>
    </c:forEach>
    <br/>
    <h3>Total:${size}</h3>
</table>
</body>
</html>
