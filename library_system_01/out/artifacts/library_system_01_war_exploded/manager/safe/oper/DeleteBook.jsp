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
    <title>删除书籍信息界面</title>
</head>
<body>
    <%
        System.out.println("deletebook.jsp");
    %>
    <%
        //读取转发携带的id信息
        String id = request.getParameter("id");
        int id_int = Integer.parseInt(id);
        //获取业务操作对象
        Service<Book> bookService = new BookServiceImpl();
        //生成新书记录
        //修改
        int delete = bookService.removeObject(id_int);
        pageContext.setAttribute("delete",delete);

    %>

    <c:if test="${delete > 0}">
<%--        <%--%>
<%--            System.out.println("借书成功！");--%>
<%--        %>--%>
        <script>borrowSuccess()</script>

        <%request.getRequestDispatcher("/manager/safe/oper/DeleteBookPre.jsp").forward(request,response);%>

        <%--        borrowSuccess();--%>
    </c:if>
    <c:if test="${delete == 0}">
        <script>alert("借书失败")</script>
        <%request.getRequestDispatcher("/manager/safe/oper/DeleteBookPage.jsp").forward(request,response);%>
    </c:if>

</body>
</html>
