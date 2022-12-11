<%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/11/27
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>请选择你的登录方式</title>
    <link rel="stylesheet" href="css/login.css">
  </head>
  <body>
  <div class="total">
  <h1 >请选择你的登录方式</h1>
  <a href="<c:url context='${pageContext.request.contextPath}' value='/readerlogin.jsp'/>" class="login_a">普通读者登录</a> <br/>
  <a href="<c:url context='${pageContext.request.contextPath}' value='/managerLogin.jsp'/>" class="login_a">管理员登录</a>
  </div>


  </body>
</html>
