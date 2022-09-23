import { menus } from '@/router/menus.config'

// 前端路由表
const constantRouterComponents = {
  // 基础页面 layout 必须引入
  BasicLayout: () => import('@/layouts/BasicLayout.vue'),
  Iframe: () => import('@/layouts/Iframe.vue'),
  RouteView: () => import('@/layouts/RouteView.vue'),
  PageView: () => import('@/layouts/PageView.vue')
}

// 前端未找到页面路由（固定不用改）
export const notFoundRouter = {
  path: '/:catchAll(.*)', // 不识别的path自动匹配404
  redirect: '/404'
}

/**
 * 动态路由
 */
export const generatorDynamicRouter = () => {
  return new Promise(resolve => {
    const routers = generator(menus)
    routers.push(notFoundRouter)
    resolve(routers)
  })
}

/**
 * 动态路由
 */
// export const generatorDynamicRouter = () => {
//   return new Promise((resolve, reject) => {
//     List({})
//       .then(res => {
//         const menus = res.data.data;
//         console.log(menus);
//         const routers = generator(menus);
//         routers.push(notFoundRouter);
//         resolve(routers);
//       })
//       .catch(error => {
//         reject(error);
//       });
//   });
// };

/**
 * 格式化树形结构数据 生成 vue-router 层级路由表
 *
 * @param menus
 * @returns {*}
 */
export const generator = (menus) => {
  const modules = import.meta.glob('../views/**/*.vue')
  return menus.map((menu) => {
    const { path, name, component, title, icon, hideInMenu, url, target } = menu
    const currentRouter = {
      // 如果路由设置了 path，则作为默认 path，
      path: encodeURI(path),
      // 路由名称，建议唯一
      name,
      // 该路由对应页面的组件(动态加载)
      /* @vite-ignore */
      component: constantRouterComponents[`${component}`] || modules[`../views/${component}.vue`],
      // component: constantRouterComponents[`${component}`] || import.meta.glob(`../views/${component}`),
      // meta: 页面标题, 菜单图标,是否展示， 页面权限(供指令权限用，可去掉)
      meta: {
        title,
        icon,
        hideInMenu: hideInMenu || false,
        url,
        target
      },
      children: []
    }
    // 是否有子菜单，并递归处理
    if (menu.children && menu.children.length > 0) {
      // Recursion
      currentRouter.children = generator(menu.children)
    }
    return currentRouter
  })
}
