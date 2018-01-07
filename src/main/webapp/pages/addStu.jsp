<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2017/12/25
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="margin:20px 20px"><h2>添加学生><a href="Main.jsp">首页</a></h2></div>
<div style="width: 500px;margin: 50px auto">
    <form class="layui-form" id="tab">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input name="sname" lay-verType="tips" lay-verify="sname" autocomplete="off" class="layui-input" type="tel"><span id="namespan"></span>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline">
                    <input name="sage" lay-verType="tips" lay-verify="sage" autocomplete="off" class="layui-input" type="tel"><span id="agespan"></span>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男" checked="">
                    <input type="radio" name="sex" value="女" title="女">
                </div>
            </div>

            <%--时间选择器--%>
            <div class="layui-inline">
                <label class="layui-form-label">入学时间</label>
                <div class="layui-input-inline">
                    <input lay-verify="intime" lay-verType="tips" name="sintime" placeholder="yyyy-MM-dd"  type="text" class="layui-input" id="sInTime"><span id="sintimespan"></span>
                </div>
            </div>

            <%--选择班级--%>
            <div class="layui-form-item">
                <label class="layui-form-label">所在班级</label>
                <div class="layui-input-block" style="width: 190px" lay-verType="tips">
                    <select name="tbClass.cno" id="tcname"  lay-verify="cls" lay-verType="tips">
                        <option value="">请选择班级</option>
                    </select>
                    <span id="clsspan"></span>
                </div>

            <div class="layui-input-block">
                <div class="layui-btn" lay-filter="formDemo" lay-submit>添加</div>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script>
    //时间选择器
    laydate.render({
        elem: '#sInTime' //指定元素

    });

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

/***********************************************************************************/
   //提交监听
    form.on('submit(formDemo)', function(data){
        $.ajax({
            url:'stuAction/addStu',
            data:data.field,
            dataType:'json',
            type:'post',
            timeout:3000,
        success:function(result){
            layer.msg("添加成功");
        },
        error:function(){
            layer.msg("请正确填写学生信息！");
        }

    });
        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
    });

//非空验证
  form.verify({

      intime: function(data, item){
          if(data.length<=0){
              return '时间不能为空';
          }
      },
      cls: function(data, item){
          if(data.length<=0){
              return '所在班级不能为空';
          }
      },
      sname: [
            /^[a-zA-Z]{2,30}$/
            ,'姓名长度为2-30个字符'
        ]
        ,sage: [
             /^(?:[1-9][0-9]?|1[01][0-9]|120)$/
            ,'年龄不合法'
        ]

    });

</script>