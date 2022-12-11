<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="com.sky.library.service.Service" %><%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/12/1
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>增加读者卡</title>
</head>
<body>

    <form action="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/operReader/AddReader.jsp'/>" method="post">
<%--        借阅证编号（目前是自增主键） <input type="text" name="book_name"   value="${book.book_name}"    > <br/>--%>
        借阅人姓名                <input type="text" name="reader_name" > <br/>
        借阅证密码                <input type="text"  name="reader_password"   > <br/>
        借阅证到期时间             <input type="date"  name="reader_expiration"  > <br/>
        <input type="submit" value="点击增加">
    </form>
<hr/>
<hr/>
    <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChoosePre.jsp'/>">
        <button>返回操作界面</button>
    </a>
</body>
</html>
