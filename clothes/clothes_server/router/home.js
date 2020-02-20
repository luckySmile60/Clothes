// 引入express模块
const express=require('express');
// 引入连接池
const pool=require('../pool/pool.js');
// 创建router对象
var router=express.Router();

// 路由配置
// 功能一：用户登录
router.get("/login",(req,res)=>{
  // 获取参数
  var uname=req.query.uname;
  var upwd=req.query.upwd;
  console.log("用户名:"+uname+"密码:"+upwd);
  // 创建sql语句
  var sql = "SELECT uid FROM clothes_user WHERE uname=? AND upwd=?";
  // 执行sql语句
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err)throw err;
    console.log(result);
    // 判断执行是否成功
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码有误"});
      return;
    }else{
      // 登录成功后将登录凭证id保存session对象
      var uid=result[0].uid;
      // 将用户uid保存session对象
      req.session.uid=uid;
      console.log(req.session);
      res.send({code:1,msg:"登录成功",data:uid});

    }
  })
})
// http://127.0.0.1:6060/home/login?uname=pb&upwd=123456

// 用户注册
router.get("/register",(req,res)=>{
  // 获取数据
  var uname=req.query.uname;
  var truename=req.query.email;
  var sex=req.query.sex;
  var city=req.query.city;
  var phone=req.query.phone;
  var email=req.query.email;
  var upwd=req.query.upwd;
  var rpwd=req.query.rpwd;
  // 查询该用户是否已被注册
  var sql="SELECT uid FROM clothes_user WHERE uname=?"
  // 执行sql
  pool.query(sql,[uname],(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      var obj={uname,truename,sex,city,phone,email,upwd,rpwd}
      var sql=`INSERT INTO clothes_user SET ?`;
            pool.query(sql,[obj],(err,result)=>{
                if(err)throw err;
                if(result.affectedRows>0){
                    res.send({code:1,msg:"注册成功"}); 
                }
            })
          }else{
              res.send({code:0,msg:"该用户名已被注册"});
          }
      })
})
//http://127.0.0.1:6060/home/register?uname=pb&truename=哈哈&sex=1&city=成都&phone=13033331966&email=123@qq.com&upwd=123456&rpwd=123456

// 查询服务器商品列表
// 接收请求 get /product
router.get("/product",(req,res)=>{
  // 获取脚手架发来数据 pno(页码) pageSise(一页几行)
  var pno =req.query.pno;
  var ps=req.query.pageSize;
  var label=req.query.label;
  // 设置数据默认值
  if(!pno){pno=1}
  if(!ps){ps=6}
  // 创建变量offset计算数据库第一参数
  var offset=(pno-1)*ps;
  // 给pageSize造型整型
  ps=parseInt(ps);
  //创建sql1查询当前页内容
  var sql1="SELECT pid,img,title,price,label FROM clothes_product WHERE label=? LIMIT ?,?";
  // 发送sql语句
  pool.query(sql1,[label,offset,ps],(err,result)=>{
    // 查询成功的回调函数
    if(err)throw err;
    //查询结果
    var data=result;
    // 在执行成功回调函数中创建第二条 sql2
    var sql2="SELECT count(pid) AS c FROM clothes_product WHERE label=?";
    // 查询记录总数
    pool.query(sql2,[label],(err,result)=>{
      if(err)throw err;
      console.log("result[0].c结果是啥："+result[0].c);
      var pageCount=Math.ceil(result[0].c/ps);
      console.log(pageCount);
      res.send({
        code:1,
        msg:"查询成功",
        data:data,
        pageCount:pageCount
      })
    })
  })
})
//http://127.0.0.1:6060/home/product

// 查询详情列表内容
router.get("/detail",(req,res)=>{
  // 获取脚手架传来的数据
  var pid=req.query.pid;
  // console.log(pid);
  // 创建sql
  var sql="SELECT img,title,price,label FROM clothes_product WHERE pid=?";
  // 发送sql语句
  pool.query(sql,[pid],(err,result)=>{
    if(err)throw err;
    // 查询结果
    var data=result;
    // console.log(data);
    res.send({code:1,msg:"查询成功",data:data});
  })

})

// 查询商品详情内容的图片
router.get('/pic',(req,res)=>{
  // 获取脚手架传来的数据
  var lid=req.query.pid;
  // console.log(lid);
  // 创建sql
  var sql="SELECT lg1,sm1,lg2,sm2,lg3,sm3,lg4,sm4,lg5,sm5 FROM clothes_pic WHERE lid=?";
  // 发送sql语句
  pool.query(sql,[lid],(err,result)=>{
    if(err)throw err;
    //查询结果
    // console.log(result);
    res.send({code:1,msg:"查询成功",data:result});
  })
})



//添加购物车
router.get('/addcart',(req,res)=>{
  // 获取当前登录用户uid
  let uid=req.session.uid;
  // 如果用户没有登录
  if(!uid){
    // 返回错误信息  请登录
    res.send({code:-1,msg:"请登录"});
    return;
  }
  // 获取商品编号 商品价格 商品名称
  let pid=req.query.pid;
  let price=req.query.price;
  let title=req.query.title;
  let img=req.query.img;
  let count=req.query.count;
  console.log(pid,price,title,img,count)
  // 查询指定用户是否购买过此商品
  let sql='SELECT id FROM clothes_cart WHERE uid=? AND pid=?';
  // 执行sql
  pool.query(sql,[uid,pid],(err,result)=>{
    if(err)throw err;
    // 如果用户没有购买过此商品添加
    // 如果用户已经购买过此商品更新数量
    if(result.length==0){
        var sql=`INSERT INTO clothes_cart VALUES(null,${uid},${pid},${price},'${title}','${count}','${img}')`;
    }else{
        var sql=`UPDATE clothes_cart SET count=count+${count} WHERE uid=${uid} AND pid=${pid}`;
    }
    //执行sql并且将结果返回用户
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        console.log(result);
        res.send({code:1,msg:"添加成功"});
    })
 })
})


// 功能五：查询当前登录用户购物车列表
router.get("/findcart",(req,res)=>{
  // 获取session中uid
  var uid=req.session.uid;
  // 如果uid为空
  // 请登录
  if(!uid){
      res.send({code:-1,msg:"请登录"});
      return;
  }
  // 创建sql语句查询用户购物车列表
  var sql="SELECT id,pid,title,price,count,img FROM clothes_cart WHERE uid=?";
  // 发送sql语句
  pool.query(sql,[uid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result})
  })
})



//功能七:删除指定用户购物车中多个商品
router.get("/delm",(req,res)=>{
  //功能:删除多个商品
  //1:获取登录用户uid
  var uid = req.session.uid;
  //2:如果没有uid -2
  if(!uid){
    res.send({code:-2,msg:"请登录"});
    return;
  }
  //3:获取参数 ids
  var ids = req.query.ids;
  console.log(ids)
  //4:创建sql语句
  var sql = `DELETE FROM clothes_cart WHERE id IN (${ids})`;
  console.log(sql);
  //5:发送sql
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"})
    }else{
      res.send({code:-1,msg:"删除失败"}) 
    }
  })
  //6:获取数据库返回结果
  //7:发送脚手架
})



//功能六:删除指定用户购物车中一个商品
router.get("/del",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-2,msg:"请登录"});
    return;
  }
  // 参数
  var id=req.query.id;
  var sql="DELETE FROM clothes_cart WHERE id=?";
  // json
  pool.query(sql,[id],(err,result)=>{
    if(err)throw err;
    // affectedRows影响行数
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"})
    }else{
      res.send({code:-1,msg:"删除失败"})
    }
  })
})   



//查询label的前四个相关商品
router.get('/relative',(req,res)=>{
  let label = req.query.label;
  let sql=`SELECT img,title,price,pid FROM clothes_product WHERE label=? LIMIT 0,4`;
  pool.query(sql,[label],(err,result)=>{
    if(err)throw err;
    // console.log('相关数据为：'+result);
    res.send({coed:1,msg:"查询成功",data:result});
  })

})

module.exports=router;