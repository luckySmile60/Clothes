<template>
  <div class="product">
    <div>
    <div class="search">
      <div>
      <div class="label">商品分类</div>
      <van-dropdown-menu>
        <van-dropdown-item v-model="value1" :options="option1" />
      </van-dropdown-menu>
      </div>
   </div>
    <div class="product_app">
      <!--添加一个商品 start -->
       <div class="goods-item" v-for="(item,i) of list" :key="i">
          <!-- 商品图片 -->
          <img class="pic" :src="'imgs/'+item.img" alt="">
          <!-- 商品名称 -->
          <p class="p1">{{item.title}}</p>
          <!-- 商品价格 -->
          <div class="pr">
          <p class="p2">￥&nbsp;{{item.price.toFixed(2)}}</p>
          </div>
          <!-- 查看商品详情按钮 -->
          <div class="btn6"><button class="btn"><router-link :to="`/details/${item.pid}`">商品详情</router-link></button></div>
      </div>     
    </div>
    <!-- 分页 -->
    <div class="page-bar">
      <ul>
        <li v-if="cur>1"><a v-on:click="cur--,pageClick()">上一页</a></li>
        <li v-if="cur == 1"><a class="banclick">上一页</a></li>
        <!-- 当前页背景色为蓝色 -->
        <li v-for="(item,index) in indexs" :key="index"  v-bind:class="{'active': cur == index+1}"><a class="bar" v-on:click="btnClick(index+1)">{{index+1}}</a></li>
        <li v-if="cur<indexs"><a v-on:click="cur++,pageClick()">下一页</a></li>
        <li v-if="cur == indexs"><a class="banclick">下一页</a></li>
      </ul>
    </div>
  </div>
</div>
</template>
<script>
import Vue from 'vue';
import { DropdownMenu, DropdownItem,Pagination} from 'vant';

Vue.use(DropdownMenu).use(DropdownItem).use(Pagination);
export default {
  // 组件创建成功后立即调用此函数
  created(){
    // 调用加载商品列表函数
    this.loadMore();
  },
  data(){
    return{
      list:[],//查询结果
      //保存从服务器请求过来一共几页
      indexs:"", 
      // 记录当前页
      cur:1,
      // selected:"卫衣"
      value1:'FW19秋冬系列',
      option1:[
        {text:'选择一个系列',value:'FW19秋冬系列'},
        {text:'卫衣',value:'卫衣'},
        {text:'羊绒',value:'羊绒'},
        {text:'毛衫',value:'毛衫'},
        {text:'风衣',value:'风衣'},
        {text:'FW19秋冬系列',value:'FW19秋冬系列'}
      ]  
    }
  },
  methods:{
    
    btnClick(data){
      if(data != this.cur){
        this.cur=data;
        this.loadMore();
      }
    },
    pageClick(){
      console.log("现在在"+this.cur+"页");
      this.loadMore();
    },
    loadMore(){
      // 获取服务器商品列表
      // 创建变量url保存请求路径
      let url="product"
      // 自增页码
      this.pno++;
      //创建参数对象
      let obj={pno:this.cur,label:this.value1};
      //发送ajax请求
      this.axios.get(url,{params:obj})
      .then(res=>{
        // 保存服务器返回数据
        console.log(res);
        // 获取服务器返回结果并且保存在list中
        this.list=res.data.data;
        //获取总的页数
        this.indexs=res.data.pageCount;
        console.log("总页数："+this.indexs); 
      })
      .catch(err=>{
        console.log(err);
      })
    }
  },
  // 监听当所选项发生改变
  watch:{
    value1(){
      this.cur=1;
      this.loadMore();
    }
   
  }
  
}
</script>
<style>
.product{
  margin-top:170px;
  padding:0 10px;
  display: flex;
  justify-content:center;
}
.product .product_app{
  display:flex;
  flex-wrap: wrap;
  justify-content: center;
  width:320px;
}
.product .goods-item{
  padding: 10px;
}
.product .pic{
  width:135px;
  height:135px;
}
.product .p1{
  color:#666;
  font-family: "幼圆";
  font-size:14px;
  width: 135px;
  height:45px;
  text-align: center;
  line-height: 20px;
}
.product .page{
  margin-top:20px;
}
.product .p2{
  border: 0;
  background-color:#fff;
  height: 20px;
  font-size:10px;
  margin-top:0;
}
.product .search{
 display: flex;
 justify-content: center;
}
.product .page-bar>ul{
  display: flex;
  justify-content:center;
  margin-top:20px;
}
.product .page-bar>ul>li{
  display:inline-flex;
  width: 30px;
  border:1px solid #ddd;
}
.product .bar{
  width: 30px;
  text-align: center;
}
.product .page-bar>ul>li:nth-child(1){
  width: 50px;
  
}
.product .page-bar>ul>li:last-child{
  width: 50px;
}
.product .page-bar .active a{
  color:#fff;
  background-color: #fdd;
}
.product .label{
  color:#333;
  font-size:16px;
  font-family: "华文正楷";
  margin-left: 1.5rem;
}
.product .btn>a{
  color:#333;
}
.product .btn6,.pr{
  display: flex;
  justify-content: center;
}
</style>