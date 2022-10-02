import request, { method } from '@/utils/request'

const api = {
  List: '/loginLogs',
  Del: '/loginLogs',
  Export: '/loginLogs/export'
}

export function List (parameter) {
  return request({
    url: api.List,
    method: method.GET,
    params: parameter
  })
}

export function Del (parameter) {
  return request({
    url: api.Del,
    method: method.POST,
    data: parameter
  })
}

export function Export () {
  return request({
    url: api.Export,
    method: method.GET,
    responseType: 'blob'
  })
}
