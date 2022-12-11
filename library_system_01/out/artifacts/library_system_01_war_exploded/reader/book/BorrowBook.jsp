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
    <title>借书界面</title>
    <script>
        var v=0;
        // 编写js代码弹窗，后续需要整理到一起
        function borrowSuccess(){
            alert("借书成功");
        }
        function borrowFail(){
            alert("借书失败");
        }

    </script>
</head>
<body>
    <%
        System.out.println("borrowbook.jsp");
    %>
    <%
        String id = request.getParameter("id");
        String book_name = request.getParameter("book_name");
        String author = request.getParameter("author");
        String book_price = request.getParameter("book_price");
        String book_status_pre = request.getParameter("book_status");
        String book_type = request.getParameter("book_type");
        String publisher = request.getParameter("publisher");
        String readerNo = request.getParameter("readerNo");
        String reader_name = request.getParameter("reader_name");
        String book_expiration = request.getParameter("book_expiration");

        //处理数据
        String book_status = "未借出";
        System.out.println("book_status_pre:"+book_status_pre);
        if ("借书".equals(book_status_pre)){
            book_status = "借出";
        }else if ("还书".equals(book_status_pre)){
            book_status = "未借出";
            book_expiration="9999-12-31";
            readerNo= "9999";
            reader_name="root";
        }
        int readerNo_int = Integer.parseInt(readerNo);
        int id_int = Integer.parseInt(id);
        //获取业务操作对象
        Service<Book> bookService = new BookServiceImpl();
        //生成新书记录
        System.out.println("book_status:"+book_status);
        Book book = new Book(id_int, book_name, author, book_price, book_status, book_type, publisher, readerNo_int, reader_name,book_expiration);
        System.out.println(book.toString());
        //修改
        int modify = bookService.modify(book);
        pageContext.setAttribute("modify",modify);

    %>

    <c:if test="${modify > 0}">
<%--        <%--%>
<%--            System.out.println("借书成功！");--%>
<%--        %>--%>
        <script>borrowSuccess()</script>

        <%request.getRequestDispatcher("/reader/book/ShowAllPagePre.jsp").forward(request,response);%>

        <%--        borrowSuccess();--%>
    </c:if>
    <c:if test="${modify == 0}">
        <script>alert("借书失败")</script>
        <%request.getRequestDispatcher("/reader/book/ShowAllPagePre.jsp").forward(request,response);%>


    </c:if>

</body>
</html>
