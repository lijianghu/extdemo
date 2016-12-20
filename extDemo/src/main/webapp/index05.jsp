<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>05 点击事件</title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="./Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./Ext/ext-all.js"></script>
    <link rel="stylesheet" type="text/css" href="./Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->
   <!--ExtJs框架结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';
            //提交按钮处理方法
            var btnsubmitclick = function () {
                Ext.MessageBox.alert('提示', '你点了确定按钮!');
            }
            //重置按钮"点击时"处理方法
            var btnresetclick = function () {
                Ext.MessageBox.alert('提示', '你点了重置按钮!');
            }
            //重置按钮"鼠标悬停"处理方法
            var btnresetmouseover = function () {
                Ext.MessageBox.alert('提示', '你鼠标悬停在重置按钮之上!');
            }
            //提交按钮
            var btnsubmit = new Ext.Button({
                text: '提交',
                handler: btnsubmitclick
            });
            //重置按钮
            var btnreset = new Ext.Button({
                text: '重置',
                listeners: {
                    //'mouseover': btnresetmouseover,
                    'click': btnresetclick
                }
            });
            //用户名input
            var txtusername = new Ext.form.TextField({
                width: 140,
                allowBlank: false,
                maxLength: 20,
                name: 'username',
                fieldLabel: '用户名称',
                blankText: '请输入用户名',
                maxLengthText: '用户名不能超过20个字符'
            });
            //密码input
            var txtpassword = new Ext.form.TextField({
                width: 140,
                allowBlank: false,
                maxLength: 20,
                inputType: 'password',
                name: 'password',
                fieldLabel: '密码',
                blankText: '请输入密码',
                maxLengthText: '密码不能超过20个字符'
            });
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                html: '<div style="padding:10px">这里表单内容</div>',
                items: [txtusername, txtpassword],
                buttons: [btnsubmit, btnreset]
            });
            //窗体
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
                buttonAlign: 'center',
                items: form
            });
            win.show();
        });
    </script>
</head>
<body>
<!--
说明：
(1)var btnsubmit = new Ext.Button():创建一个新的Button按钮对象。
(2)handler: btnsubmitclick：当用户点击的时候[即js中的onclick事件]执行方法btnsubmitclick。
(3)listeners: {'mouseover': btnresetmouseover,'click': btnresetclick}：当用户点击的时候[即js中的onclick事件]执行方法btnresetclick，
    鼠标悬停时执行方法btnresetmouseover。
(4)handler与listeners的区别：
    handler:执行的是首发事件，click是button这个组件的首发事件。这就是handler的运行方式：被某个组件的首要event所触发。
            handler是一个特殊的listener。
    listener：是一个事件名 + 处理函数的组合，事件监听，如上例代码所示，我们监听了两个事件"click"，与"mouseover"事件，并且会顺序执行。
-->
</body>
</html>