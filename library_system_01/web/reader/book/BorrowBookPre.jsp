<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="java.util.Date" %><%--
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
    <title>借书前置界面</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
        int i = Integer.parseInt(id);
        Service<Book> bookService = new BookServiceImpl();
        Book book = bookService.showOne(i);
        pageContext.setAttribute("book",book);
        Date date = new Date();
        pageContext.setAttribute("date",date);

    %>


    <form action="<c:url context='${pageContext.request.contextPath}' value='/reader/book/BorrowBook.jsp'/>" method="post">
        图书编号          <input type="text" name="id"          value="${book.id}"  readonly> <br/>
        书名             <input type="text" name="book_name"   value="${book.book_name}"   readonly > <br/>
        作者             <input type="text" name="author"      value="${book.author}"    readonly> <br/>
        书籍价格          <input type="text"  name="book_price"  value="${book.book_price}"     readonly > <br/>
<%--        书籍借阅状态       <input type="text"   name="book_status" value="${book.book_status}"      readonly  > <br/>--%>
        <strong>选择你的操作</strong>
        <select name="book_status">
            <option selected = "selected" >借书</option>
            <option>还书</option>
        </select >  <br/>

        图书类别          <input type="text"  name="book_type"   value="${book.book_type}"     readonly > <br/>
        出版社            <input type="text"  name="publisher"   value="${book.publisher}"       readonly   > <br/>
        借书证编号        <input type="text"  name="readerNo"    value="${reader.readerNo}"       readonly > <br/>
        借书人           <input type="text"  name="reader_name" value="${reader.reader_name}"   readonly   > <br/>
        还书日期           <input type="date"  name="book_expiration" value="${date}"      > <br/>
        <input type="submit" value="点击借还书">
    </form>
    <a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/exit.jsp'/>" target="_top">注销</a> <br/>
    ${date}
</body>
</html>
