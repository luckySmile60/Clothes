<template>
  <div class="reg">
    <div class="box">
      <van-cell-group>
        <van-field @focus="load" class="t1"
          v-model="username"
          label="注册用户名"
          placeholder="请输入用户名"
          :error-message="error1" 
        />
        <van-field @focus="load" class="t1"
          v-model="truename"
          label="真实姓名"
          placeholder="请输入真实名"
          :error-message="error2"
        />
        <div class="btn">
          <span>性别</span>
          <span class="s1"><input id="male" v-model="male" type="radio" name="sex"><span><label for="male">先生</label></span></span>
          <span class="s2"><input id="female" v-model="female" type="radio" name="sex"><span><label for="female">女士</label></span></span>
        </div>
        <van-field @focus="load" class="t1"
          v-model="city"
          label="所在城市"
          placeholder="请输入城市"
          :error-message="error3"
        />
        <van-field @focus="load" class="t1"
          v-model="phone"
          label="手机号码"
          placeholder="请输入手机号"
          :error-message="error4"
        />
        <van-field @focus="load" class="t1"
          v-model="email"
          label="电子邮箱"
          placeholder="请输入邮箱"
          :error-message="error5"
        />
        <van-field @focus="load" class="t1"
          v-model="upwd"
          label="登录密码"
          placeholder="请输入密码"
          :error-message="error6"
          type="password"
        />
        <van-field @focus="load" class="t1"
          v-model="rpwd"
          label="再输密码"
          placeholder="请输入密码"
          :error-message="error7"
          type="password"
        />
      </van-cell-group>
       <div class="b1"></div>
       <div class="b2">
         <input type="checkbox" checked="true">
         <span>我同意服务协议：
                1、申请人应提供完整、真实、准确、有效和最新的个人信息，个人信息（含证件有效期）发生变更后，应及时通过互联网平台变更
                2、申请人应保管好账号和密码。禁止赠与、借用、租用、转让或者售卖
                3、带*字段必填写项目
                4、因申请人原因导致账号、密码被他人非法使用，本网站不承担任何相应责任
                5、申请人如有违反本协议的行为，本网站有权暂停或终止申请人的账号，并保留追究法
                6、本协议及其修改权、最终解释权归本网站拥有
					</span>
       </div>
       <div class="b1"></div>
       <div class="bt">
         <button class="btn1" @click="register">注册</button>
         <button class="btn2"><router-link to="/Login">已经有账号了?请登录</router-link></button>
       </div>
       <div class="third">
        <span>第三方账号登录：</span>
        <img src="imgs/login_qq.png" alt="">
      </div>
    </div>
  </div>
</template>
<script>
import Vue from 'vue';
import { Field,Cell,CellGroup,Dialog,Notify } from 'vant';

Vue.use(Field).use(Cell).use(CellGroup).use(Dialog).use(Notify);
export default {
  data(){
    return{
      username:"",
      truename:"",
      male:"",
      female:"",
      city:"",
      phone:"",
      email:"",
      upwd:"",
      rpwd:"" ,
      error1:"",
      error2:"",    
      error3:"",
      error4:"",    
      error5:"",
      error6:"",    
      error7:"" ,
    }
  },
 methods:{
   load(){
     this.error1=this.error2=this.error3=this.error4=this.error5=this.error6=this.error7="";
   },
   register(){
    //  正则验证
    // 用户名
    let reg_uname=/^([a-z0-9\u4e00-\u9fa5]{2,12})$/i;
    // 真实名字
    let reg_truename=/^[\u4e00-\u9fa5]{2,5}$/;
    // 城市
    let reg_city=/^[\u4e00-\u9fa5]{2,5}$/;
    // 电话
    let reg_phone=/^1[3-8]\d{9}$/;
    //邮箱
    let reg_email=/^([a-zA-Z\d])(\w|\-)+@[a-zA-Z\d]+\.[a-zA-Z]{2,4}$/;
    // 密码
    let  reg_upwd=/^[a-z0-9]{6,12}$/i;
    if(!reg_uname.test((this.username).trim())){
      this.error1="用户名数字字母汉字2~12位";
      return;
    }
    if(!reg_truename.test((this.truename).trim())){
      this.error2="真实名字汉字2~5位";
      return;
    }
    if(!reg_city.test((this.city).trim())){
      this.error3="城市汉字2~5位";
      return;
    }
    if(!reg_phone.test((this.phone).trim())){
      this.error4="手机号11位";
      return;
    }
    if(!reg_email.test((this.email).trim())){
      this.error5="邮箱格式不正确";
     return;
    }
    if(!reg_upwd.test((this.upwd).trim())){
      this.error6="密码6~12位";
      return;
    }
    if(this.upwd!==this.rpwd){
      this.error7="密码输入不一致";
      return;
    }

    if(this.error1||this.error2||this.error3||this.error4||this.error5||this.error6||this.error7){
      Dialog.alert({
          message: '注册失败'
        }).then(() => {
          // on close
        });    
    }
    else{
      // 发送ajax请求完成注册验证
      var url="register";
      var obj={uname:this.username,truename:this.truename,sex:this.male?'男':'女',city:this.city,phone:this.phone,email:this.email,upwd:this.upwd,rpwd:this.rpwd};
      this.axios.get(url,{params:obj})
      .then(res=>{
        console.log(res.data);
        if(res.data.code==1){
          //  alert("注册成功");
           this.$notify('注册成功');
           this.$router.push("/Login");
        }else{
           Dialog.alert({
          message: '该用户名已经被注册,请重新注册'
        }).then(() => {
          // on close
        });
        }
      })
      .catch(err=>{
        alert("404");
      })
    }

   }
 }
  
}
</script>
<style>
.reg{
  margin-top:172px;
  padding:0 10px;
}
.reg .box{
  border:1px solid rgb(212, 211, 211);
  padding:10px;
  border-radius: 8px;
}
.reg .btn{
  display:flex;
  font-size:16px;
  margin-left:16px;
  color:#333;

}
.reg .t1{
  font-size:16px;
  color:#333;
  margin:10px 0;
 
}
.reg .s1{
  margin-left:3rem;
}
.reg .s2{
  margin-left:2rem;
}
.reg .s1>input,.s2>input{
  width:25px;
  height:13px;
}
.reg .b1{
  border-bottom: 1px solid rgb(206, 202, 202);
  margin:15px 0 0;
}
.reg .b2{
  display: flex;
  color:#666;
  font-size:15px;
}
.reg .bt{
  display:flex;
  justify-content:space-between;
  padding:20px 0;
  color: #333;

}
.reg .btn1{
  background-color: #333;
  color:#fff;
  border-radius: 5px;
  padding:4px 8px;
  border:1px solid #ddd;
}
.reg .btn2{
  margin-left:10px;
  border-radius: 5px;
  padding:4px 8px;
  border:1px solid #ddd;
  background-color: #fff;
  color: #666;
}
.reg .third{
  display:flex;
  color:#333;
  font-size:15px;
}
.reg a{
  color:#333;
}
</style>