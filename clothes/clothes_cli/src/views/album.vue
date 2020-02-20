<template>
  <div class="album">
    <van-swipe :autoplay="3000" :show-indicators="false" :touchable="true">
     <van-swipe-item v-for="(image, index) in images" :key="index">
      <img class="img_pic" v-lazy="image" />
    </van-swipe-item>
</van-swipe>
  </div>
</template>
<script>
import Vue from 'vue';
import { Swipe, SwipeItem, Lazyload } from 'vant';

Vue.use(Swipe).use(SwipeItem).use(Lazyload);
export default {
  data(){
    return{
      images:[
        'imgs/album1.jpg',
        'imgs/album2.jpg',
        'imgs/album3.jpg',
        'imgs/album4.jpg',
        'imgs/album5.jpg',
        'imgs/album6.jpg',
        'imgs/album7.jpg',
        'imgs/album8.jpg',
        'imgs/album9.jpg'
      ],
      
    }
  }
  
}
</script>
<style>
.album{
  margin-top:170px;
  padding: 0 10px;
}
.album .img_pic{
  width:100%;
}

</style>