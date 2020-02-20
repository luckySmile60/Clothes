<template>
  <div class="foot">
    <div class="return"><img v-if="btnFlag" @click="backTop" src="imgs/return.png" alt=""></div>
    <div class="f1"><span>版权所有 (C) 2019 les 100 mint 薄荷.粤ICP备10066666号</span></div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      btnFlag:""
    }
  },
  // window对象，所有浏览器都支持window对象。它表示浏览器窗口，监听滚动事件
  mounted(){
    window.addEventListener('scroll',this.scrollTop)
  },
  destroyed(){
    window.removeEventListener('scroll',this.scrollTop)
  },
  methods:{
    // 点击图片回到顶部方法，加计时器是为了过渡顺滑
    backTop(){
      let timer = setInterval(()=>{
        let ispeed = Math.floor(-this.scrollTop / 5);
        document.documentElement.scrollTop = document.body.scrollTop = this.scrollTop + ispeed
        if(this.scrollTop === 0){
          clearInterval(timer)
        }
      },16)
    },
    // 为了计算距离顶部的高度，当高度大于60显示回顶部图标，小于60则隐藏
    scrollTop () {
      let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
      this.scrollTop = scrollTop;
      if(this.scrollTop > 60){
        this.btnFlag = true;
      }else{
        this.btnFlag = false;
      }
    }
  }
}
</script>
<style>
.foot{
  display: flex;
  flex-direction: column;
  padding: 10px 0px;
  margin-top:30px;
}
.foot .return{
  display: flex;
  justify-content: flex-end;
}
.foot .return>img{
  margin-right:10px;
  margin-bottom:25px;
}
.foot .f1{
  display: flex;
  justify-content: center;
}
.foot .f1>span{
  font-size:12px;
  color: #bcbcbc;
  font-family: "微软雅黑";
}


</style>