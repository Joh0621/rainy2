import { createRouter, createWebHistory } from 'vue-router'
import BasicLayout from '@/layouts/BasicLayout.vue'
import BlankLayout from '@/layouts/BlankLayout.vue'
// import NestedLayout from '@/layouts/NestedLayout';
import { ROOT_ROUTER_NAME } from '@/utils/constants'

const routes = [
  {
    path: '/',
    name: ROOT_ROUTER_NAME,
    meta: { title: '控制台' },
    component: BasicLayout,
    redirect: '/workbench',
    children: [
      {
        path: '/device/:deviceCode',
        name: BasicLayout,
        component: () => import('@/views/main/DataDirectoryDetail.vue')
      },
      {
        path: '/404',
        name: 'Error',
        component: () => import('@/views/system/Error.vue')
      }
    ]
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
