<template>
  <pro-layout
      v-model:collapsed="state.collapsed"
      v-model:selectedKeys="state.selectedKeys"
      v-model:openKeys="state.openKeys"
      :loading="appStore.reload"
      :menu-data="menus"
      :breadcrumb="{ routes: breadcrumb }"
      :iconfont-url="defaultConfig.iconfontUrl"
      v-bind="proConfig"
  >
    <template #menuHeaderRender>
      <router-link :to="{ path: '/' }">
        <img :src="sys.logo" :alt="sys.title" />
        <h1 v-if="!state.collapsed">{{ sys.title }}</h1>
      </router-link>
    </template>
    <template #headerContentRender>
      <PageContainer>
      </PageContainer>
    </template>
    <template #rightContentRender>
      <RightContent />
    </template>
    <template #footerRender>
      <GlobalFooter :links="[{ title: '首页', href: '#' }]" copyright="数据门户 &copy; 2022 信息所" />
    </template>
<!--    <template #menuExtraRender>-->
<!--      首页-->
<!--    </template>-->
    <!-- custom breadcrumb itemRender  -->
    <template #breadcrumbRender="{ route, params, routes }">
      <span v-if="routes.indexOf(route) === routes.length - 1">
        {{ route.breadcrumbName }}
      </span>
      <router-link v-else :to="{ path: route.path, params }">
        {{ route.breadcrumbName }}
      </router-link>
    </template>
    <setting-drawer v-model="proConfig" />
    <multi-tab v-if="proConfig.multiTab" style="margin: -16px -16px 16px -16px"/>
    <router-view v-if="!appStore.reload" #="{ Component, route }">
      <component :is="Component" :key="route.path" />
    </router-view>
  </pro-layout>
</template>
<script setup>
import { useRouter } from 'vue-router'
import { useAppStore } from '@/store/app'
import { useUserStore } from '@/store/user'
import { defaultConfig } from '@/config/defaultConfig'
import { GlobalFooter, clearMenuItem } from '@ant-design-vue/pro-layout'

const router = useRouter()
const store = useUserStore()
const appStore = useAppStore()

const menus = clearMenuItem(store.getMenus)

const sys = ref({
  title: appStore.config.sysTitle || defaultConfig.title,
  logo: appStore.config.sysLogo || defaultConfig.logo
})
const state = reactive({
  collapsed: defaultConfig.collapsed, // default collapsed
  openKeys: [], // defualt openKeys
  selectedKeys: [] // default selectedKeys
})

const layout = ref(localStorage.getItem('layout') || defaultConfig.layout)
const proConfig = ref({
  layout: layout.value,
  siderWidth: defaultConfig.siderWidth,
  collapsedWidth: defaultConfig.collapsedWidth,
  headerHeight: defaultConfig.headerHeight,
  contentWidth: defaultConfig.contentWidth,
  navTheme: defaultConfig.navTheme,
  headerTheme: defaultConfig.navTheme,
  fixedHeader: defaultConfig.fixedHeader,
  fixSiderbar: defaultConfig.fixSiderbar,
  splitMenus: !layout.value === 'mix',
  primaryColor: localStorage.getItem('primaryColor') || defaultConfig.primaryColor,
  multiTab: localStorage.getItem('multiTab') ? localStorage.getItem('multiTab') === 'true' : defaultConfig.multiTab
})

const breadcrumb = computed(() =>
  router.currentRoute.value.matched.concat().map(item => {
    return {
      path: item.path,
      breadcrumbName: item.meta.title || ''
    }
  })
)

// const changeCollapsed = () => {
//   state.collapsed = !state.collapsed
// }

provide('reload', () => {
  reload()
})

const reload = () => {
  appStore.reload = true
  nextTick(() => {
    setTimeout(() => {
      appStore.reload = false
    }, 100)
  })
}

watch(
  router.currentRoute,
  () => {
    const matched = router.currentRoute.value.matched.concat()
    state.selectedKeys = matched.filter(r => r.name !== 'index').map(r => r.path)
    state.openKeys = matched.filter(r => r.path !== router.currentRoute.value.path).map(r => r.path)
  },
  {
    immediate: true
  }
)
</script>
<style>
.ant-layout-content {
  margin: 16px;
}
.ant-pro-page-container-children-content {
  margin-top: 16px;
}
.ant-page-header.has-breadcrumb {
   padding-left: 0;
   padding-top: 16px;
}
</style>
