<template>
  <div class="store">
    <img src="imgs/store1.png" alt="">
    <span class="title">店铺地址：</span>
    <div class="sub_title">中国地区：</div>
    <p>北京市西城区西单北大街110号老佛爷百货4层 L4.54</p>
    <p>北京市海淀区远大路1号世纪金源购物中心贵友大厦2层乐颂专柜</p>
    <p>北京市通州区梨园贵友大厦三层乐颂专柜</p>
    <p>山西省太原市小店区长风街113号天美新天地购物中心四层</p>
    <p>上海自由贸易试验区浦东南路陆家嘴中心商场老佛爷百货L3-P30B</p>
    <div class="sub_title">海外地区：</div>
    <p>London, Paris, Zurich, Montana , Lausanne, Seoul</p>
  </div>
</template>
<script>
export default {
  
}
</script>
<style>
.store{
  margin-top:170px;
  padding:0 10px;
}
.store img{
  width:100%;
}
.store p{
  font-size:12px;
  font-family: "宋体";
  color:#888;
  letter-spacing: 1px;
   text-indent: 2em;
}
.store .title{
  font-size: 12px;
  font-family: "宋体";
  margin-top:6px;
  color:#333;
}
.store .sub_title{
  font-size:12px;
  font-family: "宋体";
  color:#333;
  margin-top:15px;
  text-indent: 2em;

}

</style>