<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2017/11/6
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html style="width: 100%; height: 100%">
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body style="width: 100%; height: 100%;">
<div style="font-size: 18px">

</div>

<div style="width: 320px; margin: 0 auto;margin-top: 15%;" >
    <h2 style="font-family: 微软雅黑;margin-bottom: 20px;font-weight: bold">用户登录</h2>
    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/usersAction/doLogin" method="post" >
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input name="uname" autocomplete="off" class="layui-input" type="text">
                </div>
            </div><br>
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input name="upwd" autocomplete="off" class="layui-input" type="password">
                </div>
            </div><br>
            <button class="layui-btn" lay-submit="" lay-filter="demo1;">登录</button>
            <a href="doRegist.jsp">还没账号？一键注册</a>
        </div>
    </form>
</div>

</body>
</html>
<script>
    var i =${param.rtype}
    if(i==-1){
        alert("登录失败");
    }
</script>