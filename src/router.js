import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'

export default createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: Home,
    },
    {
      path: '/history',
      component: () => import('@/views/History.vue'),
    },
    {
      path: '/watch-party',
      component: () => import('@/views/Watch-Party.vue'),
    },
  ],
})
