import request, { method } from '@/utils/request'

const api = {
  Tree: '/menus/tree',
  List: '/menus',
  Export: '/menus/export',
  Add: '/menu',
  Del: '/menus',
  Update: '/menu/update',
  MenuAssign: '/role/menus/assign',
  RoleMenuIds: '/role/menuIds'
}

export function Tree (parameter) {
  return request({
    url: api.Tree,
    method: method.GET,
    params: parameter
  })
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

export function MenuAssign (parameter) {
  return request({
    url: api.MenuAssign,
    method: method.POST,
    data: parameter
  })
}

export function RoleMenuIds (parameter) {
  return request({
    url: api.RoleMenuIds,
    method: method.GET,
    params: parameter
  })
}

export function Export () {
  return request({
    url: api.Export,
    method: method.GET,
    responseType: 'blob'
  })
}
