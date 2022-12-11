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
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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


                </tr>

            </c:forEach>
        </table>

</body>
</html>
