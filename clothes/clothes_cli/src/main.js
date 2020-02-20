import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

Vue.config.productionTip = false
// 引入第三方axios
import axios from "axios"
// 配置访问服务器基础路径
axios.defaults.baseURL="http://127.0.0.1:6060/home/"
// 保存session信息
// 每次ajax访问服务器将session id
// 发送服务器验证使用
axios.defaults.withCredentials=true;
// 将axios注册vue实例中
// 注意顺序：不能配置在vue对象后面
Vue.prototype.axios=axios;


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
