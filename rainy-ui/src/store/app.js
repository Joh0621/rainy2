import { defineStore } from 'pinia'
import { Common } from '@/api/system/common.js'

// You can name the return value of `defineStore()` anything you want, but it's best to use the name of the store and surround it with `use` and `Store` (e.g. `useUserStore`, `useCartStore`, `useProductStore`)
// the first argument is a unique id of the store across your application
export const useAppStore = defineStore('app', {
  state: () => {
    return {
      config: {
        sysTitle: undefined,
        sysLogo: undefined
      },
      dictTree: undefined
    }
  },
  getters: {
    dictItems: (state) => {
      return (dictCode) => {
        const arr = []
        const dict = state.dictTree[dictCode]
        if (!dict) {
          return arr
        }
        const type = dict.dataType
        const items = dict.items
        for (const item in items) {
          const name = items[item]
          let value = item
          if (type === 'int') {
            value = Number(value)
          }
          if (type === 'boolean') {
            // value = Boolean(value) // false|true 都会转换成 true
            value = value === 'true'
          }
          const nameVal = { name, value }
          arr.push(nameVal)
        }
        return arr
      }
    },
    dictItemValue: (state) => {
      return (dictCode, dictItemCode) => {
        const dict = state.dictTree[dictCode]
        if (!dict) {
          return dictItemCode
        }
        const dictItem = dict.items[dictItemCode]
        if (!dictItem) {
          return dictItemCode
        }
        return dictItem
      }
    },
    dicts: (state) => {
      return () => {
        const dictTree = state.dictTree
        const dicts = []
        for (const dictCode in dictTree) {
          const name = dictTree[dictCode].name
          const nameVal = { name, dictCode }
          dicts.push(nameVal)
        }
        return dicts
      }
    },
    dictName: (state) => {
      return (dictCode) => {
        const dict = state.dictTree[dictCode]
        if (dict) {
          return dict ? dict.name : dictCode
        }
      }
    }
  },
  actions: {
    async Common () {
      return new Promise((resolve, reject) => {
        Common().then((res) => {
          if (res.success) {
            this.dictTree = res.data.dictTree
            this.config = {
              ...res.data.config
            }
            resolve(res)
          } else {
            reject(res)
          }
        }).catch(err => {
          reject(err)
        })
      })
    }
  }
})
