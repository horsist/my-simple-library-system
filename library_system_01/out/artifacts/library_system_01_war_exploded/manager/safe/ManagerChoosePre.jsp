<%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/12/5
  Time: 20:38
  两个功能：管理读者和管理书籍  （增删改查）
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员选择对应的管理操作</title>
</head>
<body>
    <%System.out.println("managerchoosepre页面");%>
    管理书籍：<a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=book&operation=add'/>">增</a>
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=book&operation=delete'/>">删</a>
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=book&operation=modify'/>">改</a>
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=book&operation=select'/>">查</a>   <br/>
    管理读者：<a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=reader&operation=add'/>">增</a>
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=reader&operation=delete'/>">删</a>
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=reader&operation=modify'/>">改</a>
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChooseOperation.jsp?obj=reader&operation=select'/>">查</a>   <br/>
<%--    //注销登录--%>
    <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/exit.jsp'/>" target="_top">注销</a>


</body>
</html>
