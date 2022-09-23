import { defineStore } from 'pinia'
import { generatorDynamicRouter } from '@/router/generator-routers'

// You can name the return value of `defineStore()` anything you want, but it's best to use the name of the store and surround it with `use` and `Store` (e.g. `useUserStore`, `useCartStore`, `useProductStore`)
// the first argument is a unique id of the store across your application
export const useUserStore = defineStore('user', {
  state: () => {
    return {
      avatar: '',
      nickName: '',
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
      return new Promise((resolve) => {
        // Login(parameter).then((res: any) => {
        //
        // })
      })
    },
    Logout (parameter) {
      return new Promise((resolve) => {
        // Login(parameter).then((res: any) => {
        //
        // })
      })
    },
    GenerateRoutes () {
      return new Promise((resolve) => {
        generatorDynamicRouter().then((routers) => {
          this.addRouters = routers
          resolve(routers)
        })
      })
    }
  }
})
