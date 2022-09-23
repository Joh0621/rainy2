import request, { method } from '@/utils/request'

const api = {
  List: '/dicts',
  Export: '/dicts/export',
  Add: '/dict',
  Del: '/dicts',
  Update: '/dict/update'
}

export function List (parameter) {
  return request({
    url: api.List,
    method: method.GET,
    params: parameter
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
