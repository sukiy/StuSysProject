<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2017/12/11
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="margin:20px 20px"><h2>学生信息><a href="Main.jsp">首页</a></h2></div>
<div style="width: 1000px;margin: 40px auto">
    <table class="layui-table" id="tab">
        <colgroup>
            <col width="150">
            <col width="150">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th><a href="javascript:selectStu()">全选/反选</a></th>
            <th>学生姓名</th>
            <th>学生性别</th>
            <th>学生年龄</th>
            <th>入学时间 </th>
            <th>所在班级</th>
            <th>任课老师</th>
            <th>管理</th>
        </tr>
        </thead>
    </table>
    <button class="layui-btn" onclick="deleteStu();">删除</button>
</div>

<script type="text/javascript">
    /*信息查询*/
    function loadData(){
        $("#tab tr:not(:first)").remove();
        $.get("stuAction/findStuList","",function (data) {
            $.each(data,function (i,v) {
                var tr="<tr>";
                tr+="<td><input name='ids' value='"+v[0]+"' type='checkbox' lay-skin='primary'/>"+(i+1)+"</td>";
                tr+="<td>"+v[1]+"</td>";
                tr+="<td>"+v[3]+"</td>";
                tr+="<td>"+v[2]+"</td>";
                tr+="<td>"+v[4]+"</td>";
                tr+="<td>"+v[5]+"</td>";
                tr+="<td>"+v[6]+"</td>";
                tr+="<td><a href='javascript:updateStu("+v[0]+")' style='cursor: pointer;color: rgb(0,150,136)'>修改</a></td>";
                tr+="</tr>";
                $("#tab").append(tr);
                form.render();
            });
        });
    }
    window.onload=loadData();

/****************************************************************************/
    /*全选反选*/
    function selectStu(){
        if($(":checkbox:checked").length>0){
            $(":checkbox").prop("checked",false);
        }else{
            $(":checkbox").prop("checked",true);
        }
    }

    function deleteStu() {
        var ids=$(":checkbox:checked");
        if(ids.length==0){
            alert("请选择要删除的学生");
        }else{
            var param=$(":checkbox").serialize();
            $.post("stuAction/deleteStu",param,function (data) {
                loadData();
            })
        }
    }

    /******************************************************************************/
    //异步查询出班级
    $(function(){
        //取出所有可选的班级
        $(":input[name='tbClass.cno'] option:not(:first)").remove();
        $.post("clsAction/findClsList","",function(data){
            $.each(data,function(i,v){
                var option="<option value='"+v[0]+"'>"+v[1]+"</option>";
                $(":input[name='tbClass.cno']").append(option);
                form.render();
            });
        });
    });

/*************************************************************************************/

//表单的显示与隐藏
    function updateStu(id){

        var data = {};
        $.ajax({
            url:'${pageContext.request.contextPath}/stuAction/toUpdate',
            data:{sno:id},
            type:'post',
            dataType:'json',
            async: false,
            success:function(result){
                data = result;
            },
            error:function(){
                alert('获取学生数据失败');
                return;
            }
        });
        var div = `<div style="min-width:100;height:300px;margin:15px auto" id="updateDiv">
        <form id="fom" class="layui-form" method="post">
            <input type="hidden" name="sno" value="`+ data.sno +`" />
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input name="sname" value="`+ data.sname +`" lay-verType="tips" lay-verify="sname" autocomplete="off" class="layui-input" type="tel"><span id="namespan"></span>
                    </div>
                </div>
            <div class="layui-inline">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-inline">
            <input name="sage" value="`+ data.sage +`" lay-verType="tips" lay-verify="sage" autocomplete="off" class="layui-input" type="tel"><span id="agespan"></span>
            </div>
            </div>

            <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女">
            </div>
            </div>

            <div class="layui-inline">
            <label class="layui-form-label">入学时间</label>
            <div class="layui-input-inline">
            <input name="sintime" value="`+ data.sintime +`" lay-verify="intime" lay-verType="tips" placeholder="yyyy-MM-dd"  type="text" class="layui-input" id="sInTime"><span id="sintimespan"></span>
            </div>
            </div>

            <div class="layui-form-item">
            <label class="layui-form-label">所在班级</label>
            <div class="layui-input-block" style="width: 190px" lay-verType="tips">
            <select name="tbClass.cno" id="tcname"  lay-verify="cls" lay-verType="tips">
            <option value="">请选择班级</option>
            </select>
            <span id="clsspan"></span>
            </div>

            <div class="layui-input-block" style="margin-top: 15px">
            <div class="layui-btn" lay-filter="formDemo" lay-submit>修改</div>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            <div class="layui-btn layui-btn-primary" onclick="cancleDiv()">取消</div>
            </div>
            </div>
            </form>
            </div>`;
         layer.open({
            type:1
            ,closeBtn:0
            ,content:div
            ,area:["450px","380px"]
            ,resize:false
        });

        queryCls();

        //绑定性别
        var sex = $("input[name='sex']");
        data.sex == '男'?sex[0].checked = true:sex[1].checked = true;

        //绑定班级
        var stuClass = $("select[name='tbClass.cno'] option");
        for(var i = 0; i < stuClass.length; i ++){
            if(stuClass[i].value == data.tbClass.cno){
                stuClass[i].selected = true;
                break;
            }
            continue;
        }

        //重新渲染一次
        form.render();
        laydate.render({
            elem: '#sInTime' //指定元素
        });
    }

    function cancleDiv(){
        layer.closeAll();
    }

/*******************************************************************************/

    function queryCls(){
        //取出所有可选的班级
        $(":input[name='tbClass.cno'] option:not(:first)").remove();
        $.ajax({
            url:'${pageContext.request.contextPath}/clsAction/findClsList',
            data:null,
            type:'post',
            async: false,
            success:function(result){
                $.each(result,function(i,v){
                    var option="<option value='"+v[0]+"'>"+v[1]+"</option>";
                    $(":input[name='tbClass.cno']").append(option);
                    form.render();
                });
            },
            error:function(){
                alert('获取班级数据失败');
            }
        });
    }

 /*********************************************************************************/
    //提交监听
    form.on('submit(formDemo)', function(data){
        var param = $("#fom").serialize();
        $.ajax({
            url:'${pageContext.request.contextPath}/stuAction/updateStu',
            type:"post",
            data:param,
            dataType:'json',
            timeout:3000,
            success:function(result){
                layer.msg("修改成功");
                loadData();
            },
            error:function(){
                layer.msg("修改失败！");
            }

        });
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });


</script>