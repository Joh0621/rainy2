import request, { method } from '@/utils/request'

const api = {
  Count: '/dashboard/count',
  PointCount: '/dashboard/point/count',
  DeviceCount: '/dashboard/device/count',
  ApiStatistics: '/dashboard/api/statistics'
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

export function ApiStatistics () {
  return request({
    url: api.ApiStatistics,
    method: method.GET
  })
}

