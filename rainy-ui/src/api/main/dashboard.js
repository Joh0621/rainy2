import request, { method } from '@/utils/request'

const api = {
  Count: '/dashboard/count',
  PointCount: '/dashboard/station/point/count',
  DeviceCount: '/dashboard/station/device/count'
}

export function Count () {
  return request({
    url: api.Count,
    method: method.GET
  })
}

export function PointCount (parameter) {
  return request({
    url: api.PointCount,
    method: method.GET,
    params: parameter
  })
}

export function DeviceCount (parameter) {
  return request({
    url: api.DeviceCount,
    method: method.GET,
    params: parameter
  })
}

