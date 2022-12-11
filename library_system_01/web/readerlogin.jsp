<%--
  Created by IntelliJ IDEA.
  User: 10073
  Date: 2022/12/11
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>读者登录界面</title>
    <style>
        *{margin: 0;padding: 0}
        html,body{height: 100%}

        .login-panel{
            width: 400px;
            height: 300px;
            background-color: rgba(0, 0, 0, .5);
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -150px;
            margin-left: -200px;
        }
        .inner-wrap{
            width: 250px;
            height: 200px;
            background-color: gray;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -100px;
            margin-left: -150px;


        }

        img{
            width: 150px;
            height: 20px;
            float: right;
            margin-right: 20px;
        }
        #search{
            color:#aaa;
            border:1px solid #CC0000;
            padding:1px;
        }
    </style>
    <script language="javascript">
        var s=document.getElementById("search");
        s.onfocus=function(){if(this.value==this.defaultValue)this.value=''};
        s.onblur=function (){if(/^\s*$/.test(this.value)){this.value=this.defaultValue;this.style.color='#aaa'}}
        s.onkeydown=function(){    this.style.color='#333'}
    </script>
</head>
<body>
<%--    <form method="post" action="/library_system_01_war_exploded/reader/readerlogin.jsp">--%>
    <form method="post" action="<c:url context='${pageContext.request.contextPath}' value='/reader/readerlogin.jsp'/>">
        <div class="login-panel">
            <div class="inner-wrap">
            用户名：<input type="text" name="username" value="tom" id="search" > <br/>
            密&emsp;码：<input type="password" name="password" value="123456" ><br/>
            验证码：<input type="text" name ="inputVcode" > <img src=" <c:url context='${pageContext.request.contextPath}' value='/createcode'/>" style="float: right"><br/>
            <input type="submit" value="登录"/>
            </div>
        </div>
    </form>

<hr/>
    <a href="<c:url context='${pageContext.request.contextPath}' value='/'/>">
        <button>返回首页</button>
    </a>
</body>
</html>
