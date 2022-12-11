<%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/12/6
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员操作执行页面</title>
<%--    先获取对应的参数--%>
    <%
        String obj = request.getParameter("obj");
        pageContext.setAttribute("obj",obj);
        String operation = request.getParameter("operation");
        pageContext.setAttribute("operation",operation);
    %>
<%--    做判断--%>
    <c:if test="${obj eq 'book'}">
        <c:choose>
            <c:when test="${operation eq 'add'}">
                <jsp:include page="oper/AddBookPre.jsp"/>
            </c:when>
            <c:when test="${operation eq 'delete'}">
                <jsp:include page="oper/DeleteBookPre.jsp"/>
            </c:when>
            <c:when test="${operation eq 'modify'}">
                <jsp:include page="oper/ShowAllBookPre.jsp"/>
            </c:when>
            <c:when test="${operation eq 'select'}">
                <jsp:include page="oper/ShowAllBookPre.jsp"/>
<%--                <jsp:include page="test.jsp"></jsp:include>--%>
            </c:when>
        </c:choose>
    </c:if>
    <c:if test="${obj eq 'reader'}">
        <c:choose>
            <c:when test="${operation eq 'add'}">
                <jsp:include page="operReader/AddReaderPre.jsp"/>
            </c:when>
            <c:when test="${operation eq 'delete'}"><%="delete reader"%></c:when>
            <c:when test="${operation eq 'modify'}"><%="modify reader"%></c:when>
            <c:when test="${operation eq 'select'}"><%="select reader"%></c:when>
        </c:choose>
    </c:if>
    <hr/>

</head>
<body>

</body>
</html>
