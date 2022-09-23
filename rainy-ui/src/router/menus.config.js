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
    path: '/data/directory',
    name: 'tree',
    component: 'main/dataDirectory/DataDirectory',
    title: '数据目录管理',
    icon: 'icon-Report'
  },
  {
    path: '/data/detail',
    name: 'detail',
    component: 'main/dataDirectory/DataDirectoryDetail',
    title: '数据详情',
    icon: 'icon-unorderedlist',
    hideInMenu: true
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
    component: 'system/workflow/Apply',
    title: '我的申请',
    icon: 'icon-unorderedlist',
    url: 'http://172.16.22.207:18585/interface-ui/'
  },
  {
    path: '/todo',
    name: 'todo',
    component: 'system/workflow/Todo',
    title: '我的待办',
    icon: 'icon-unorderedlist',
    url: 'http://172.16.22.207:18585/interface-ui/'
  }
]
