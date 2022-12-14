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
        path: '/device/:id',
        name: '设备详情',
        component: () => import('@/views/main/DataDirectoryDetail.vue'),
        meta: {
          title: '设备详情'
        }
      },
      {
        path: '/account/center',
        name: '个人设置',
        component: () => import('@/views/system/account/Center.vue'),
        meta: {
          title: '个人设置'
        }
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
