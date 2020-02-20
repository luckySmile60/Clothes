<template>
  <div class="head">
    <div class="box">
      <div class="top" @click="drop">
      <div class="txt">{{text}}</div>
      <div><img src="imgs/bottom.png" alt=""></div>
      </div>
      <ul class="nav" v-show="display">
        <li @click="fun1"><img src="imgs/home.png" alt=""><router-link to="/index" class="txt">首页</router-link></li>
        <li @click="fun1"><router-link to="/AboutUs">关于我们</router-link></li>
        <li @click="fun1"><router-link to="/Product">产品商城</router-link></li>
        <li @click="fun1"><router-link to="/Album">SS19画册</router-link></li>
        <li @click="fun1"><router-link to="/Appointment">在线预约</router-link></li>
        <li @click="fun1"><router-link to="/JoinUs">招商加盟</router-link></li>
        <li @click="fun1"><router-link to="/Store">实体店</router-link></li>
        <li @click="fun1"><img src="imgs/cart.png" alt=""><router-link to="/Cart" class="txt"> 购物车</router-link></li>
      </ul>
   </div>
   <div class="round"  v-show="sth">
   <div class="box1">
     <span class="s1"><img class="pic" src="imgs/person.png" alt=""><router-link to="/Login" class="txt1">登录</router-link>
     </span>
     <span class="s1"><img class="pic" src="imgs/right.png" alt="/Register"><router-link to="/Register" class="txt1">注册</router-link>
     </span>
   </div>
   </div>

  </div>
</template>
<script>

export default {
  data(){
    return{
      display:false,
      text:"Mint~clothes",
      sth:true
    }
  },
  methods:{
    drop(){
      this.display=!this.display;
      if(!this.display){
        this.text="Mint~clothes"
      }else{
        this.text="关闭"
      }
      this.sth=!this.sth;
    },
    fun1(){
    this.display=false;
    this.sth=true;
  }
 
  }
  
   
}
</script>
<style scope>
.head{
  width: 100%;
}
.head .box{
  position: fixed;
  z-index:10;
  top:0;
  left:0;
  background-color: #41484D;
  width: 100%;
}

.head .top{
  padding: 15px 15px;
  display: flex;
  justify-content: space-between;
 
}
.head .txt{
  color:white;
  margin-left:1px;
}
.head .nav{
  display: flex;
  flex-direction: column;
  padding: 10px 16px;
  margin:0;
  text-align: left;
}
.head .nav>li{
  color: #fff;
  list-style: none;
 }
.head .nav>li:not(:first-child){
   margin-top:15px;
}
.head .nav a{
  text-decoration: none;
  color: #fff;
}
.head a.txt1{
  color: #4e4e4e;
  text-decoration: none;
  font: 14px;
  font-family: "微软雅黑";
  margin-left: 2px;
}
.head .box1{
  display: flex;
  justify-content:space-around;
}
.head .s1{
  display: flex;
}
.head .round{
  height:80px;
  width: 100%;
  padding-top:30px;
  position: absolute;
  top:50px;
  box-shadow: 1px 1px 16px #999;
}


</style>