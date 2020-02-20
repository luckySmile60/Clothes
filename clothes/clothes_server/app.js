// 引入模块
const express = require ( 'express' );
// 引入body-parser插件为Post请求做准备
const bodyParser = require ( 'body-parser' );
const mysql = require ( "mysql" );
const cors = require ( "cors" );
const session = require ( "express-session" );
// 引入路由
const homeParser = require ( "./router/home.js" );

//创建express对象
var app = express ();
// 服务器监听
app.listen ( 6060 ); 
console.log ( "server is running at http://127.0.0.1:6060" )
// 中间件
// 1.bodyParser中间件
app.use( bodyParser.urlencoded ( {
  extended:false
} ) );
// 2.跨域中间件
app.use ( cors ( {
  origin:["http://127.0.0.1:8080","http://localhost:8080","http://localhost:8081","http://127.0.0.1:8081","http://192.168.0.107:8080"],
  credentials:true//每次请求验证
} ) )
// 3.静态文件
app.use ( express.static ("public") );
// 4.session
app.use ( session ({
  secret:'128位安全字符串',//安全字符串，用户保存数据加密条件
  resave:true,//每次请求更新数据
  saveUninitialized:true //保存初始化数据
} ) );

// 路由器
app.use('/home',homeParser);