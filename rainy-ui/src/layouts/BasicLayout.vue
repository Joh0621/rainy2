<template>
  <pro-layout
    v-model:collapsed="state.collapsed"
    v-model:selectedKeys="state.selectedKeys"
    v-model:openKeys="state.openKeys"
    :loading="loading"
    :menu-data="store.getMenus"
    :breadcrumb="{ routes: breadcrumb }"
    :iconfont-url="defaultConfig.iconfontUrl"
    v-bind="proConfig"
  >
    <template #menuHeaderRender>
      <router-link :to="{ path: '/' }">
        <img :src="sys.logo" :alt="sys.title" />
        <h1>{{ sys.title }}</h1>
      </router-link>
    </template>
    <template #headerContentRender>
      <menu-unfold-outlined v-if="state.collapsed" style="font-size: 18px; padding: 4px" @click="changeCollapsed" />
      <menu-fold-outlined v-else style="font-size: 18px; padding: 4px" @click="changeCollapsed" />
      <a-tooltip title="刷新">
        <redo-outlined style="font-size: 18px; padding: 4px" @click="reload" />
      </a-tooltip>
    </template>
    <template #rightContentRender>
      <RightContent :nick-name="nickName" :avatar="avatar" />
    </template>
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
    <router-view v-if="!loading" #="{ Component, route }">
      <component :is="Component" :key="route.path" />
    </router-view>
  </pro-layout>
</template>
<script setup>
import { useRouter, RouterView, RouterLink } from 'vue-router'
import { storeToRefs } from 'pinia'
import { useAppStore } from '@/store/app'
import { useUserStore } from '@/store/user'
import { MenuFoldOutlined, MenuUnfoldOutlined, RedoOutlined } from '@ant-design/icons-vue'
import { defaultConfig } from '@/config/defaultConfig'

const router = useRouter()
const store = useUserStore()
const appStore = useAppStore()

const sys = ref({
  title: appStore.config.sysTitle || defaultConfig.title,
  logo: appStore.config.sysLogo || defaultConfig.logo
})
const state = reactive({
  collapsed: defaultConfig.collapsed, // default collapsed
  openKeys: [], // defualt openKeys
  selectedKeys: [] // default selectedKeys
})

const loading = ref(false)
const proConfig = ref({
  layout: defaultConfig.layout,
  navTheme: defaultConfig.navTheme,
  fixedHeader: defaultConfig.fixedHeader,
  fixSiderbar: defaultConfig.fixSiderbar,
  splitMenus: defaultConfig.splitMenus,
  headerHeight: defaultConfig.headerHeight
})

const { nickName, avatar } = storeToRefs(store)

const breadcrumb = computed(() =>
  router.currentRoute.value.matched.concat().map(item => {
    return {
      path: item.path,
      breadcrumbName: item.meta.title || ''
    }
  })
)

const changeCollapsed = () => {
  state.collapsed = !state.collapsed
}

provide('reload', () => {
  reload()
})

const reload = () => {
  loading.value = true
  nextTick(() => {
    setTimeout(() => {
      loading.value = false
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
</style>
