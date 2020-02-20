<template>
  <div class="about">
   <van-cell is-link @click="showPopup">展示弹出层</van-cell>

<van-popup v-model="show">内容</van-popup>
  </div>
</template>
<script>
import Vue from 'vue';
import { Popup } from 'vant';

Vue.use(Popup);
export default {
   data() {
    return {
      show: false
    }
  },

  methods: {
    showPopup() {
      this.show = true;
    }
  }
  
}
</script>
