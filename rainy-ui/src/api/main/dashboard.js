import request, { method } from '@/utils/request'

const api = {
  Count: '/dashboard/count'
}

export function Count () {
  return request({
    url: api.Count,
    method: method.GET
  })
}

