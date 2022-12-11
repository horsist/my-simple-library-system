<%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/12/10
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出</title>
</head>
<body>
<%
    session.removeAttribute("manager");
    session.invalidate();
%>
<jsp:forward page="../../managerLogin.jsp"></jsp:forward>
</body>
</html>
