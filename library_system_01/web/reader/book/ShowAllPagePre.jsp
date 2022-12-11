<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.Reader" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="com.sky.library.service.impl.ReadersServiceImpl" %>
<%@ page import="com.sky.library.entity.Readers" %>
<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="com.sky.library.entity.Page" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/11/28
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍显示页面前置页面</title>
</head>
<body>
<%
    request.removeAttribute("bookList");
    Service<Book> bookService = new BookServiceImpl();
    String pageIndex = request.getParameter("pageIndex");
    Readers readers = (Readers) request.getSession().getAttribute("reader");
    System.out.println(pageIndex);
    Page page1 = new Page(pageIndex==null ? 1:Integer.valueOf(pageIndex));
    List<Book> bookList = bookService.showAll(page1);
    List<Book> self_borrowed_book_List = bookService.showBorrowedBook(readers.getReaderNo());
    //将所有书存到当前页面中
    request.setAttribute("self_borrowed_book_List",self_borrowed_book_List);
    request.setAttribute("bookList",bookList);
    request.setAttribute("page1",page1);

    //直接跳转过去  重定向 不包含数据
//    response.sendRedirect(request.getContextPath()+"/reader/book/showall.jsp");
    //使用转发的方式 可以存数据
    request.getRequestDispatcher("/reader/book/showall.jsp").forward(request,response);
%>


</body>
</html>
