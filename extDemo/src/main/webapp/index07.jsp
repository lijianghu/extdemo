<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>07 重写&日期组件</title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="./Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./Ext/ext-all.js"></script>
    <script src="./Ext/src/locale/ext-lang-zh_CN.js" type="text/javascript"></script><!--中文翻译js-->
    <link rel="stylesheet" type="text/css" href="./Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->
    <style type="text/css">
        .x-form-unit
        {
            height: 22px;
            line-height: 22px;
            padding-left: 2px;
            display: inline-block;
            display: inline;
        }
    </style>
    <script type="text/javascript">
        //----------------------重写文本框开始----------------------//
        Ext.override(Ext.form.TextField, {
            unitText: '',
            onRender: function (ct, position) {
                Ext.form.TextField.superclass.onRender.call(this, ct, position);
                // 如果单位字符串已定义 则在后方增加单位对象   
                if (this.unitText != '') {
                    this.unitEl = ct.createChild({
                        tag: 'div',
                        html: this.unitText
                    });
                    this.unitEl.addClass('x-form-unit');
                    // 增加单位名称的同时 按单位名称大小减少文本框的长度 初步考虑了中英文混排 未考虑为负的情况   
                    this.width = this.width - (this.unitText.replace(/[^\x00-\xff]/g, "xx").length * 6 + 2);
                    // 同时修改错误提示图标的位置   
                    this.alignErrorIcon = function () {
                        this.errorIcon.alignTo(this.unitEl, 'tl-tr', [2, 0]);
                    };
                }
            }
        });
        //----------------------重写文本框结束----------------------//

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
                //Ext.MessageBox.alert('提示', '你鼠标悬停在重置按钮之上!');
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
                    'mouseover': btnresetmouseover,
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
            //----------------------数字字段开始----------------------//
            var numberfield = new Ext.form.NumberField({
                fieldLabel: '身高',
                width: 80,
                decimalPrecision: 1,
                minValue: 0.01,
                maxValue: 200,
                unitText: ' cm',
                allowBlank: false,
                blankText: '请输入身高'
            });
            //----------------------数字字段结束----------------------//
            //----------------------隐藏域字段开始----------------------//
            var hiddenfield = new Ext.form.Hidden({
                name: 'userid',
                value: '1'
            });
            //----------------------隐藏域字段结束----------------------//
            //----------------------日期字段开始----------------------//
            var datefield = new Ext.form.DateField({
                fieldLabel: '出生日期',
                format: 'Y-m-d',
                editable: false,
                allowBlank: false,
                blankText: '请选择日期'
            });
            //----------------------日期字段结束----------------------//
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                html: '<div style="padding:10px">这里表单内容</div>',
                items: [txtusername, txtpassword, numberfield, hiddenfield, datefield],
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
(1)var numberfield = new Ext.form.NumberField():创建一个新的NumberField数字文本框对象。
(2)99行，decimalPrecision: 1：设置小数点后面的位数，当位数超过时系统会自动截断。
(3)100行，minValue: 0.01：设置数字文本框最小值。
(4)101行，maxValue: 200:设置最大值。
(5)102行，unitText: ' cm'：注意，这个属性并非 Extjs文本框自带的属性，因为我们要在“身高”的后面加上
          单位，所以在23行---43行对文本框进行了重写，重写时添加了属性"unitText"，并且在样式表中加了样式"x-form-unit"。
(6)var hiddenfield = new Ext.form.Hidden()：创建一个新的Hidden对象，隐藏字段用作参数占位符，
          一般用来保存一些不希望用户直接看到的参数，并发送到服务器，例如：用户ID等。
(7)109行，name: 'userid'：Hidden对象的名称，这个名称是在服务端接收值的名称。发送参数格式如下：userid:1。
(8)110行，value: '1'：发送的值。
(9)var datefield = new Ext.form.DateField()：创建一个新的Datefield日期对象,Extjs的日期为英文类型，
              所以要加入翻译成中文的js，代码第8行位置。
(10)116行，format: 'Y-m-d'：日期格式。
(11)117行，editable: false：设置为不可编辑。
-->
</body>
</html>