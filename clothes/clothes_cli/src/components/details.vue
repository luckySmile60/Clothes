<template>
  <div class="detail">
    <!-- <div class="big_box">
        <div>
          <div class="box">
            <div class="md_img" ><img :src=this.md1 alt=""></div>
          </div>
          <div class="small_box">
            <button class="left" @click="prev" :disabled="disabled1">&lt;</button>
            <div class="nav">
              <ul ref="allImg">
                <li v-for="(pic,index) in pics" :key="index" ><img class="pic" @click="count(pic.md)" :src="pic.sm"  :data-md="pic.md"  alt=""></li>
              </ul>
            </div>
            <button :disabled="disabled2" class="right" @click="next">&gt;</button>
        </div>
      </div>
    </div> -->
    <div class="box">
      <div>
      <div class="s1">
      <img class="bigimg" :src='img'>
      </div>
      <div class="s2">
       <img class="first" :src="sm1" @click="fun1" alt="">
       <img :src="sm2" @click="fun2" alt="">
       <img :src="sm3" @click="fun3" alt="">
       <img :src="sm4" @click="fun4" alt="">
       <img :src="sm5" @click="fun5" alt="">
      </div>
      <div class="title"><span>{{title}}</span></div>
      <div class="price"><span>￥&nbsp;{{price.toFixed(2)}}</span></div>
      <div class="num1">商品数量：<van-stepper v-model="value" /></div>
      </div>
    </div>
    <!-- ---------------相关产品开始------------------ -->
    
      <h3>相关商品</h3>
      <div class="shadow">
        <div class="rel">
            <div class="rel1"  v-for="(item,i) of list" :key="i">
              <img class="images" :src="'imgs/'+item.img" alt="">
              <div class="font1">{{item.title}}</div>
              <div class="font2">￥：{{item.price.toFixed(2)}}</div>
              <div class="dels">
                <button @click="up(item.pid)">查看详情</button>
              </div>
            </div>
        </div>
      </div>
    <!-- ---------------相关产品结束------------------ -->
    <div class="boot">
    <van-goods-action>
      <van-goods-action-icon icon="chat-o" text="客服" />
      <van-goods-action-icon icon="cart-o" :info="sum" text="购物车" @click="onClickIcon" />
      <van-goods-action-button type="warning" color="#be99ff" text="加入购物车" @click="onClickButton" />
      <van-goods-action-button type="danger" color="#7232dd" text="立即购买"  />
    </van-goods-action>
    </div>
  </div>
</template>
<script>
import Vue from 'vue';
import { GoodsAction,GoodsActionIcon,GoodsActionButton,Toast,Stepper } from 'vant';
Vue.use(GoodsAction).use(GoodsActionIcon).use(GoodsActionButton).use(Toast).use(Stepper);

export default {
  //接一下地址栏传过来的pid
  // props:["pid"],
  data(){
    return{  
      // md1:"",
      // pics:[
      //   {sm:"imgs/d1_sm.jpg",md:"imgs/d1_md.jpg"},
      //   {sm:"imgs/d2_sm.jpg",md:"imgs/d2_md.jpg"},
      //   {sm:"imgs/d3_sm.jpg",md:"imgs/d3_md.jpg"},
      //   {sm:"imgs/d4_sm.jpg",md:"imgs/d4_md.jpg"},
      //   {sm:"imgs/d5_sm.jpg",md:"imgs/d5_md.jpg"}
      // ],
      // display:false,
      // // 初始设置左按钮为禁用状态
      // disabled1:true,
      // // 初始设置右按钮为启用状态
      // disabled2:false,
      // moved:0,
      title:"",
      price:0,
      img:'',
      lg1:'',
      lg2:'',
      lg3:'',
      lg4:'',
      lg5:'',
      sm1:'',
      sm2:'',
      sm3:'',
      sm4:'',
      sm5:'',
      sum:0,
      img1:"",
      value:1,
      label:"",
      list:[],
    }
  },
  created(){
    this.loadmore();
  },
  mounted(){
    this.axios.get("/findcart")
    .then(res=>{
      console.log(res.data.data);
      let arr=res.data.data;
      for(let item of arr){
        this.sum+=item.count;
      }
      console.log(this.sum);
    })
    .catch(err=>{
      console.log(err);
    })
  },
  methods:{
    // count(md){
    //   // 获取中图
    //   let md1=md;
    //   this.md1=md1;
    // },
    // prev(){
    //   // 如果左边按钮没有被禁用，则次数减减
    //   if(!this.disabled1){
    //     this.moved--;
    //     // 让ul整体向左移动-51px一次
    //     this.$refs.allImg.style.marginLeft=-51*this.moved+"px";
    //     //当左移次数减到0时则将左边按钮禁用
    //     if(this.moved==0){
    //       this.disabled1=true;
    //     }
    //     // 而右边按钮则为启用状态
    //     this.disabled2=false;
    //   }
    // },
    // next(){
    //   // 如果右边按钮为启用状态，则点击一次按钮，则ul整体向左移动51px
    //   if(!this.disabled2){
    //   this.moved++;
    //   this.$refs.allImg.style.marginLeft=-51*this.moved+"px";
    //   // 当次数为所有图片张数-3，则禁用右按钮
    //   if(this.moved==this.pics.length-3){
    //     this.disabled2=true;
    //   }
    //   // 启用左按钮
    //   this.disabled1=false;
    //   }
      
    // }
   
    loadmore(){
      // this.$route.params.pid 获得地址中的参数
    this.axios.get("/detail",{params:{pid:this.$route.params.pid}})
    .then(res=>{
      // console.log(res.data);
      this.title=res.data.data[0].title;
      this.img1=res.data.data[0].img;
      this.price=res.data.data[0].price;
      this.label=res.data.data[0].label;
      console.log('数据为：'+this.title,this.img1,this.price,this.label);
      // 获取相关商品
      this.axios.get('/relative',{params:{label:this.label}})
      .then(res=>{
        console.log(res.data.data);
        this.list=res.data.data;
    })
    .catch(err=>{
      console.log(err);
    })
    })
    .catch(err=>{
      console.log(err)
    });

    this.axios.get("/pic",{params:{pid:this.$route.params.pid}})
    .then(res=>{
      // console.log(res.data.data);
      let img=res.data.data[0]
      console.log(img)
      this.lg1='imgs/'+img.lg1;
      this.lg2='imgs/'+img.lg2;
      this.lg3='imgs/'+img.lg3;
      this.lg4='imgs/'+img.lg4;
      this.lg5='imgs/'+img.lg5;
      this.sm1='imgs/'+img.sm1;
      this.sm2='imgs/'+img.sm2;
      this.sm3='imgs/'+img.sm3;
      this.sm4='imgs/'+img.sm4;
      this.sm5='imgs/'+img.sm5;
      this.img='imgs/'+img.lg1;
    })
    .catch(err=>{
      console.log(err)
    });

    },
    up(pid){
      // e.preventDefalut();
      this.$router.push(`/Details/${pid}`)
      this.$router.go(0)
    },
    fun1(){
      this.img=this.lg1;
    },
    fun2(){
      this.img=this.lg2;
    },
    fun3(){
      this.img=this.lg3;
    },
    fun4(){
      this.img=this.lg4;
    },
    fun5(){
      this.img=this.lg5;
    },
    onClickIcon() {
      // Toast('点击图标');
      this.$router.push("/Cart")
    },
    onClickButton() {
      // Toast('点击按钮');
      // 加入购物车
      // 获取 价格this.price 名称this.title 商品编号this.$route.params.pid
      let price=this.price;
      let title=this.title;
      let img=this.img1;
      let count=this.value;
      let pid=this.$route.params.pid;
      // 发送ajax请求
      let url="addcart"
      let obj={pid,title,price,img,count};
      this.axios.get(url,{params:obj})
      .then(res=>{
         console.log(res);
        if(res.data.code==1){
           Toast("添加成功");
          //  点击一次就把count加一次
           this.sum += this.value;
        }else{
          Toast("请登录");
          this.$router.push("/Login");
        }
        
      })
      .catch(err=>{
        console.log(err);
      })
    }
  }
}
</script>
<style>
  .detail{
    width: 92%;
    margin: 0 auto;
    margin-top:172px;
   
  }
  .detail .s1{
    width:100%;
    display: flex;
    justify-content: center;
  }
  .detail .s2{
    width: 100%;
    display: flex;
    justify-content: space-between;
    margin: 0 auto;
    padding-top: 10px;
  }
  .detail .s2 img{
    width: 18%;
    height: 100%;
  }
  .detail .s1 .bigimg{
    width:100%;
    height:100%;
  }
  .detail .box{
    display: flex;
    justify-content: center;
    width: 100%;
  }
  .detail .title{
    width: 100%;
    display: flex;
    justify-content: center;
    text-align: center;
  }
  .detail .title>span{
    font-size:19px;
    margin-top:12px;
    font-weight: bold;
    color:#333;
  }
  .detail .price{
    width:100%;
    display: flex;
    justify-content: center;
  }
  .detail .price>span{
    font-size:20px;
    color:#666;
    margin-top:10px;
  }
  .detail .num1{
    width:100%;
    display: flex;
    justify-content: flex-end;
    margin-top:20px;
    color: #333;
  }
  /* 相关商品设计 */
  .detail .images{
    width:150px;
    height:150px;
    margin-top:20px;
  }
  .detail .font1{
    width: 150px;
    height: 60px;
    text-align: center;
    margin-top:10px;
  }
  .detail .font2{
    width:150px;
    text-align: center;
    margin-top:10px;
  }
  .detail .dels{
    width: 150px;
    display: flex;
    justify-content: center;
    margin-top:10px;
  }
  .detail .rel{
    width: 344px;
    display: flex;
    flex-wrap: wrap;
  }
  .detail .rel1{
    padding:5px;
    width:160px;
  }
  .detail .shadow{
    width: 104%;
    display: flex;
    justify-content: center;
  }
  
  
  
  
</style>