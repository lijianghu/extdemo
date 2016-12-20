<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- http://blog.csdn.net/u014114857/article/details/49638867 -->
<head>
    <title>13-1 树形结构</title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="./Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="./Ext/ext-all.js"></script>
    <script src="./Ext/src/locale/ext-lang-zh_CN.js" type="text/javascript"></script><!--中文翻译js-->
    <link rel="stylesheet" type="text/css" href="./Ext/resources/css/ext-all.css" />
   <!--ExtJs框架结束-->
<script type="text/javascript">  
//如果需要显示校验信息，此行必须  
Ext.onReady(function() {  
Ext.QuickTips.init();  
/*new Ext.Viewport({ 
layout:"border", 
items:[ 
   //{region:"north",title:"Up",height:50}, 
   //{region:"south",title:"Down",height:50}, 
   //{region:"west",title:"Left",width:200}, 
//  {region:"east",title:"Right",width:200}, 
   {region:"center",title:"Center"} 
] 
});*/  
var pnNorth=new Ext.Panel({  
id:'pnNorth',  
autoWidth:true,  
heigth:80,  
frame:true,  
region:'north',  
html:'这里放置页头内容'  
});  
//创建一个简写  
var Tree = Ext.tree;  
// 定义根节点的Loader  
var treeloader = new Tree.TreeLoader({  
       // dataUrl : 'tree.jsp'//这里可以不需要指定URL，在加载前事件响应里面设置  
       });  
           // 异步加载根节点  

var treepanel = new Tree.TreePanel({  
   // renderTo:"tree_div",//如果使用renderTo，则不能使用setRootNode()方法，需要在TreePanel中设置root属性。  
   el : 'tree-panel',// 将树形添加到一个指定的div中,非常重要！  
   region : 'west',  
   title : '功能菜单',  
   width : 200,  
   heigth:500,  
   minSize : 180,  
   maxSize : 250,  
   split : true,  
  // autoHeight : true,  
   frame : true,// 美化界面  
   // width : 200,//面板宽度  
   // title : '可编辑和拖动的异步树',//标题  
   // autoScroll : true, // 自动滚动  
   enableDD : true,// 是否支持拖拽效果  
   containerScroll : true,// 是否支持滚动条  
   rootVisible : true, // 是否隐藏根节点,很多情况下，我们选择隐藏根节点增加美观性  
   border : true, // 边框  
   animate : true, // 动画效果  
   loader : new Ext.tree.TreeLoader()  
       // 树加载  
   });  
       var rootnode = new Tree.AsyncTreeNode({  
           id : '0',  
           text : '家电品牌总类',  
           draggable : false,// 根节点不容许拖动  
           expanded : true  
       });  
       //鼠标停留在节点显示信息->qtip:'No1'  
       //给节点加超链接href，extjs树形节点没有ajax，使用Ext.tree.AsyncTreeNode可以异步加载  
 var root1=new Ext.tree.AsyncTreeNode({          
                text:'我是根',              
                      children:[             
                          {text:'新浪网',qtip:'No1新浪网',leaf:true,href:'http://www.sina.com.cn'},      
                          {text:'百度中国',qtip:'<a class="channel_keylink" href="http://www.pqshow.com/Special/seo/" target="_blank">搜索引擎</a>',leaf:true,href:'http://www.baidu.cn',hrefTarget:'_blank'}  
                    ]});  
                      
    var root=new Tree.TreeNode({text:'区域信息'});   
    var node1=new Tree.TreeNode({text:'湖南省'});   
    var node3=new Tree.TreeNode({text:'广东省'});  
    var node2=new Tree.TreeNode({text:'广州市'});   
node3.appendChild(node2);   
root.appendChild(node1);   
root.appendChild(node3);      
treepanel.setRootNode(root1);       
//    tree.render();   
//  treepanel.setRootNode(rootnode);  
// 渲染树形  
// 添加第二个节点(autoLoad)  

treepanel.render();  
// 展开节点,第一个参数表示是否级联展开子节点  
// rootnode.expand();  
var pnWest=new Ext.Panel({  
id:'pnWest',  
title:'菜单项',  
width:200,  
heigth:500,  
split:true,//显示分隔条  
region:'west',  
collapsible:true,  
items:[treepanel  
]  
 
});  
//点击事件  
treepanel.on("click", function(node) {  
       Ext.Msg.show({  
           title : '提示',  
           msg : "你单击了" + node,  
           animEl : node.ui.textNode  
       });  
   });  
   //右键菜单  
   var contextmenu = new Ext.menu.Menu({  
       id : 'theContextMenu',  
       items : [ {  
           text : '点击',  
           handler : function() {  
               alert('我被点中了');  
           }  
       } ]  
   });  
   //绑定点击事件  
   treepanel.on("contextmenu", function(node, e) {  
       e.preventDefault();  
       node.select();  
       contextmenu.showAt(e.getXY());  
   });  

   var pnCenter = new Ext.TabPanel({  
       region : 'center',  
       activeTab : 0,  
       items : [ {  
           title : '收件箱',  
           authHeight : true,  
           closable : true,//是否可关闭  
           html : '这里显示所收邮件。。。'  
       } ]  
   });  
//整个页面布局，左边treepanel 右边 是tabpanel  
   var vp = new Ext.Viewport({  
       layout : "border",  
       items : [  
       //pnNorth,  
       treepanel, pnCenter ]  
   });  

});  
</script> 
</head>
<body>
 <div id="tree-panel"></div>  
</body>
</html>