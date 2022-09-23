import request, { method } from '@/utils/request'

const api = {
  List: 'http://172.16.22.207:18585/api/configs'
}

export function List (parameter) {
  return request({
    url: api.List,
    method: method.GET,
    params: parameter
  })
}
