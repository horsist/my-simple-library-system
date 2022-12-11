<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sky.library.entity.Page" %>
<%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/12/6
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>删除书籍操作页面</title>
</head>
<body>

<!--页面展示-->
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
        <td>借阅到期时间</td>
        <td>是否删除书籍</td>
    </tr>

    <c:forEach var="book" items="${bookList}">
        <tr>
            <td>${book.id}</td>
            <td>${book.book_name}</td>
            <td>${book.author}</td>
            <td>${book.book_price}</td>
            <td>${book.book_status}</td>
            <td>${book.book_type}</td>
            <td>${book.publisher}</td>
            <td>${book.readerNo}</td>
            <td>${book.reader_name}</td>
            <td>${book.book_expiration}</td>
            <td><a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/oper/DeleteBook.jsp?id=${book.id}'/> ">点击删除本书</a></td>

        </tr>

    </c:forEach>
    <tr>
        <td colspan="6">
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/oper/DeleteBookPre.jsp?pageIndex=1'/> ">首页</a>
            <c:if test="${page1.pageIndex > 1}">
                <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/oper/DeleteBookPre.jsp?pageIndex=${page1.pageIndex - 1}'/> ">上一页</a>
            </c:if>
            <c:if test="${page1.pageIndex== 1}">
                <a>上一页</a>
            </c:if>

            <c:if test="${page1.pageIndex<page1.totalPages}">
                <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/oper/DeleteBookPre.jsp?pageIndex=${page1.pageIndex + 1}'/> ">下一页</a>

            </c:if>
            <c:if test="${page1.pageIndex == page1.totalPages}">
                <a>下一页</a>
            </c:if>
            <a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/oper/DeleteBookPre.jsp?pageIndex=${page1.totalPages}'/> ">尾页</a>
        </td>
    </tr>
</table>
<a href="<c:url context='${pageContext.request.contextPath}' value='/manager/safe/ManagerChoosePre.jsp'/>">
    <button>返回操作界面</button>
</a>
</body>
</html>
