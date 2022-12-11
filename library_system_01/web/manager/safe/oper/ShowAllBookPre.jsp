<%@ page import="com.sky.library.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/12/6
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sky.library.entity.Page" %>
<%@ page import="com.sky.library.entity.Manager" %>
<%@ page import="com.sky.library.service.impl.ManagerServiceImpl" %>
<html>
<head>
    <title>所有书籍预展示页面</title>
</head>
<body>
<%
    Service<Book> bookService = new BookServiceImpl();
    String pageIndex = request.getParameter("pageIndex");
    Page page1 = new Page(pageIndex==null ? 1:Integer.valueOf(pageIndex));
    List<Book> bookList = bookService.showAll(page1,"root");

    //将所有书存到当前页面中
    request.setAttribute("bookList",bookList);
    request.setAttribute("page1",page1);
    request.getRequestDispatcher("/manager/safe/oper/ShowAllBook.jsp").forward(request,response);
%>
</body>
</html>
