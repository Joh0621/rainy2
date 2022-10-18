import request, { method } from '@/utils/request'

const api = {
  Apply: '/data/apply',
  List: '/applies'
}

export function Apply (parameter) {
  return request({
    url: api.Apply,
    method: method.POST,
    data: parameter
  })
}

export function List (parameter) {
  return request({
    url: api.List,
    method: method.POST,
    params: parameter
  })
}
