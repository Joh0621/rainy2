import request, { method } from '@/utils/request'

const api = {
  Apply: '/data/apply',
  BatchApply: '/data/apply/batch',
  PointDownload: '/data/point/download',
  CancelApply: '/data/apply/cancel',
  List: '/applies',
  Edit: '/apply/update'
}

export function Apply (parameter) {
  return request({
    url: api.Apply,
    method: method.POST,
    data: parameter
  })
}

export function BatchApply (parameter) {
  return request({
    url: api.BatchApply,
    method: method.POST,
    data: parameter
  })
}

export function CancelApply (parameter) {
  return request({
    url: api.CancelApply,
    method: method.POST,
    data: parameter
  })
}

export function Edit (parameter) {
  return request({
    url: api.Edit,
    method: method.POST,
    data: parameter
  })
}

export function PointDownload (parameter) {
  return request({
    url: api.PointDownload,
    method: method.GET,
    params: parameter,
    responseType: 'blob'
  })
}

export function List (parameter) {
  return request({
    url: api.List,
    method: method.GET,
    params: parameter
  })
}
