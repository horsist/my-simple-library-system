<%@ page import="com.sky.library.entity.Readers" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="com.sky.library.service.impl.ReadersServiceImpl" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.entity.Page" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/11/29
  Time: 20:48
  本页验证完 是否是登录读者
  之后直接显示所有书名
  验证方法  利用 用户名保存对应的session   用户名验证session
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--    <%--%>
<%--        System.out.println("showall.jsp页面");--%>
<%--//        List<Book> bookList = (List<Book>) request.getSession().getAttribute("bookList");--%>
<%--////        List<Book> bookList = (List<Book>) request.getAttribute("bookList");--%>
<%--//        Page page1 = (Page) request.getSession().getAttribute("page1");--%>
<%--    %>--%>
    <%="showall1.jps页面"%>
<%--    <c:if test="${readers != null }">--%>
        <!-- 展示所有的-->
        <table border="1">
            <tr>
                <td>图书编号</td>
                <td>书名</td>
                <td>作者</td>
                <td>价格</td>
                <td>借阅状态</td>
                <td>图书类别</td>
                <td>出版社</td>
<%--                <td>借阅证编号</td>--%>
<%--                <td>借阅人姓名</td>--%>
                <td>是否借书</td>
            </tr>
<%--            来个循环--%>
            <c:forEach var="book" items="${bookList}">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.book_name}</td>
                    <td>${book.author}</td>
                    <td>${book.book_price}</td>
                    <td>${book.book_status}</td>
                    <td>${book.book_type}</td>
                    <td>${book.publisher}</td>
<%--                    <td>${book.readerNo}</td>--%>
<%--                    <td>${book.reader_name}</td>--%>
                    <td><a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/BorrowBookPre.jsp?id=${book.id}'/> ">点击借书</a></td>

                </tr>

            </c:forEach>
            <tr>
                <td colspan="6">
                    <a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/ShowAllPagePre.jsp?pageIndex=1'/> ">首页</a>
                    <c:if test="${page1.pageIndex > 1}">
                        <a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/ShowAllPagePre.jsp?pageIndex=${page1.pageIndex - 1}'/> ">上一页</a>
                    </c:if>
                    <c:if test="${page1.pageIndex== 1}">
                        <a>上一页</a>
                    </c:if>

                    <c:if test="${page1.pageIndex<page1.totalPages}">
                        <a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/ShowAllPagePre.jsp?pageIndex=${page1.pageIndex + 1}'/> ">下一页</a>

                    </c:if>
                    <c:if test="${page1.pageIndex == page1.totalPages}">
                        <a>下一页</a>
                    </c:if>
                    <a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/ShowAllPagePre.jsp?pageIndex=${page1.totalPages}'/> ">尾页</a>
                </td>
            </tr>
        </table>
<%--    </c:if>--%>
<br/>
<br/>
<br/>
<br/>
<c:if test="${!empty self_borrowed_book_List}">
<table border="1">
    <tr>
        <td>图书编号</td>
        <td>书名</td>
        <td>作者</td>
        <td>价格</td>
        <td>借阅状态</td>
        <td>图书类别</td>
        <td>出版社</td>
        <td>借阅证编号</td>
        <td>借阅人姓名</td>
        <td>所借书籍到期日期</td>
        <td>点击还书</td>
        <td>一键还书</td>
    </tr>
    <c:forEach var="book_borrowed" items="${self_borrowed_book_List}">
        <tr>
            <td>${book_borrowed.id}</td>
            <td>${book_borrowed.book_name}</td>
            <td>${book_borrowed.author}</td>
            <td>${book_borrowed.book_price}</td>
            <td>${book_borrowed.book_status}</td>
            <td>${book_borrowed.book_type}</td>
            <td>${book_borrowed.publisher}</td>
            <td>${book_borrowed.readerNo}</td>
            <td>${book_borrowed.reader_name}</td>
            <td>${book_borrowed.book_expiration}</td>
            <td><a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/BorrowBookPre.jsp?id=${book_borrowed.id}'/> ">点击还书</a></td>
        </tr>
    </c:forEach>
</table>
</c:if>
<c:if test="${empty self_borrowed_book_List}">
    <%="你当前没有待还书籍"%>
</c:if>


<a href="<c:url context='${pageContext.request.contextPath}' value='/reader/book/exit.jsp'/>" target="_top">注销</a>
</body>
</html>
