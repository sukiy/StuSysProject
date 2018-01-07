<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2017/12/27
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="margin:20px 20px"><h2>添加课程><a href="Main.jsp">首页</a></h2></div>
<div style="width: 500px;margin: 50px auto">
<form class="layui-form" method="post">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">课程名称</label>
            <div class="layui-input-inline">
                <input name="lname" lay-verType="tips" lay-verify="lessoname" autocomplete="off" class="layui-input" type="tel"><span id="namespan"></span>
            </div>
        </div>
    </div>

    <%--选择老师--%>
    <div class="layui-form-item">
        <label class="layui-form-label">任课老师</label>
        <div class="layui-input-block" style="width: 190px">
            <select name="tbTeacher.tno" id="lname" lay-verify="teacher" lay-verType="tips">
                <option value="">请选择老师</option>
            </select>
        </div><br/>

        <div class="layui-input-block">
            <div class="layui-btn" lay-filter="formDemo" lay-submit>添加课程</div>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>

<script>
    //异步查询出老师
    $(function(){
        //取出所有可选的老师
        $(":input[name='tbTeacher.tno'] option:not(:first)").remove();
        $.post("teacherAction/findTeacherList","",function(data){
            $.each(data,function(i,v){
                var option="<option value='"+v.tno+"'>"+v.tname+"</option>";
                $(":input[name='tbTeacher.tno']").append(option);
                form.render();
            });
        });
    });
    
/*************************************************************************************/
    //提交监听
    form.on('submit(formDemo)', function(data){
        $.ajax({
            url:'lessonAction/addLesson',
            data:data.field,
            dataType:'text',
            type:'post',
            timeout:3000,
            success:function(result){
                layer.msg("添加成功");
            },
            error:function(){
                layer.msg("请正确填写课程信息！");
            }

        });
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });

    //非空验证
    form.verify({

        lessoname: function(data, item){
            if(data.length<=0 || !/^[^ ]+$/.test(data)){
                return '课程名称不能为空';
            }
        },
        teacher: function(data, item){
            if(data.length<=0){
                return '任课老师不能为空';
            }
        }
    });
</script>