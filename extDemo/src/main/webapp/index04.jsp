<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>04 定义表单内容</title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="./Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./Ext/ext-all.js"></script>
    <link rel="stylesheet" type="text/css" href="./Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';
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
            var txtusername1 = new Ext.form.TextField({
                width: 140,
                allowBlank: false,
                maxLength: 20,
                name: 'username1',
                fieldLabel: '用户名称1',
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
                items: [txtusername,txtusername1,txtpassword]
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
                items: form
            });
            win.show();
        });
    </script>
</head>
<body>
<!--
说明：
(1)Ext.QuickTips.init()：QuickTips的作用是初始化标签中的Ext:Qtip属性，并为它赋予显示提示的动作。
(2)Ext.form.Field.prototype.msgTarget = 'side'：TextField的提示方式为：在右边缘，如上图所示，参数枚举值为"qtip","title","under","side",id(元素id)，
   side方式用的较多，右边出现红色感叹号，鼠标上去出现错误提示。
(3)var txtusername = new Ext.form.TextField():创建一个新的TextField文本框对象。
(4)allowBlank: false：不允许文本框为空。
(5)maxLength: 20：文本框的最大长度为20个字符，当超过20个字符时仍然可以继续输入，但是Ext会提示警告信息。
(6)name: 'password'：表单名称，这个比较重要，因为我们在与服务器交互的时候，服务端是按name接收post的参数值。
(7)fieldLabel: '用户名'：文本框前面显示的文字标题，如“用户名”，“密码”等。
(8)blankText: '请输入用户名'：当非空校验没有通过时的提示信息。
(9) maxLengthText: '用户不能超过20个字符'：当最大长度校验没有通过时的提示信息。
-->
</body>
</html>