<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2017/12/23
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        session.invalidate();
    %>

    <jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>
