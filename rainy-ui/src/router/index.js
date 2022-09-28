import { createRouter, createWebHistory } from 'vue-router'
import BasicLayout from '@/layouts/BasicLayout.vue'
import BlankLayout from '@/layouts/BlankLayout.vue'
// import NestedLayout from '@/layouts/NestedLayout';

const routes = [
  {
    path: '/',
    name: 'index',
    meta: { title: '控制台' },
    component: BasicLayout,
    redirect: '/data/directory',
    children: [
      {
        path: '/data/:id/detail',
        name: BasicLayout,
        component: () => import('@/views/main/DataDirectoryDetail.vue')
      }
    ]
  },
  {
    path: '/404',
    name: 'Error',
    component: () => import('@/views/system/Error.vue')
  },
  {
    path: '/login',
    name: BlankLayout,
    component: () => import('@/views/Login.vue')
  }
]
export default createRouter({
  history: createWebHistory(),
  routes
})
