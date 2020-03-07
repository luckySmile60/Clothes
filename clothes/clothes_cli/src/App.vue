<template>
  <div id="app">
    <all-head></all-head>
    <keep-alive>
      <router-view v-if="$route.meta.keepAlive"/>
    </keep-alive>
    <router-view v-if="!$route.meta.keepAlive"></router-view>
    <all-footer></all-footer>
  </div>
</template>
<script>
import AllHead from './components/allhead'
import AllFooter from './components/footer'
export default {
  components:{
    AllHead,
    AllFooter
  },
  
}
</script>

<style scoped>
 

</style>
