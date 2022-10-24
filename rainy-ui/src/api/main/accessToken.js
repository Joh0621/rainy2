import request, { method } from '@/utils/request'

const api = {
  GET: '/accessToken',
  Update: '/accessToken/update'
}

export function Get (parameter) {
  return request({
    url: api.GET,
    method: method.GET,
    params: parameter
  })
}

export function Edit (parameter) {
  return request({
    url: api.Update,
    method: method.POST,
    data: parameter
  })
}

