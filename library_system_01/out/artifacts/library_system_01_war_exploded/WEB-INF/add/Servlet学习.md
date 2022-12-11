###七、Servlet的应用
####7.1、request对象
####7.1.1 get post区别
    get
        get提交的数据会放在url后面，以？分割url和传输的数据，参数之间以&相连
        明文、小数据、不安全
        效率高、默认
        对应方法 doget
    post
        提交数据放在http包的body中
        密文、大量数据、安全
        效率较get低
        dopost
####7.1.2 request主要方法
    String getParameter(String name)    根据表单组件名称获取提交数据
    void setCharacterEncoding(String charset)  指定每个请求的编码
####7.1.3 中文乱码
    tomcat7 以前 客户端发送utf-8 但服务端的request使用ISO8899接受
    解决NAME= new String(name.getBytes("ISO8859-1"),"UTF-8") 
    但是post直到tomcat10 才解决 。可以利用setCharacterEncoding方法
###7.2.response 对象
    setHeader(name,value)设置响应信息头
    setContentType(String) 设置文件 类型，编码格式
    setCharacterEncoding(String) 服务端响应编码格式
    getWriter() 获取字符输出流

### 八、转发与重定向
#### 8.1现有问题
    在之前的案例中，调用业务逻辑adminService.showAllAdmin()
    和显示结果页面printWriter.println("<html>")都在同一个servlet里面，就会产生设计问题
        * 不符合单一职能原则
        * 不利于后续维护
    应该将业务逻辑和显示结果分开
    
#### 8.1.1 业务逻辑和显示结果分离后；
    client-发送请求->Controller(业务逻辑)-->XXXJSP(显示页面) -响应结果->client
    1,如何跳转到显示结果的servlet
    2,业务逻辑得到的结果如何传递给显示的servlet
#### 8.2转发
    转发作用在服务端，将请求发送给服务器上的其他资源，以共同完成一次请求的处理
#### 8.2.1页面跳转
在业务逻辑的servlet中，编写以下代码
    
    request.getRequestDispatcher("/目标url-pattern").forward(request,reponse);
    
* 使用forward跳转，是在服务器内部跳转，地址栏不发生变化，属于同一次请求
#### 8.2.2数据传递
    forward表示一次请求，是在服务器内部跳转，可以共享一次request作用域中的数据   
    * request作用域：拥有存储数据的空间，作用范围时一次请求有效（一次请求可以经过多次转发）
      ** 可以将数据存入request后，在一次请求过程中的任何位置进行获取
      ** 可传递任何数据（基本，对象，数组，集合等）
    *存数据：request.setAttribute(key,value)
        以键值对形式，key为string,value为object
    * 取数据： request.getAttribute(key)
#### 8.3 重定向
    重定向作用在客户端，客户端将请求发送给服务端后，服务器响应给客户端一个新的请求地址，客户端重新发送请求
#### 8.3.1页面跳转
    在调用业务逻辑的servlet中，编写下列代码
    response.sendRedirect("目标url");
#### 8.3.2流程图
    client[/a] -req1->AServlet-resp>client[/b]-req2>Bservlet-resp2>client
#### 8.3.3数据传递
    sendRedict跳转时，地址栏发生改变，代表客户端重新发送请求，属于两次请求
    * resp没有作用域，因此两次req请求中的数据无法共享
    * resp数据传递：通过URL的拼接进行数据传递（"/webproject/b?username=tom"）;
    * resp数据获取： request.getParameter("username")
    * 注意：通过拼接传递只能传递string，并且是明文传递
#### 8.3.4重定向特点
    * 重定向是客户端行为（由服务端命令决定定向位置）
    * 重定向是浏览器至少做了两次访问请求
    * 重定向是浏览器地址改变
    * 重定向两次跳转之间数据会丢失
    * 重定向可以指向任何资源，包括当前应用程序中的其他资源，同一个站点上的其他应用程序中的资源、其他站点的资源
#### 8.4 转发重定向
    当两个servlet需要传递数据时，建议选择forward转发，不建议使用 sendRedirect
### 九 servlet生命周期
#### 9.1 生命周期的四个阶段
##### 9.1.1 实例化
    当用户第一次访问servlet时，由容器调用servlet的构造器创建具体的servlet对象，也可以在容器启动后立刻创建实例。使用如下代码就可以设置是否在
    服务器启动时创建
    <load-on-startup>1</load-on-startup>  //负数或0 被请求访问才创建
    * 注意：只执行一次    
##### 9.1.2初始化
    init()方法会被调用，在 javax.servlet.Servlet接口中定义，以servletconfig类型的对象做参数
    * 注意：init只执行一次   
##### 9.1.3服务
    当客户端有一个请求时，容器会将 servletrequest和 servletresponse对象转给servlet,以参数的形式传给service方法
    方法会执行多次

##### 9.1.4销毁
    servlet容器停止或重启都会引起销毁对象，并调用destroy方法
    该方法执行一次

### 十 servlet特性
#### 10.1线程安全问题
    servlet实例化中，会创建一个servlet对象，而我们tomcat容器可以同时多个线程并发控制访问同一个servlet，如果在方法中对成员变量做了修改操作，
    就会有线程安全问题
#### 10.2 如何保证线程安全问题
* 解决方法一： synchronized(this){包裹代码块};但是效率低，同时间只能有一人登录
* 解决方法二：实现 SingleThreadModel接口后，每个线程都会创建servlet实例，这样每个客户端请求九不存在共享资源的问题，但是资源浪费，
            但是servlet响应客户端的请求的效率太低，所以已经被淘汰
* 解决方法三：**_尽可能使用局部变量_**

### 十一 状态管理
    客户端状态管理：将状态保存在客户端，代表 cookie技术
    服务器状态管理：状态保存在服务端， session技术（服务器传递session需要使用cookie的方式） 和application

### 十二 Cookie的使用
#### 12.1 什么时cookie
    是在浏览器访问web服务器时，由web服务器在http响应头中附带传送给浏览器的一小段程序
    主要有 名称（name）和值（value）组成   
|  client   | 过程|server  |
|  ----  | -------------  |----|
| 1,访问登录servlet "/ls"|-首次请求>|创建cookie对象 |
| 2,接收ls响应的cookie| <---|通过response将cookie响应给client|
| 3,访问显示servlet,携带cookie| --再次请求-->|从请求中查找cookie|
| | <----||

#### 12.2创建cookie
    Cookie ck = new Cookie("name",value);
    ck.setPath("/webs");  //设置cookie的路径
    ck.setMaxAge(-1);  //内部存储，取值由三种，>0有效期，单位秒；  =0浏览器关闭  <0 内存存储 默认-1
    response.addCookie(ck) //添加到response对象中，响应时发送给客户端
    //注意 有效路径：当前访问资源的上一级目录，不带主机名
* chrome浏览器查看cookie:chrome://setting/content/cookies
#### 12.3获取cookie
    //通过request对象获取所有cookie
            Cookie[] cks = req.getCookies();
            //遍历
            if (cks!=null){
            for (Cookie cookie:cks) {
                System.out.println("cookie name:"+cookie.getName() + ";\t"+"cookie value:"+cookie.getValue() );//取cookie的name
    //            System.out.println(cookie.getValue()); //取value
            }
            }
#### 12.4修改cookie
    只需要保证 Cookie的名称和路径一致即可修改
    Cookie ck = new Cookie("name",value);
    ck.setPath("/webs");  
    ck.setMaxAge(-1);  
    response.addCookie(ck)
* 如果改变cookie的name会新建一个cookie,如果改变cookie的**value值、有效期**会覆盖原有的cookie 

#### 12.5 Cookie的编码与解码
    new Cookie(URLEncoder.encode("name汉字","编码方式"),URLEncoder.encode("value汉字","编码方式"))
    URLDecoder.decode(ck.getName(),"UTF-8编码方式")
    URLDecoder.decode(ck.getValue(),"UTF-8编码方式")
#### 12.6 Cookie优点缺点
    优点：可配置到期规则
         简单
         数据持久
    缺点：大小受限制，多数浏览器对cookie大小有 4k、8k的限制
        用户配置为禁用：有些用户会浏览器设置禁用
        潜在的安全风险：cookie可能会被篡改     
### 十三、Session
#### 13.1概述    
    用于记录用户的状态，session指一段时间内，单个客户端与web服务器的一连串相关的交互过程
    在一个session中，客户可能会多次请求访问同一个资源，也有可能请求访问不同的资源

#### 13.2session原理
    服务器会为每一次会话会分配一个session对象
    同一个浏览器发起多次请求，同属于一次会话（session）
    首次使用session，服务器会自动创建session，并创建cookie存储sessionid发送回客户端
    
#### 13.session作用域
    拥有存储数据的空间，作用范围是一次会话
    一次会话是使用同一浏览器发送的多次请求，一旦浏览器关闭，则结束对话
    可以将数据存入session中，在一次对话的任意位置获取
    可传递任何数据
#### 13.3.1获取session
    //通过request获取session
            HttpSession session = request.getSession();
            System.out.println(session.getId());
    //浏览器显示
            set-cookie:JSESSIONID=711E85A30E4EA83C639B7D6FBA54F277; Path=/WebProject_war_exploded; HttpOnly
    httponly的意思是只有浏览器获取并携带，通过js代码是拿不到sessionid的
    再次刷新浏览器，cookie会携带sessionid访问服务器
#### 13.3.2 session保存数据
    session.setAttribute("key",value);  //键值对
#### 13.3.3 session获取数据
    session.getAttribute("key");
#### 13.3.4session移除数据
    session.removeAttribute("key");
#### 13.3.5 session 与 request区别
    request 是一次请求有效，请求改变则request改变
    session 是一次会话有效，浏览器改变则session改变
#### 13.4 session的生命周期
    开始：第一次使用到session的请求产生则创建session
    结束：浏览器关闭或超时或手工关闭  则session失效
    //设置最大有效时间
    session.setMaxInactiveInterval(10); 
    //手工关闭session
    session.invalidate();
#### 13.4补充 浏览器禁用cookie的解决方案
    禁用后果：cookie每次发送sessionid，禁用后sessionid不会被保存
    可以用URL重写这样的方法
#### 13.4.1 url重写
    浏览器访问服务器某个地址时，不在使用某个地址，而是使用经过改写的地址。即原地址+sessionid
#### 13.4.2 url重写方法
    //response.encodeRedireURL(String url)
    String newurl = response.encodeRedireURL("/WebProject_war_exploded/getValue")
    System.out.println(newurl);
    //重定向
    response.sendReidct(newurl)
#### 13.5 session实战权限验证
    client -> showall  -没登陆> login.html ->再次
#### 13.6 session验证码
##### 13.6.1创建验证码
    导入 validatecode.jar
    创建生成验证码的 servlet
### 十四、servletcontext对象
#### 14.1 servletcontext概述
* 全局对象，也拥有作用域，对应一个tomcat的web应用  （request 对应 一次请求  session对应一次会话）
* 当web服务器启动时，会为每一个web应用程序创建一块共享的存储区域
* servletcontext随服务器启动而创建，关闭而销毁
#### 14.2 获取servletcontext对象
* genericservlet提供了getservletcontext方法 推荐  this.getServletContext() 
* httpServletRequest 提供了 getServletContext方法 推荐
* HttpSession提供了getServletContext方法
#### 14.3作用
#### 14.3.1 获取项目真实路径 ---目录
    servletContext.getRealPath("/")
#### 14.3.2 获取项目的上下文路径  ---项目名称
    servletContext.getContextPath(); 
    request.getContextPath();    
#### 14.3.3全局容器
    存储数据： serlvetContext.setAttribute("name",value);    
    获取数据： servletContext.getAttribute("name");   
    移除数据： servletContext.removeAttribute("name");
#### 14.4 servletcontext特点
    唯一性：一个应用对应一个servletcontext
    生命周期：只要容器不关闭，或不卸载，servletcontext就一直存在
#### 14.5 servletcontext应用场景
    统计当前项目的访问次数
### 十五、过滤器
#### 15.1 现有问题
    冗余代码 多个servlet都要编写
#### 15.2 概念
    过滤器时出于服务端和客户端之间的过滤技术
    client <--> 过滤器 chain.doFilter()  <--> 目标资源
#### 15.3 过滤器作用
    执行地位在servlet之前，客户端发请求，先经过filter,在到达目标servlet,响应时回根据执行流程再反向filter
    可以解决多个servlet代码荣誉问题（如验证登录，乱码处理）
#### 15.4 编写过滤器
    servlet API中提供了Filter接口，开发人员编写类实现该接口即可，这个类成为过滤器
#### 15.4.1 实现过程
    编写Java类实现 filter接口
    doFilter方法中编写拦截逻辑
    设置拦截路径
#### 15.5 过滤器两种配置

#### 15.5.1 注解配置
    在自定义的filter类上面使用@WebFilter(value = "/目标资源url")
#### 15.5.2 xml配置
    web.xml中
    <!--    过滤器配置-->
        <filter>
    <!--        名称-->
            <filter-name>xml</filter-name>
    <!--        过滤器类全称-->
            <filter-class>com.mzy.filter.XmlFilter</filter-class>
        </filter>
    <!--    映射路径配置-->
        <filter-mapping>
    <!--        名称-->
            <filter-name>xml</filter-name>
    <!--        需要过滤的url路径-->
            <url-pattern>/test</url-pattern>
        </filter-mapping>
#### 15.5.3 关于拦截路径的配置
    过滤器的拦截路径通常有三种方式
    * 精确拦截  比如  /index.jsp   /myservlet
    * 后缀拦截  比如  *.jsp  *.html *jpg  
    * 通配符拦截阻拦  /*. 表示拦截所有  注意过滤器不能单独使用 /匹配  但是 /aaa/bbb/*允许


### 15.6 过滤器链和优先级
#### 15.6.1 过滤器链
    客户端对服务请求后.服务器调用servlet之前会执行一组过滤器,那么这组过滤器就称为过滤器链
    每个过滤器实现某个特定的功能,当第一个filter的dofilter方法被调用,web服务器会创建一个代表filter链的filterChain 对象传递给该方法. 
        在dofilter 方法中,开发人员如果调用了filterChain对象的dofilter,web服务器会检查filterchain对象中是否还有filter,如果有,
        则执行第二个filter,如果没有则调用目标资源
#### 15.6.2 过滤器优先级
    一个web应用中,可以开发多个filter,这些filter组合称为链
    优先级:
        * 如果都是注解,按照类全名称的字符串顺序决定作用顺序 
        *  如果都web.xml , 按照 filter.mapping 注册顺序,从上往下
        *  xml 配置高于 注解
        *  注解和xml同存,会创建多个过滤对象,在成过滤多次
#### 15.7 典型验证
    解决编码
    权限验证\
### 十六,综合案例


#### 16.1 数据库环境搭建
    EMS员工环境搭建   两张表
    EMP 员工信息表
    empmanager 管理员表
#### 16.2 创建数据库 emp
    创建数据表emp : id,name,salary,age
    empmanager :username
    charset
    




















    
    













