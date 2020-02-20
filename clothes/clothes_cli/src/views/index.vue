<template>
  <div class="index">
    <img src="imgs/index1.png" alt="">
    <div class="pic">
      <img src="imgs/index6.jpg" alt="">
      <img src="imgs/index2.png" alt="">
    </div>
    <img src="imgs/index4.png" alt="">
    <img src="imgs/index9.png" alt="">
    <img src="imgs/index8.png" alt="">
    <img src="imgs/index7.png" alt="">
    <img src="imgs/index3.png" alt="">
  </div>
</template>
<script>

export default {
  
}
</script>
<style scoped>
.index{
  margin-top:160px;
  padding: 0 10px;
}
.index .pic{
  display: flex;
  justify-content: center;
 
}
.index .pic>img{
  width:50%;
}
.index img{
  width:100%;
  height:100%;
  margin-top:20px;
}


</style>