import axios from 'axios'
import { notification } from 'ant-design-vue'

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
    return Promise.reject(error)
  }
)

export default instance
