export const menus = [
  {
    path: '/workbench',
    name: 'workbench',
    // component: 'main/dataDirectory/Index',
    component: 'system/Workbench',
    title: '工作台',
    icon: 'icon-Report'
  },
  {
    path: '/系统管理',
    name: '系统管理',
    component: 'RouteView',
    title: '系统管理',
    icon: 'icon-Report',
    children: [
      {
        path: '/org',
        name: 'org',
        component: 'system/org/Org',
        title: '组织管理',
        icon: 'icon-Report'
      },
      {
        path: '/position',
        name: 'position',
        component: 'system/org/Position',
        title: '职位管理',
        icon: 'icon-Report'
      },
      {
        path: '/user',
        name: 'user',
        component: 'system/permission/User',
        title: '用户管理',
        icon: 'icon-unorderedlist'
      },
      {
        path: '/role',
        name: 'role',
        component: 'system/permission/Role',
        title: '角色管理',
        icon: 'icon-unorderedlist'
      },
      {
        path: '/config',
        name: 'config',
        component: 'system/config/Config',
        title: '配置管理',
        icon: 'icon-unorderedlist'
      },
      {
        path: '/dict',
        name: 'dict',
        component: 'system/dict/Dict',
        title: '字典管理',
        icon: 'icon-unorderedlist'
      }
    ]
  },
  {
    path: '/流程管理',
    name: '流程管理',
    component: 'RouteView',
    title: '流程管理',
    icon: 'icon-Report',
    children: [
      {
        path: '/process/definition',
        name: 'processDefinition',
        component: 'system/workflow/ProcessDefinition',
        title: '流程定义',
        icon: 'icon-Report'
      }
    ]
  },
  {
    path: '/data/directory/mgt',
    name: 'dataDirectoryMgt',
    component: 'main/dataDirectory/DataDirectory',
    title: '数据管理',
    icon: 'icon-Report'
  },
  {
    path: '/data/directory',
    name: 'dataDirector',
    component: 'main/DataDirectory',
    title: '数据目录',
    icon: 'icon-Report'
  },
  {
    path: '/data/service',
    name: 'dataService',
    component: 'Iframe',
    title: '数据服务',
    icon: 'icon-unorderedlist',
    url: '/api/interface-ui/',
    hideInMenu: true
  },
  {
    path: '/apply',
    name: 'apply',
    component: 'system/workflow/TaskApply',
    title: '我的申请',
    icon: 'icon-unorderedlist'
  },
  {
    path: '/我的任务',
    name: '我的任务',
    component: 'RouteView',
    title: '我的任务',
    icon: 'icon-Report',
    children: [
      {
        path: '/workflow/task/todo',
        name: 'taskTodo',
        component: 'system/workflow/TaskTodo',
        title: '我的待办',
        icon: 'icon-unorderedlist'
      },
      {
        path: '/workflow/task/done',
        name: 'taskDone',
        component: 'system/workflow/TaskDone',
        title: '我的已办',
        icon: 'icon-unorderedlist'
      }
    ]
  },
  {
    path: '/designer',
    name: 'designer',
    component: 'system/workflow/ProcessDesigner',
    title: '设计器',
    icon: 'icon-unorderedlist'
  }
]
