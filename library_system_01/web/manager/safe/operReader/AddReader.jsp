<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sky.library.entity.Book" %>
<%@ page import="com.sky.library.service.impl.BookServiceImpl" %>
<%@ page import="com.sky.library.service.Service" %>
<%@ page import="com.sky.library.entity.Readers" %>
<%@ page import="java.io.Reader" %>
<%@ page import="com.sky.library.service.impl.ReadersServiceImpl" %><%--
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
        System.out.println("addreader.jsp");
    %>
    <%
        String reader_name = request.getParameter("reader_name");
        String reader_password = request.getParameter("reader_password");
        String reader_expiration = request.getParameter("reader_expiration");
        Readers readers = new Readers(reader_name, reader_password, reader_expiration);


        //获取业务操作对象
        Service<Readers> readersService = new ReadersServiceImpl();
        //生成新书记录
        //修改
        int insert = readersService.add(readers);
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
