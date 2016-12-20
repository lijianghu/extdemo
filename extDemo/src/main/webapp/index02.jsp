<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>02 窗体</title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="./Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./Ext/ext-all.js"></script>
    <link rel="stylesheet" type="text/css" href="./Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            var win = new Ext.Window({
                title: '窗口',
                width: 476,
                height: 374,
                html: '<div>这里是窗体内容</div>',
                resizable: true,
                modal: true,
                closable: true,
                maximizable: true,
                minimizable: true
            });
            win.show();
        });
    </script>
</head>
<body>
    <!--
说明：
(1)var win = new Ext.Window({}):创建一个新的Window窗体对象。
(2)title: '窗口'：窗体的标题。
(3)width: 476,height: 374：宽度及高度。
(4)html: '<div>这里是窗体内容</div>'：窗体内部显示的html内容。
(5)resizable: true：是否可以调整窗体的大小，这里设置为 true。
(6)modal: true：是否为模态窗体[什么是模态窗体？当你打开这个窗体以后，如果不能对其他的窗体进行操作，那么这个窗体就是模态窗体，否则为非模态窗体]。
(7)closable:true：是否可以关闭，也可以理解为是否显示关闭按钮。
(8)maximizable: true：是否可以最大化，也可以理解为是否显示最大化按钮。
(9)minimizable: true：是否可以最小化，也可以理解为是否显示最小化按钮。
(10)win.show()：窗体展示。
-->
</body>
</html>