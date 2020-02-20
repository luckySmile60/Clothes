<template>
  <div class="online">
    <p>Appointment</p>
    <p>在线预约</p>
    <div class="box">
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
        label="联系邮箱 :"
        required
      />
      <van-field class="box"
        v-model="city"
        type="text"
        label="所在城市 :"
        required
      />
      <van-field
        v-model="message"
        rows="2"
        autosize
        label="留言"
        type="textarea"
        maxlength="50"
        show-word-limit
      />
    </van-cell-group>
      <div class="b1">
      <van-button class="btn" type="danger">提交预约</van-button>
      </div>
    </div>
    <div><p class="call">联系我们</p></div>
    <div class="text">
      <span>地&nbsp;址：广东省中山市板芙镇顺景工业区</span>
      <span>电&nbsp;话：0678-666777888</span>
      <span>传&nbsp;真：0678-666777888</span>
      <span>邮&nbsp;编：100080</span>
      <span>邮&nbsp;箱：info@mint.com.cn</span>
    </div>
  </div>
</template>
<script>
import Vue from 'vue';
import { Field, Cell} from 'vant';

Vue.use(Field).use(Cell);
export default {
  data(){
    return{
        username:"",
        phone:"",
        email:"",
        city:"",
        message:""
        
    }
  },
   methods: {

   }    
}
</script>
<style>
.online{
  margin-top:170px;
  padding:0 10px;
}
.online .b1{
  display:flex;
  justify-content: center;
  margin-top:20px;
}
.online .btn{
  border-radius:5px;
  height:30px;
  line-height: 30px;
}
.online>p:nth-child(1){
  font-family: "宋体";
  font-size:36px;
  color:#666;
  margin-bottom:0px;
}
.online>p:nth-child(2){
  font-size: 20px;
  color:#d85a5a;
}
.online .text{
  display: flex;
  flex-direction: column;
}
.online .text>span{
  margin-top:10px;
  color:#333;
  font-size: 16px;
}
.online .call{
  font-size: 20px;
  color:#333;
  margin-bottom:0;
}
</style>