import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  // 共享数据
  state: {
    cartCount:0//购物车数量
  },
  // 修改函数
  mutations: {
    // 增加减少清空购物车数量
    addCartCount(state){//增加
      state.cartCount++;
    },
    modifyCartCount(state,num){//修改
      state.cartCount+=num;
    },
    subCartCount(state){//减少
      state.cartCount--;
    },
    clearCartCount(state){//清空
      state.cartCount=0;
    }
  },
  actions: {
  },
  modules: {

  },
  // 获取函数
  getters:{
    getCartCount(state){
      return state.cartCount;
    },
  }
})
