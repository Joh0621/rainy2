import request, { method } from '@/utils/request'

const api = {
  ListProcessDefinitions: '/workflow/processDefs',
  ProcessBpmn20xml: '/workflow/process/bpmn20xml',
  ListTasks: '/workflow/tasks',
  ListHistoryTasks: '/workflow/historyTasks',
  ListActivities: '/workflow/activities',
  CompleteTask: '/workflow/task/complete'
}

export function ListProcessDefinitions (parameter) {
  return request({
    url: api.ListProcessDefinitions,
    method: method.GET,
    params: parameter
  })
}

export function ProcessBpmn20xml (parameter) {
  return request({
    url: api.ProcessBpmn20xml,
    method: method.GET,
    params: parameter
  })
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


export function ListActivities (parameter) {
  return request({
    url: api.ListActivities,
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
