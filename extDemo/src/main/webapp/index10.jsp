<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>09 下拉框&后台交互</title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="./Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./Ext/ext-all.js"></script>
    <script src="./Ext/src/locale/ext-lang-zh_CN.js" type="text/javascript"></script><!--中文翻译js-->
    <link rel="stylesheet" type="text/css" href="./Ext/resources/css/ext-all.css" />
  <!--ExtJs框架结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            //----------------------下拉列表开始----------------------//
            //创建市数据源
            var combocitystore = new Ext.data.Store({
                //设定读取的地址
                proxy: new Ext.data.HttpProxy({ url: '/extDemo/city' }),
                //设定读取的格式    
                reader: new Ext.data.JsonReader({ root: 'data' },
                 [{ name: 'id' }, { name: 'name'}])
            });
            //创建区数据源
            var comboareastore = new Ext.data.Store({
                //设定读取的地址
                proxy: new Ext.data.HttpProxy({ url: '/extDemo/area' }),
                reader: new Ext.data.JsonReader({ root: 'data' },
                 [{ name: 'id' }, { name: 'name'}])
            });
            //创建市Combobox
            var comboboxcity = new Ext.form.ComboBox({
                id: 'comboboxcity',
                fieldLabel: '市',
                width: 120,
                store: combocitystore,
                displayField: 'name',
                valueField: 'id',
                triggerAction: 'all',
                emptyText: '请选择...',
                allowBlank: false,
                blankText: '请选择市',
                editable: false,
                mode: 'local', //该属性和以下方法为了兼容ie8
                listeners: {
                    'render': function () {
                        combocitystore.load();
                    }
                }
            });

            //创建区Combobox
            var comboareacity = new Ext.form.ComboBox({
                fieldLabel: '区',
                width: 120,
                store: comboareastore,
                displayField: 'name',
                valueField: 'id',
                triggerAction: 'all',
                emptyText: '请选择...',
                allowBlank: false,
                blankText: '请选择区',
                editable: false
            });
            //联动的实现
            comboboxcity.on('select', function () {
                comboareastore.baseParams.id = comboboxcity.getValue();
                comboareacity.setValue('');
                comboareastore.load();
            })
            //----------------------下拉列表结束----------------------//
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                items: [comboboxcity, comboareacity]
            });
            //窗体
            var win = new Ext.Window({
                title: '窗口',
                width: 476,
                height: 374,
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
(1)var combocitystore = new Ext.data.Store():创建一个新的数据源。
(2)proxy: new Ext.data.HttpProxy({ url: '/App_Ashx/Demo/City.ashx' })：数据代理为http代理，地址为/App_Ashx/Demo/City.ashx。
(3)reader: new Ext.data.JsonReader({ root: 'data' },[{ name: 'id' }, { name: 'name'}]):读取json返回值根节点为data，对象列为id和name。
    这里要结合client与service观察,我在service端的输出如下：{data:[{id:1,name:'北京'},{id:2,name:'上海'}]}
(4)comboboxcity.on('select', function () {}：市选择变化时触发事件。
(5)comboareastore.baseParams.id = comboboxcity.getValue()：注意，前面的comboareastore是区的数据源，
    当市变化时，我们给区的数据源加上个向service端发送的参数。
(6)comboareacity.setValue('')：把区的下拉列表设置为空，由于非空验证，Ext会提示用户“请选择区”，这个地方也可以把加载出来的第一个区
    显示在区的下拉列表中，具体请自行实现吧。        
(7)comboareastore.load()：区的数据源重新加载。
-->
</body>
</html>