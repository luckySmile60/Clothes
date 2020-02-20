<template>
  <div class="cart">
    <div v-show="show" class="btn1">
      <div class="txt1"><span>当前购物车为空!</span></div>
      <button><router-link to="/Product">返回商城</router-link></button>
    </div>
    <div v-show="show1" class="cart_list">
      <!-- 顶部复选框：全选 -->
      <div class="selectAll">
        全选<input type="checkbox" v-model="allcb" @change="selectAll">
      </div>
      <!-- 中间购物车列表 -->
      <div class="cart-item" v-for="(item,i) of list" :key="i">
        <div class="lefttxt">
          <input class="p1" type="checkbox" v-model="item.cb" @change="changeItem">
          <img class="pic2" :src="'imgs/'+item.img" alt="">
          <div class="pname" style="color:#333">{{item.title}}</div>
          <div class="price" style="color:red">￥{{item.price.toFixed(2)}}</div>
          <div class="num2">x{{item.count}}</div>
        </div>
        <div @click="del(item.id)" :data-id="item.id"><span style="color:red;">X</span></div>
      </div>
      <!-- 合计：购物车商品数量 vuex -->
      <div class="s6">
        <div>商品数量：<span style="color:red">{{$store.getters.getCartCount}}</span></div> 
        <div>总计金额：<span style="color:red">￥{{totalprice.toFixed(2)}}</span></div>
      </div>
      <div class="b2">
      <!-- 按钮 删除选中商品 -->
      <button class="btn2" @click="delItem">删除选中商品</button>
      <!-- 按钮 清空购物车 -->
      <button class="btn2" @click="delAll">清空购物车</button>
      </div>
    </div>
  </div>
</template>
<script>
import Vue from 'vue';
import { Dialog,Toast } from 'vant';
Vue.use(Dialog).use(Toast);
export default {
  created(){
    // 当组件创建成功够查询购物车列表
    this.loadMore();
  },
  data(){
    return{
      show:true,
      show1:"",
      list:[],//保存购物车列表
      allcb:false,//全选按钮状态
      totalprice:0

    }
  },
  // computed:{
  //   loadMore();
  // },
  
  methods:{
    changeItem(){
      // 为商品复选框添加修改事件
      // 如果所有商品状态为true全选true
      // 创建变量sum累加和
      let sum=0;
      // 创建循环遍历数组中所有元素cb
      for(let item of this.list){
        if(item.cb){
          sum++;
        }
        // 如果状态true sum++
        if(sum==this.list.length){
          this.allcb=true;
        }else{
          this.allcb=false;
        }

      }

    },
    selectAll(){
      // 全选按钮状态修改
      // 获取当前全选按钮状态
      let cb=this.allcb;
      // 创建循环遍历每个元素
      for(let item of this.list){
        // 全选true为true
        // 全选false为false
        item.cb=cb;
      }

    },
    delAll(){
      // 清空购物车
      // 显示交互确认框
      Dialog.confirm({
        message: '是否清空购物车'
      }).then(() => {
        // on confirm
        // 创建变量str
        let str='';
        // 创建循环遍历每个元素
        for(let item of this.list){
          str+=item.id+",";
        }
        // 判断没商品 提示
        if(str.length==0){
          Toast('购物车为空');
          return;
        }
        // 截取最后一位逗号
        str=str.substring(0,str.length-1);
        // 创建变量url
        let url='delm';
        // 创建变量 obj
        let obj={ids:str};
        // 8:发送请求 delm
        this.axios.get(url,{params:obj})
      .then(res=>{//删除成功回调
          Toast("清空成功");
          // 9:删除成功回调 重新加载
          this.loadMore();
      })
      .catch(err=>{//删除出错回调
       console.log(err);
      })
      }).catch(() => {
        // on cancel
      });

    },
    delItem(){
      // 删除多个 用户指定商品
      // 显示交互框
        Dialog.confirm({
          message: '是否删除指定商品？'
        }).then(() => {
          // on confirm
          // 创建变量 str
          let str='';
          // 创建循环遍历商品数组，如果cb状态为true拼接id
          // 判断用户是否选中商品
          for(let item of this.list){
            if(item.cb){
              str+=item.id+",";
            }
          }
          // 如果用户没有选商品
          if(str.length==0){
            Toast('请选择需要删除商品');
            return;
          }
          // substring截取字符串
          // 0 起始下标
          // 保存几个字符 
          str=str.substring(0,str.length-1);
           // 8：创建url
            var url="delm";
            // 9:创建obj
            var obj={ids:str};
            // 10:发送ajax请求删除指定商品
            this.axios.get(url,{params:obj})
            .then(res=>{//删除成功回调
              alert("删除成功");
                this.loadMore();
            })
            .catch(err=>{//删除出错回调
                console.log(err);
            })  
        }).catch(() => {
          // on cancel
        });
    },
    del(event){
      // 删除用户指定购物车商品
      // 显示交互确认框
      Dialog.confirm({
        message: '是否删除该商品？'
      }).then(() => {
        // on confirm
        let str='';
        for(let item of this.list){
          if(item.cb){
            let id=event;
            console.log(id);
            str+=id;
          }
        }
        if(str.length==0){
          Toast("请勾选该商品");
          return;
        }
        // 创建变量url
        let url='del';
        // 创建变量obj
        let obj={id:str}
        // 发送ajax请求完成删除任务
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==-2){
            this.$router.push('/Login');
          }else if(res.data.code==-1){
            Toast('删除失败');
          }else{
            Toast('删除成功');
            this.loadMore();
          }
        })

      }).catch(() => {
        // on cancel
      });


    },
    loadMore(){
      // 加载购物车列表
      // 创建变量url
      let url="findcart";
      // 发送ajax请求
      this.axios.get(url).then(res=>{
        console.log(res.data.data);
        // 原始数据
        let rows=res.data.data;
        // 初始化金额为0
        this.totalprice=0;
        for(let item of rows){
          // 创建循环为每个商品添加cb属性
          item.cb = false;
          this.totalprice += item.price*item.count;
        }
        // 将新数组赋值
        this.list=rows;
        console.log(this.list)
        if(this.list.length!=0){
          this.show1=true;
          this.show=false;
        }else{
          this.show1=false;
          this.show=true;
        }
        //3.1：清空原先购物车数量
        this.$store.commit("clearCartCount");
        // 4:计算累加和 购物车数量
        var sum=0;
        for(var item of this.list){
            sum+=item.count;
        }
        // 5:修改购物车数量
        this.$store.commit("modifyCartCount",sum)
      })
      .catch(err=>{
        console.log(err);
      })
    }
  }
  
}
</script>
<style scoped>
.cart{
  margin-top:170px;
  padding:0 10px;
}
.cart .btn1{
  display: flex;
  flex-direction: column;
}
.cart .txt1{
  display: flex;
  justify-content: center;
}
.cart .txt1>span{
  color:#333;
}
.cart .btn1>button{
  background-color: #be99ff;
  border:1px solid #be99ff;
  border-radius: 5px;
  width:5rem;
  height:2em;
  margin:10px auto;
}
.cart a{
  color:#fff;
}
.cart .lefttxt{
  width: 90%;
  display: flex;
  justify-content: space-around;

}
.cart .cart-item{
  display: flex;
  justify-content: space-between;
  margin-top:1rem;
  background-color:rgba(172, 168, 168,0.2);
  padding:10px;
}
.cart .btn2{
  background-color: #be99ff;
  border-radius: 5px;
  border:1px solid #be99ff;
  height:2em;
  color:#fff;
}
.cart .pic2{
  width: 40px;
  height:40px;
  margin-right:6px;
  border-radius: 2px;
  box-shadow: 1px 1px 6px #666;
}
.cart .s6{
  margin-top:20px;
  display: flex;
  justify-content:space-between;
}
.cart .b2{
  margin-top:20px;
  display: flex;
  justify-content: space-between;
  padding:0;
}
.cart .price{
  margin-left:3px;
}
.cart .num2{
  margin-left:10px;
}
</style>