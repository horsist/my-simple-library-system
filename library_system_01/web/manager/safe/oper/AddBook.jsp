<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<html>
<head>
    <title>修改书籍信息界面</title>
</head>
<body>
    <%
        String book_name = request.getParameter("book_name");
        String author = request.getParameter("author");
        String book_price = request.getParameter("book_price");
        String book_type = request.getParameter("book_type");
        String publisher = request.getParameter("publisher");

        //获取业务操作对象
        Service<Book> bookService = new BookServiceImpl();
        //生成新书记录
        Book book = new Book(book_name, author, book_price, book_type, publisher);
        //修改
        int insert = bookService.add(book);
        pageContext.setAttribute("insert",insert);

    %>

    <c:if test="${insert > 0}">

        <script>borrowSuccess()</script>

        <%request.getRequestDispatcher("/manager/safe/oper/ShowAllBookPre.jsp").forward(request,response);%>
    </c:if>
    <c:if test="${insert == 0}">
        <script>alert("加失败")</script>
        <%request.getRequestDispatcher("/manager/safe/oper/ShowAllBookPre.jsp").forward(request,response);%>


    </c:if>

</body>
</html>
