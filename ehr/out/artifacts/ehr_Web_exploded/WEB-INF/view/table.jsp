<%@ include file="include/head.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>table模块快速使用</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
</head>
<body>
<div class="demoTable">
    搜索商户：
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<script>
    $('.demoTable .layui-btn').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
</script>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-mini" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-mini" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-mini" lay-event="add">添加</a>
</script>

<script src="/static/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 430
            ,url: '../employee/findAll' //数据接口
            ,page: true //开启分页
            ,limit: 10
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": "", //解析提示文本
                    "count": 100, //解析数据长度
                    "data": res//解析数据列表
                };
            }
            ,cols: [[ //表头
                {field: 'employeeId', align: 'center' ,title: '员工号', width:100}
                ,{field: 'name', align: 'center' ,title: '用户名', width:100}
                ,{field: 'age', align: 'center' ,title: '年龄', width:100}
                ,{field: 'sex', align: 'center' ,title: '性别', width:100}
                ,{field: 'phoneNumber', align: 'center' ,title: '联系电话', width:150}
                ,{field: 'address', align: 'center' ,title: '居住地址', width: 150}
                ,{field: 'permission', align: 'center' ,title: '权限', width: 100}
                ,{field: 'right', align: 'center' ,title: '操作', width: 350,toolbar:"#barDemo"}
            ]]
        });

    });
</script>
</body>
</html>