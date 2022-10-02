import request, { method } from '@/utils/request'

export const api = {
  Login: '/login',
  Userinfo: '/userinfo',
  Logout: '/logout'
}

export function Login (parameter) {
  return request({
    url: api.Login,
    method: method.POST,
    data: parameter
  })
}

export function Userinfo (parameter) {
  return request({
    url: api.Userinfo,
    method: method.GET,
    data: parameter
  })
}

export function Logout () {
  return request({
    url: api.Logout,
    method: method.POST
  })
}
