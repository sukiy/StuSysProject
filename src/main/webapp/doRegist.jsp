<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2017/11/6
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div style="width: 320px; margin: 0 auto;margin-top: 15%;" >
    <h2 style="font-family: 微软雅黑;margin-bottom: 20px;font-weight: bold">用户注册</h2>
    <form class="layui-form layui-form-pane" action="${pageContext.request.contextPath}/usersAction/doRegist" method="post" onsubmit="return check()">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input name="uname" id="uname" autocomplete="off" class="layui-input" type="text">
                </div>
            </div><br>
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input name="upwd" id="upwd" autocomplete="off" class="layui-input" type="password">
                </div>
            </div><br>
            <div class="layui-inline">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                    <input id="reupwd" autocomplete="off" class="layui-input" type="password">
                </div>
            </div><br>

            <input  class="layui-btn" lay-submit="" lay-filter="demo1;" type="submit" value="注册">
            <a href="index.jsp">取消注册</a>
        </div>
    </form>
</div>
</body>
<script>
    //注册验证
    function check(){
            var name = document.getElementById("uname").value;
            var pwd = document.getElementById("upwd").value;
            var repwd = document.getElementById("reupwd").value;
            //用户名
            var regName=/^[a-zA-Z]{6,30}$/;
            //密码
            var regPwd=/^(\w){6,20}$/;

        if(!regName.test(name)){
            alert("用户名不能为空且只能输入1-30个以字母开头的字串");
            return false;

        }else if (!regPwd.test(pwd)){
            alert("密码不能为空并且只能输入6-20个字母、数字、下划线");
            return false;

        }else if (repwd!=pwd){
            alert("密码不一致");
            return false;

        }
            alert("注册成功，现在去登录");
         }

</script>
</html>
