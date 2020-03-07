import Vue from "vue";
import VueRouter from "vue-router";
// import Footer from "../components/footer.vue";
import Index from "../views/index.vue";
// import AboutUs from "../views/aboutUs.vue";
// import Album from "../views/album.vue";
// import JoinUs from "../views/joinUs.vue";
// import Store from "../views/store.vue";
// import Product from "../views/product.vue";
// import Appointment from "../views/appointment.vue";
// import Cart from "../views/cart.vue";
// import Details from "../components/details.vue";
// import Login from "../views/login.vue";
// import Register from "../views/register.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "index",
    component: Index,
    meta: {
      keepAlive: true
    }
  },

  { path: "/Index", component: Index, meta: { keepAlive: true } },
  {
    path: "/AboutUs",
    component: () =>
      import(/*webpackChunkName:"AboutUs"*/ "../views/aboutUs.vue"),
    meta: { keepAlive: true }
  },
  {
    path: "/Album",
    component: () => import(/*webpackChunkName:"Album"*/ "../views/album.vue"),
    meta: { keepAlive: true }
  },
  {
    path: "/JoinUs",
    component: () =>
      import(/*webpackChunkName:"JoinUs"*/ "../views/joinUs.vue"),
    meta: { keepAlive: true }
  },
  {
    path: "/Store",
    component: () => import(/*webpackChunkName:"Store"*/ "../views/store.vue"),
    meta: { keepAlive: true }
  },
  {
    path: "/Product",
    name:"product",
    component: () =>
      import(/*webpackChunkName:"Product"*/ "../views/product.vue"),
    meta: { keepAlive: false }
  },
  {
    path: "/Appointment",
    component: () =>
      import(/*webpackChunkName:"Appointment"*/ "../views/appointment.vue"),
    meta: { keepAlive: true }
  },
  {
    path: "/Cart",
    component: () => import(/*webpackChunkName:"Cart"*/ "../views/cart.vue"),
    meta: { keepAlive: true }
  },
  {
    path: "/details/:pid",
    name:"details",
    component: () =>
      import(/*webpackChunkName:"Details"*/ "../components/details.vue"),
      props:true
  },
  {
    path: "/Login",
    component: () => import(/*webpackChunkName:"Login"*/ "../views/login.vue"),
    meta: { keepAlive: false }
  },
  {
    path: "/Register",
    component: () =>
      import(/*webpackChunkName:"Register"*/ "../views/register.vue"),
    meta: { keepAlive: false }
  }
];

const router = new VueRouter({
  routes
});

export default router;
