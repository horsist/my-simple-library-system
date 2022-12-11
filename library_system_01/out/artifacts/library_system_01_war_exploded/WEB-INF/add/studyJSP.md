## 三、JSP开发
### 3.1 创建JSP
#### 3.1.3 访问JSP
    http://ip:port/项目路径/资源名
### 3.2 JSP与 Servlet
    关系
        JSP文件在容器中会转换成 Servlet执行
        JSP 是对Servlet的一种高级封装，本质还是Servlet
    区别：
        JSP 可以很方便的编写或修改HTML页面而不用取面对大量的println语句
        1.编码：servlet 以继承 httpservlet+注解 /web.xml   
                JSP直接在html中编写java代码
        2.修改：servlet重新部署、重启
                刷新即可
        3.访问：
        4.标签： println
                html
### 3.3.执行原理
    tomcat将jsp装换为Java代码，进而编译成.class文件，在通过 response 相应给客户端
    client - > tomcat -> xx.jsp ->xx.java -> xx.class ->client
    first.jsp  -> first_jsp.java -> first_jsp.class
#### 3.3.1   JSP.JAVA源文件位置
    C：/用户/账户名/IntelliJIDEA/system/tomcat/项目名/work/catalina/localhost/应用上下文/org/apache/jsp
    C:\Users\10073\AppData\Local\JetBrains\IntelliJIdea2020.2\tomcat\Unnamed_Web_JSP\work\Catalina\localhost\Web_JSP_war_exploded\org\apache\jsp
    控制台日志第一行
##  四、JSP与HTML集成开发
### 4.1 脚本
    脚本可以编写Java语句、变量、方法、表达式
#### 4.1.1  普通脚本
    语法<%java代码%>
    经验：普通脚本可以使用所有Java代码，除了定义函数
    注意：脚本与脚本之间不可嵌套，脚本与HTML标签不可嵌套.
#### 4.1.2  声明脚本
    语法 <%!定义变量、定义函数%>
    注意：声明脚本的变量是全局变量
    声明脚本的内容必须在普通脚本<%%>中调用
    如果声明脚本中的函数有返回值，使用输出脚本调用<%=%>
#### 4.1.3 输出脚本  相当于out.println("")
    语法 <%=表达式/函数/变量%>
    经验：输出脚本可以输出带有返回值的函数
    注意：输出脚本不用加;
### 4.2 JSP注释
    <%--   注释--%>  JSP注释，不会发送到浏览器
    <!--  注释-->   HTML注释 ，浏览器查看源代码会看到该注释
### 4.3 JSP指令
    <%@page%>      定义页面的依赖属性，比如脚本语言，error页面，缓存需求   
    <%@include%>   包含其他文件
    <%@taglib%>    引入标签库的定义，可以是自定义标签
#### 4.3.1 page指令
    语法： <%@page  attribute1="value1" attribute2 = "value2"  %>
    page指令为容器提供当前页面的使用说明，一个jsp页面可以包括多个page指令
    属性              描述
    contentType      指定当前JSP页面的MIME类型和字符编码类型
    errorPage        指定jsp异常时需要转向的错误处理页面   
    isErrorPage      指定当前页面可以作为另一个jsp页面的错误处理页面
    import           导入要使用的Java类
    language         定义JSP页面所用的脚本语言 默认Java
    session          指定jsp页面是否使用session 默认true立即创建，false为使用时创建
    pageEncoding     指定jsp页面解码格式
#### 4.3.2 include指令
    语法： <%@include file=""%>
    指定包含其他文件（jsp,html,文本文件） 文件会被同时编译,执行，同时显示 例如 main.jsp  header.jsp footer.jsp
    注意：静态包含可能会有重名的冲突问题，不建议使用，不建议使用
#### 4.3.3 taglib指令
    语法：<%@tarlib uri="外部标签库链接" prefix="前缀"%>
    引入jsp标准标签库
### 4.4 动作标签
    语法 <jsp:action_name attribute="values"/>
    JSP页面在运行期间的动作
#### 4.4.1 动作标签include标签
    <jsp:include page="相对url地址"/>
    动作元素会将外部文件输出结果包含在jsp中（动态包含）
#### 4.4.2 动作标签usebean
    <jsp:useBean id="" class=""></jsp:useBean>
    id 对象名  class 类名
#### 4.4.3 动作标签 setProperties getProperties
    调用 bean(类)的set和get方法，与usebean联用
    <jsp:setProperty name="" property=""></jsp:setProperty>
    name 对象名（usebean建立） property 类属性名 与get set方法对应
    <jsp:getProperty name="" property=""/>
#### 4.4.4 动作标签 forward(跳转页面) param(赋值)
    <jsp:forward page="next.jsp">
            <jsp:param name="" value=""/> //键值对
    </jsp:forward>
    注意：接收方可以用 <%=request.getParameter("name")%>  接受
### 4.5九大内置对象
    对象名         类                                           说明
    request       javax.servlet.http.HttpServletRequest         
    response      javax.servlet.http.HttpServletResponse       
    session       javax.servlet.http.HttpSession               session="true"开关 
    application   javax.servlet.ServletContext                 
    config        javax.servlet.ServletConfig               
    exception     java.lang.Throwable                          idErrorPage="false" 开关
    out         javax.servlet.jsp.JspWriter
    pageContext   javax.servlet.jsp.PageContext                 页面上下文
    page          java.lang.Object                              当前servlet实例
#### 4.5.1四大域对象
    存储数去和获取数据方式一样，取值范围不同
    pageContext  当前页有效（当前jsp页面jsp）
    request      一次请求有效
    session      一次会话有效
    application  web再次重启、关闭之前有效
    obj.setAttribute("name",value)  存值
    obj.getAttribute("name")  取值
#### 4.5.2四大域对象之pageContext扩展
    基础功能
    扩展功能：获取、操作其他八个对象作用域
#### 4.5.3四大域对象之pageContext获取八个对象
    pageContext.getobj
#### 4.5.4四大域对象之pageContext操作作用域
    pageContext的三个方法setAttribute，getAttribute和removeAttribute带有第三个参数，可以选择
    PageContext.PAGE_SCOPE = 1;     //page
    PageContext.REQUEST_SCOPE = 2;  //request
    PageContext.SESSION_SCOPE = 3;  //session
    PageContext.APPLICATION_SCOPE = 4;  //application
    上面的阈值指定存储的对象应该保存在哪一个域中（4）
    注意：后续取值可以   pageContext.getAttribute("key",阈值) 或对应阈值的对象.getAttribute
    如  session.getAttriibute("key")   还可以用 pageContext.findAttribute("key")取值
#### 4.5.5四大域对象之pageContext  findAttribute 方法
    http://www.51gjie.com/javaweb/831.html
    https://blog.csdn.net/weiwjacsdn/article/details/90612014
    findAttribute方法，使用pageContext.findAttribute方法能从四个域(page, request, session, context)中寻找存储的数据，
    查找的顺序也是从小到大(page—>request—>session—>context)，只要在某个域中能查到相对应的键值对，就返回，如果四个域都没有则返回null。
    这个方式对于EL表达式是最重要的，例如JSP页面中有一个EL表达式： ${data} 最终在Servlet中就会被翻译成 pageContext.findAttribute(“data”)。
### 4.6整合Emp项目


## 五、EL（expression Language）表达式
### 5.1概念
    EL使JSP写起来更简洁 主要用于获取作用域中的数据    
### 5.2作用
    用于替换作用域对象 getAttribute("key")
### 5.3 EL的应用[获取基本类型、字符串]
    ${scope.name}     获取具体某个作用域中的数据  scope 作用域（pageScope,sessionScope,applicationScope,requestScope）
    ${name}    获取数据  逐级查找（pageContext -> request  ->  session  ->  application）
#### 5.3.2 EL和jsp脚本区别
    <%=request.getAttribute("key")%> 没有找到返回null
    ${scope.key} 没找到返回  ""
### 5.4 EL的应用[获取引用类型]
    只能访问get方法获取对应属性  ${obj}  ${obj.properties}
    补充  无get set方法的私有属性 叫 field
        有get set方法的私有属性 叫 properties
### 5.5 EL的应用[获取数组、集合的元素]
    EL可以获取Array , List , Map 中的元素  Set由于没下标，无法直接访问元素 后续可遍历
    1.无论是Array,list,map,构造成功之后,都必须将对应对象名存入 即setAttribute("key",obj)
    2.访问时， ${key[下标]}  ；map 是 ${key["KEY"]}
    3.LIST和map存放的 key值可以代替 其对象 调用对应的方法
    4.EL 自身不支持循环
### 5.6 EL的运算符
    操作符        描述
    .
    []
    +  - *  /or div  %/mod ==oreq  != or ne  < or lt  > or gt    <= or le...
    && or and 逻辑与    || or or  逻辑或   ! or not 取反  empty 是否为空
### 5.7 隐式对象
    EL表达式定义了11个隐式对象
    pageScope                   对应作用域对象            
    requestScope                对应作用域对象 
    sessionScope                对应作用域对象 
    applicationScope            对应作用域对象  
    param                       request对象的参数 字符串
    paramValue                  request对象的参数 字符串集合
    header                      HTTP信息头 字符串
    headerValue                 HTTP信息头 字符串集合
    iniParam                    上下文初始化参数
    cookie                      Cookie值
    pageContext                 当前页面的pageContext

#### 5.7.1 获取应用上下文
    <%=request.getContextPath()%>
    ${pageContext.request.contextPath}
#### 5.7.2 获取cookie对象
    ${cookie.username}   //获取 key为 username的cookie对象
    ${cookie.username.value}
    ${cookie.username.value}
    <h1>${cookie.password.value}</h1>  //获取 key为 username的cookie值
## 六、JSTL标准标签库
### 6.1 现有问题
    EL主要用于作用域获取数据，虽然可以做运算，但只得到结果展示
    EL无流程控制
    EL对集合只能做单点控制，不能遍历
### 6.2 什么是JSTL 
    Java server pages standard taglibrary  JSP标准标签库
### 6.3 JSTL作用
    可对EL获取到的数据进行逻辑操作
    与EL合作完成数据展示
    
### 6.4 JSTL使用
    jar   standard.jar   和 jtsl.jar
    <%@ taglib url = "http://java.sun.com/jsp/jstl/core" prefix="c">
### 6.5 核心标签
#### 6.5.1 核心标签单条件if判断
    语法  <c:if test="EL条件" > </c:if>   没有else
#### 6.5.2 核心标签多条件choose判断
    语法: <c:choose>
                <c:when test="条件1">结果1</c:when>
                <c:when test="条件2">结果2</c:when>
                <c:otherwise>结果3</c:otherwise>
            </c:choose>
#### 6.5.3 核心标签迭代 foreach
    <c:forEach var="变量名" begin="开始下标" end="结束下标" items="集合" step="间隔长度" varStatus="遍历状态">
    </c:forEach>
    varStatus 状态: first 是否第一行  last 是否最后一行  count 当前行数  index  当前元素下标
#### 6.5.3 核心标签 url
    当cookie禁用时，通过重写URL拼接JSEssionid 传递ID值
    <c:url context="${pageContext.request.contextPath}" value="/jstl/jstl1.jsp" ></c:url>
    所有涉及到页面跳转或重定向跳转时 都应该使用URL重写
### 6.6 整合
## 七、MVC框架（model-view-controller）
### 7.1概念
    MVC又称编程模式，是一种软件设计思想，将数据操作，页面展示，业务逻辑分为三层 模型层  试图  控制器
### 7.2MVC模式详解
    几乎所有B/C都用到了
    试图，即用户看到的并与之交互，如HTML静态资源，JSP动态资源
    控制器，控制请求的处理逻辑，对请求进行处理，负责流程跳转和重定向
    模型 对客观世界的一种代表和模拟（业务模拟，对象模拟）
    ![Image text](D:\java_project\JSP\Web_JSP\img\MVC模式展示图.jpg)
![Image text](img\MVC模式展示图.jpg)
### 7.5三层架构与MVC
#### 7.5.1三层架构
    view(表示层) service（业务逻辑层）  dao(数据访问层)

#### 7.5.2三层架构与MVC区别
    MVC是框架，强调试图与业务代码的分离，严格说MVC关注的是web层，view就是单独的页面，如JSP html等，不负责业务处理，只负责业务展示
     而数据封装在model里，由controller负责在V和M之间传递
    三层架构是view(表示层) service（业务逻辑层）  dao(数据访问层)，强调代码解耦
    
     
    




















                