import Vue from 'vue'
import VueRouter from 'vue-router'
import Footer from '../components/footer.vue'
import Index from '../views/index.vue'
import AboutUs from '../views/aboutUs.vue'
import Album from '../views/album.vue'
import JoinUs from '../views/joinUs.vue'
import Store from '../views/store.vue'
import Product from '../views/product.vue'
import Appointment from '../views/appointment.vue'
import Cart from '../views/cart.vue'
import Details from '../components/details.vue'
import Login from '../views/login.vue'
import Register from '../views/register.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'index',
    component: Index
  },
  {path:'/Footer',component:Footer},
  {path:'/Index',component:Index},
  {path:'/AboutUs',component:AboutUs},
  {path:'/Album',component:Album},
  {path:'/JoinUs',component:JoinUs},
  {path:'/Store',component:Store},
  {path:'/Product',component:Product},
  {path:'/Appointment',component:Appointment},
  {path:'/Cart',component:Cart},
  {path:'/details/:pid',component:Details},
  {path:'/Login',component:Login},
  {path:'/Register',component:Register},
]

const router = new VueRouter({
  routes
})

export default router
