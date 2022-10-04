import router from '@/router'
import { useUserStore } from '@/store/user'
import { useAppStore } from '@/store/app'
import { TOKEN_NAME, ROOT_ROUTER_NAME } from '@/utils/constants'

import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
NProgress.configure({ showSpinner: false }) // NProgress Configuration

const loginRoutePath = '/login'
const allowList = [loginRoutePath, '/password/forget'] // no redirect allowList
const defaultRoutePath = '/workbench'

router.beforeEach((to, from, next) => {
  NProgress.start() // start progress bar
  const appStore = useAppStore()
  // 加载基础配置
  if (!appStore.dictTree) {
    appStore.Common().then(() => {
      next({ path: to.path, query: to.query, replace: true })
    }).catch(() => {
      next()
    })
  } else {
    /* has token */
    const token = localStorage.getItem(TOKEN_NAME)
    if (token) {
      if (to.path === loginRoutePath) {
        next({ path: defaultRoutePath })
        NProgress.done()
      } else {
        const store = useUserStore()
        if (store.addRouters.length === 0) {
          store.GetUserinfo().then(res => {
            store.GenerateRoutes(res.data.menus).then(() => {
              // 动态添加路由
              store.addRouters.forEach((route) => {
                router.addRoute(ROOT_ROUTER_NAME, route)
              })
              // 请求带有 redirect 重定向时，自动重定向到该地址
              const redirect = decodeURIComponent(from.query.redirect || to.path)
              if (redirect) {
                next({ path: redirect })
              } else {
                next({ path: to.path, replace: true })
              }
            })
          })
        } else {
          next()
        }
      }
    } else {
      if (allowList.includes(to.path)) {
        next()
      } else {
        next({ path: loginRoutePath, query: { redirect: to.fullPath } })
        NProgress.done()
      }
    }
  }
})

router.afterEach(() => {
  NProgress.done() // finish progress bar
})
