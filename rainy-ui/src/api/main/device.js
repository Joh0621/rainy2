import request, { method } from '@/utils/request'

const api = {
  List: '/devices',
  Detail: '/device',
  Export: '/devices/export',
  Add: '/device',
  Del: '/devices',
  Update: '/device/update'
}

export function List (parameter) {
  return request({
    url: api.List,
    method: method.GET,
    params: parameter
  })
}

export function DetailById (id) {
  return request({
    url: `${api.Detail}/${id}`,
    method: method.GET
  })
}

export function Add (parameter) {
  return request({
    url: api.Add,
    method: method.POST,
    data: parameter
  })
}

export function Del (parameter) {
  return request({
    url: api.Del,
    method: method.POST,
    data: parameter
  })
}

export function Edit (parameter) {
  return request({
    url: api.Update,
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
