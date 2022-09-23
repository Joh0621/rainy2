import request, { method } from '@/utils/request'

const api = {
  common: '/common'
}

export function Common () {
  return request({
    url: api.common,
    method: method.GET
  })
}
