import request, { method } from '@/utils/request'

const api = {
  Count: '/dashboard/count',
  StationPointCount: '/dashboard/station/point/count',
  DeviceCount: '/dashboard/station/device/count'
}

export function Count () {
  return request({
    url: api.Count,
    method: method.GET
  })
}

export function StationPointCount () {
  return request({
    url: api.StationPointCount,
    method: method.GET
  })
}

export function DeviceCount (parameter) {
  return request({
    url: api.DeviceCount,
    method: method.GET,
    params: parameter
  })
}

