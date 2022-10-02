import { defineStore } from 'pinia'
import { generatorDynamicRouter } from '@/router/generator-routers'
import { Login, Userinfo, Logout } from '@/api/login'
import { TOKEN_NAME } from '@/utils/constants'

// You can name the return value of `defineStore()` anything you want, but it's best to use the name of the store and surround it with `use` and `Store` (e.g. `useUserStore`, `useCartStore`, `useProductStore`)
// the first argument is a unique id of the store across your application
export const useUserStore = defineStore('user', {
  state: () => {
    return {
      avatar: '/vite.svg',
      nickName: 'admin',
      userinfo: {},
      addRouters: []
    }
  },
  getters: {
    getMenus: (state) =>
      // todo 过滤子菜单
      state.addRouters.filter((route) => !route.meta?.hideInMenu)
  },
  actions: {
    Login (parameter) {
      return new Promise((resolve, reject) => {
        Login(parameter).then((res) => {
          if (res.success) {
            localStorage.setItem(TOKEN_NAME, res.data.tokenValue)
            resolve(res)
          } else {
            reject(res)
          }
        }).catch(err => {
          reject(err)
        })
      })
    },
    GetUserinfo () {
      return new Promise((resolve, reject) => {
        Userinfo().then((res) => {
          if (res.success) {
            this.nickName = res.data.userinfo.nickName
            this.avatar = res.data.userinfo.avatar
            this.userinfo = res.data.userinfo
            // this.addRouters = res.data.menus
            resolve(res)
          } else {
            reject(res)
          }
        }).catch(err => {
          reject(err)
        })
      })
    },
    Logout (parameter) {
      return new Promise((resolve, reject) => {
        Logout().then(res => {
          localStorage.clear()
          resolve(res)
        }).catch(err => {
          reject(err)
        })
      })
    },
    GenerateRoutes (menus) {
      return new Promise((resolve, reject) => {
        generatorDynamicRouter(menus).then((routers) => {
          this.addRouters = routers
          resolve(routers)
        }).catch(err => {
          reject(err)
        })
      })
    }
  }
})
