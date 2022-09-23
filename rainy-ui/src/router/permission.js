import router from '@/router'
import { useUserStore } from '@/store/user'
import { useAppStore } from '@/store/app'

import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
NProgress.configure({ showSpinner: false }) // NProgress Configuration

const loginRoutePath = '/login'
const allowList = [loginRoutePath] // no redirect allowList
const defaultRoutePath = '/workbench'

router.beforeEach((to, from, next) => {
  NProgress.start() // start progress bar
  const appStore = useAppStore()
  // 加载基础配置
  if (!appStore.dictTree) {
    appStore.Common().then(() => {
      next({ path: to.path, replace: true })
    })
  } else {
    /* has token */
    const token = localStorage.getItem('Access-Token')
    if (token) {
      if (to.path === loginRoutePath) {
        next({ path: defaultRoutePath })
        NProgress.done()
      } else {
        const store = useUserStore()
        if (store.addRouters.length === 0) {
          store.GenerateRoutes().then(() => {
            // 动态添加路由
            store.addRouters.forEach((route) => {
              router.addRoute('index', route)
            })
            next({ path: to.path, replace: true })
          })
        } else {
          next()
        }
      }
    } else {
      if (allowList.includes(to.path)) {
        next()
      } else {
        next({ path: loginRoutePath })
        NProgress.done()
      }
    }
  }
})

router.afterEach(() => {
  NProgress.done() // finish progress bar
})
