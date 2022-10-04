import request, { method } from '@/utils/request'

const api = {
  List: '/users',
  Export: '/users/export',
  Add: '/user',
  Del: '/users',
  Update: '/user/update',
  ResetPassword: '/user/password/reset',
  ListRoleIds: '/user/roleIds',
  AssignRoles: '/user/roles/assign',
  ListOnline: '/users/online',
  KickOut: '/user/kickOut'
}

export function List (parameter) {
  return request({
    url: api.List,
    method: method.GET,
    params: parameter
  })
}

export function ListRoleIdsByUserId (parameter) {
  return request({
    url: api.ListRoleIds,
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

export function ResetPassword (parameter) {
  return request({
    url: api.ResetPassword,
    method: method.POST,
    data: parameter
  })
}

export function AssignRoles (parameter) {
  return request({
    url: api.AssignRoles,
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

export function ListOnline (parameter) {
  return request({
    url: api.ListOnline,
    method: method.GET,
    params: parameter
  })
}

export function KickOut (parameter) {
  return request({
    url: api.KickOut,
    method: method.POST,
    data: parameter
  })
}
