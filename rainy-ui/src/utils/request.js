import axios from 'axios'
import { useUserStore } from '@/store/user'
import { notification, Modal } from 'ant-design-vue'
import { TOKEN_NAME } from '@/utils/constants'
import { api } from '@/api/login'

export const method = {
  GET: 'get',
  POST: 'post',
  DELETE: 'delete',
  PUT: 'put'
}

/**
 * 创建axios实例
 */
const baseURL = import.meta.env.VITE_API_BASE_URL
const instance = axios.create({
  baseURL,
  timeout: 60000
})

/**
 * 请求拦截
 */
instance.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem(TOKEN_NAME)
    if (token) {
      config.headers[TOKEN_NAME] = token
    }
    return config
  },
  error => {
    return Promise.reject(error)
  }
)

// 响应拦截
instance.interceptors.response.use(
  (response) => {
    // 配置了blob，不处理直接返回文件流
    if (response.config.responseType === 'blob') {
      if (response.data.type === 'application/json') {
        notification.error({
          message: '权限不足',
          description: '您没有导出的权限'
        })
        return
      } else {
        return response
      }
    }
    const data = response.data
    if (data.code === 400) {
      notification.error({
        message: '操作失败',
        description: data.message
      })
    }
    if (data.code === 401) {
      if (response.config.url !== api.Login) {
        Modal.error({
          title: '提示',
          okText: '重新登录',
          content: '登录已失效， 请重新登录',
          onOk: () => {
            const userStore = useUserStore()
            userStore.Logout({}).then(res => {
              location.reload()
            })
          }
        })
      }
    }
    if (data.code === 403) {
      notification.error({
        message: '权限不足',
        description: data.message
      })
    }
    if (data.code === 405) {
      notification.error({
        message: '请求方法不支持',
        description: data.message
      })
    }
    if (data.code === 500) {
      notification.error({
        message: '系统错误',
        description: data.message
      })
    }
    return data
  },
  error => {
    notification.error({
      message: '系统错误',
      description: error.message
    })
    return Promise.reject(error)
  }
)

export default instance
