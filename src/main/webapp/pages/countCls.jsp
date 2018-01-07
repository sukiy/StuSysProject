<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2018/1/5
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="margin:20px 20px"><h2>班级人数><a href="Main.jsp">首页</a></h2></div>
<div style="width: 800px;margin: 40px auto">
    <table class="layui-table" id="tab">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th>班级编号</th>
            <th>班级名称</th>
            <th>班级人数</th>
            <th>任课老师</th>

        </tr>
        </thead>
    </table>
</div>

<script>
    function loadData(){
        $("#tab tr:not(:first)").remove();
        $.get("clsAction/countCls","",function (data) {
            $.each(data,function (i,v) {
                var tr="<tr>";
                tr+="<td>"+(i+1)+"</td>";
                tr+="<td>"+v[0]+"</td>";
                tr+="<td>"+v[1]+"</td>";
                tr+="<td>"+v[2]+"</td>";
                tr+="</tr>";
                $("#tab").append(tr);
            });
        });
    }
    window.onload=loadData();
</script>