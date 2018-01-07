<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2017/12/10
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

    <style type="text/css">
        .layui-form select {
            display: block;
            width: 0px;
            height: 0px;
            overflow: hidden;
            border: 0px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a href="#" style="color: white">欢迎登录本系统</a></div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;"><%--
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
                    ${users.uname}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="exit.jsp">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree layui-bg-cyan layui-inline" lay-filter="demo">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">课程管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="Main.jsp">课程信息</a></dd>
                    </dl>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:addLesson();">添加课程</a></dd>
                    </dl>

                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">学生信息管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:addCls();">添加班级</a></dd>
                        <dd><a href="javascript:countCls();">查询班级</a></dd>
                        <dd><a href="javascript:findStu();">查询学生</a></dd>
                        <dd><a href="javascript:addStu();">添加学生</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body" id="ConBody">
        <!-- 内容主体区域 -->
        <div style="margin:20px 20px"><h2>课程信息><a href="Main.jsp">首页</a></h2></div>
        <div style="width: 700px;margin: 40px auto">
            <table class="layui-table" id="tab">
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th><a href="javascript:selectAll()">全选/反选</a></th>
                    <th>课程名称</th>
                    <th>任课老师</th>
                </tr>
                </thead>
            </table>
            <button class="layui-btn" onclick="deleteLesson();">删除</button>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © 所有版权归学校所有
    </div>
</div>
<script>
    //JavaScript代码区域
    var laydate;
    var form;
    var layer;
    var $;

    layui.use(['element', 'laydate','form', 'layer',"jquery"], function(){
        var element = layui.element;
        form = layui.form;
        laydate = layui.laydate;
        layer = layui.layer;
        $ = layui.jquery;
    });
/*******************************************************************************/

//查询课程
function loadData(){
        $("#tab tr:not(:first)").remove();
        $.post("lessonAction/findLessonList","",function (data) {
            $.each(data,function (i,v) {
                var tr="<tr>";
                tr+="<td><input id='check' name='ids' type='checkbox' value='"+v[0]+"' lay-skin='primary'>"+(i+1)+"</td>";
                tr+="<td>"+v[1]+"</td>";
                tr+="<td>"+v[2]+"</td>";
                tr+="</tr>";
                $("#tab").append(tr);
                form.render();
            });
        });
    }
    window.onload=loadData;

/********************************************************************/

    /*全选反选*/
    function selectAll(){
       if($(":checkbox:checked").length>0){
           $(":checkbox").prop("checked",false);
        }else{
            $(":checkbox").prop("checked",true);
        }
    }

    //删除课程
    function deleteLesson() {
        var id=$(":checkbox:checked");
        if(id.length==0){
            alert("请选择要删除的课程");
        }else{
            var param=$(":checkbox").serialize();
            $.post("lessonAction/deleteLesson",param,function (data) {
                loadData();
            })
        }
    }
/***********************************************************************************/

    function findStu(){
        $("#ConBody").html("").load("${pageContext.request.contextPath}/pages/StuInfo.jsp");
    }

    function addStu() {
        $("#ConBody").html("").load("${pageContext.request.contextPath}/pages/addStu.jsp");
    }

    function addLesson() {
        $("#ConBody").html("").load("${pageContext.request.contextPath}/pages/addLesson.jsp");
    }

    function addCls() {
        $("#ConBody").html("").load("${pageContext.request.contextPath}/pages/addCls.jsp");
    }

    function countCls() {
        $("#ConBody").html("").load("${pageContext.request.contextPath}/pages/countCls.jsp");
    }

</script>
</body>
</html>
