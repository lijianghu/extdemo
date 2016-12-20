<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>03 窗体&表单</title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="./Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./Ext/ext-all.js"></script>
    <link rel="stylesheet" type="text/css" href="./Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                html: '<div>这里是窗体内容</div>',
            });
            var win = new Ext.Window({
                title: '窗口',
                width: 476,
                height: 374,
                html: '<div>这里是窗体内容</div>',
                resizable: true,
                modal: true,
                closable: true,
                maximizable: true,
                minimizable: true,
                items: form
            });
            win.show();
        });
    </script>
</head>
<body>
<!--
说明：
(1)var form = new Ext.form.FormPanel({}):创建一个新的form表单对象。
(2)title: '表单标题'：表单的标题，如果不加的话，不会出现上面的浅色表单标题栏。
(3)style: 'margin:10px':表单的样式，加了个外10px的外边距。
(4)html: '<div style="padding:10px">这里表单内容</div>'：表单内显示html的内容。

form 组件常用的：属性、方法及事件
一、属性
width:整型，表单宽度。
height:整型，表单高度。
url:字符串，表单提交地址。
二、方法
reset:表单重置。
isValid:表单是否验证全部通过。
submit:表单提交。
-->
</body>
</body>
</html>