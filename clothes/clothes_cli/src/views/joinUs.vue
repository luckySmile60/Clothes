<template>
  <div class="join">
    <p>Alliance</p>
    <p>招商加盟</p>
    <img src="imgs/join1.jpg" alt="">
    <div>
      <p class="title">请登记!</p>
      <p class="sub_title">请在下侧仔细填写你的数据:</p>
    </div>
   
    <van-cell-group>
      <van-field class="box"
        v-model="username"
        required
        clearable
        label="联系人 :"
        right-icon="question-o"
        @click-right-icon="$toast('question')"
      />
       <van-field class="box"
        v-model="phone"
        type="text"
        label="联系电话 :"
        required
      />
      <van-field class="box"
        v-model="email"
        type="text"
        label="您的邮箱 :"
        required
      />
      <div class="b1">
      <van-button class="btn" type="default">提交</van-button>
      </div>
    
    </van-cell-group>
   
    

  </div>
</template>
<script>
import Vue from 'vue';
import { Field, Cell, CellGroup,Toast,Button } from 'vant';

Vue.use(Field).use(Cell).use(CellGroup).use(Toast).use(Button);
export default {
  data(){
    return{
    username:"",
    phone:"",
    email:""
     
    }
  }
}
</script>
<style>
.join{
  margin-top:170px;
  padding: 0 10px;
}
.join img{
  width:100%;
}
.join p:first-child{
  text-align: center;
  font-family:"微软雅黑";
  font-size:24px;
  color:#333; 
  margin: 0;
}
.join p:nth-child(2){
  text-align: center;
  color: #daa520;
  font-size: 20px;
  font-family: "微软雅黑";
}
.join p.title{
  font-size: 36px;
  font-family: "微软雅黑";
  color:rgb(151, 148, 148);

}
.join p.sub_title{
  color:#666;
  font-size: 16px;
  text-align: left;
}
.join .b1{
  display: flex;
  justify-content:center;
}
.join .btn{
  width:100px;
  height:30px;
  line-height: 30px;
  border-color: #aaa;
  border-radius: 5px;
 
}
.join .box{
  margin-top:5px;
}
</style>