<template>
  <div class="login">
    <div class="box">
      <div class="b1">
        <span class="s1">用户名</span>
        <input class="p1" type="text" v-model="uname">
      </div>
      <div class="b2">
        <span class="s1">密&nbsp;码</span>
        <input class="p2" type="text" v-model="upwd">
      </div>
      <div class="b3">
        <input class="p3" type="checkbox" v-model="storageRem">
        <span class="s1">记住我（请在私人设备上使用此功能）</span>
      </div>
      <div class="b4"></div>
      <div class="btn">
        <button class="btn1" @click="login">登录</button>
        <button class="btn2"><router-link to="/Register">注册</router-link> </button>
      </div>
      <div class="third">
        <span>第三方账号登录：</span>
        <img src="imgs/login_qq.png" alt="">
      </div>
      <div class="txt"><span>忘记密码?点这里找回</span></div>
    </div>
    <div>
      <div class="title"><span>微信登录仅供演示，如需开通请另行购买</span></div>
      <div class="sub">
        <span>说明：</span>
        <span>1.实际使用之前，需配置用户管理组件中的相关邮件。详情请参考教程：</span>
        <div>
        <span>2.新用户注册后的审核方式有三种：自动核准、邮件激活、需要管理员批准（即人工审核），详情可参考教程</span><span class="sub1">《如何设置用户注册后的审核方式》</span>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Vue from 'vue';
import { Dialog } from 'vant';
Vue.use(Dialog);
export default {
  data(){
    return{
      uname:"",
      upwd:"",
      storageRem:''
    }
  },
  mounted(){
    this.existlocal();
  },
  methods:{
    login(){
      // 匹配用户名的正则表达式
      let reg=/^([a-z0-9\u4e00-\u9fa5]{2,8})$/i;
     // 匹配密码的正则表达式
      let reg1=/^[a-z0-9]{6,8}$/i;
      // 获取用户输入 用户名 密码
      let u=this.uname;
      let p=this.upwd;
      console.log(`姓名：${u}，密码：${p}`);
      // 验证用户名
      if(!reg.test(u.trim())){
        Dialog.alert({
          message:'用户名输入错误'
        }).then(()=>{})
        return;
      }else if(!reg1.test(p.trim())){
        Dialog.alert({
          message:'密码输入错误'
        }).then(()=>{})
        return;
      }
      // 发送ajax请求完成登录验证
      let url="login";
      let obj={uname:u,upwd:p};
      this.axios.get(url,{params:obj})
      .then(res=>{
        // 成功回调
        console.log(res.data);
        sessionStorage.setItem("key","res.data.uid");
        let data = sessionStorage.getItem("key");
        console.log("data"+data);
        if(data){
          let a=confirm("登录成功");
          // console.log(a)
          /*---------记住我功能开始----------*/
          // 判断浏览器是否支持web storage
          if(typeof(Storage)!==undefined){
            // 如果点击了记住密码，设置localstorage
            if(this.storageRem==true){
              // 注意转换字符串JSON.stringfy存，不然存进去显示不出数据而是类型
              localStorage.setItem('data',JSON.stringify({name:this.uname,password:this.upwd}))
              sessionStorage.removeItem('data')
            }else{//没有清除localstorage,设置sessionstorage
              localStorage.removeItem('data')
              sessionStorage.setItem('data',JSON.stringify({name:this.uname,password:this.upwd}))
            }
          }
          /*---------记住我功能结束----------*/ 
          if(a==1){
            this.$router.push('/Product');
          }
        }else{
          Dialog.alert({
          message: '该用户不存在，登录失败'
        }).then(() => {
          // on close
        });
        }
      })
      .catch(err=>{
        console.log(err)
      })
    },
    // 记住密码判断是否有localStorage
    existlocal(){
      // 取出来的时候，JSON再转对象JSON.parse
      let haslocal = JSON.parse(localStorage.getItem("data"));
      if(haslocal!==null){
        this.uname=haslocal.name;
        this.upwd=haslocal.password;
      }
    }
  }  
}
</script>
<style>
.login{
  margin-top:172px;
  padding:0 10px;
}
.login .box{
  border:1px solid rgb(212, 211, 211);
  padding:10px;
  border-radius: 8px;
}
.login .b1,.b2{
  display: flex;
  justify-content: space-around;
  padding:10px;
  
}
.login .b3{
  display:flex;
  justify-content: center;
  padding:10px; 
  margin-left:6rem;
}
.login .p1,.p2{
  width:50%;
  padding:4px 20px;
  border-radius: 5px;
  background-color: #f5f5f5;
  border:1px solid #ddd;
}
.login .p2{
  margin-left:12px;
}
.login .s1{
  font-size:16px;
  color:#333;
}
.login .p3{
  margin-top:5px;
  width:20px;
  height:15px;
}
.login .b4{
  border-bottom: 1px solid rgb(206, 202, 202);
  margin:15px 0 0;
}
.login .btn{
  margin-top:20px;
}
.login .btn1{
  background-color: #333;
  color:#fff;
  border-radius: 5px;
  padding:4px 8px;
  border:1px solid #ddd;
}
.login .btn2{
  margin-left:10px;
  border-radius: 5px;
  padding:4px 8px;
  border:1px solid #ddd;
  background-color: #fff;
  color: #666;
}
.login .third{
  padding:20px 0px;
  display: flex;
}
.login .third>span{
  color:#333;
  font-size:16px;
}
.login .txt{
  display: flex;
  justify-content: flex-end;
}
.login .txt>span{
  color:#333;
  font-size:16px;
}
.login .title{
  display: flex;
  justify-content: center;
  padding:20px 0px;

}
.login .title>span{
  color:#333;
  font-size:16px;
}
.login .sub{
  display:flex;
  flex-direction: column;
  line-height: 2;
  color:#333;
}
.login .sub1{
  color:#efc062;
}
.login a{
  color:#333;
}
</style>