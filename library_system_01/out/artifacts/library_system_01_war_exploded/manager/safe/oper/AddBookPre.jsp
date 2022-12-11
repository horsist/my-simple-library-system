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
    <title>增加书籍前置界面</title>
</head>
<body>

<%--    <c:url context='${pageContext.request.contextPath}' value='/reader/book/ShowAllPagePre.jsp'/>--%>
    <form action="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/oper/AddBook.jsp'/>" method="post">
        书名             <input type="text" name="book_name"   > <br/>
        作者             <input type="text" name="author"   > <br/>
        书籍价格          <input type="text"  name="book_price" > <br/>
<%--        书籍借阅状态       <input type="text"   name="book_status" value="${book.book_status}"      readonly  > <br/>--%>
        图书类别          <input type="text"  name="book_type"  > <br/>
        出版社            <input type="text"  name="publisher"  > <br/>
        <input type="submit" value="点击增加">
    </form>
<hr/>
<hr/>
    <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChoosePre.jsp'/>">
        <button>返回操作界面</button>
    </a>
</body>
</html>
