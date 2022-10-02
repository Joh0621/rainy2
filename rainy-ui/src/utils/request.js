import axios from 'axios'
import { useUserStore } from '@/store/user'
import { notification } from 'ant-design-vue'
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
// const baseURL = import.meta.env.VITE_API_BASE_URL;
// const baseURL = '/dm-platform/api'
const baseURL = '/api'
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
    if (response.headers['content-disposition']) {
      return response
    }
    const data = response.data
    if (data.code === 400) {
      notification.error({
        message: '参数检验失败',
        description: data.message
      })
    }
    if (data.code === 401) {
      notification.error({
        message: '认证失败',
        description: data.message
      })
      if (response.config.url !== api.Login) {
        const userStore = useUserStore()
        userStore.Logout({}).then(res => {
          location.reload()
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
    if (error.response.status === 404) {
      notification.error({
        message: '请求不存在',
        description: error.response.message
      })
    }
    return Promise.reject(error)
  }
)

export default instance
