import request, { method } from '@/utils/request'

const api = {
  ListTasks: '/workflow/tasks',
  ListHistoryTasks: '/workflow/historyTasks',
  CompleteTask: '/workflow/task/complete'
}

export function ListTasks (parameter) {
  return request({
    url: api.ListTasks,
    method: method.GET,
    params: parameter
  })
}

export function ListHistoryTasks (parameter) {
  return request({
    url: api.ListHistoryTasks,
    method: method.GET,
    params: parameter
  })
}

export function CompleteTask (parameter) {
  return request({
    url: api.CompleteTask,
    method: method.POST,
    data: parameter
  })
}

export function Add (parameter) {
  return request({
    url: api.Add,
    method: method.POST,
    data: parameter
  })
}

export function Del (parameter) {
  return request({
    url: api.Del,
    method: method.POST,
    data: parameter
  })
}

export function Edit (parameter) {
  return request({
    url: api.Update,
    method: method.POST,
    data: parameter
  })
}

export function Export () {
  return request({
    url: api.Export,
    method: method.GET,
    responseType: 'blob'
  })
}
