<template>
  <ConfigProvider :locale="locale === 'en' ? enUS : zhCN" :component-size="componentSize">
    <router-view />
  </ConfigProvider>
</template>

<script setup>
import { ConfigProvider } from 'ant-design-vue'
import { useUserTheme } from './hooks/useTheme'
import enUS from 'ant-design-vue/es/locale/en_US'
import zhCN from 'ant-design-vue/es/locale/zh_CN'
import dayjs from 'dayjs'
import 'dayjs/locale/zh-cn'

const locale = ref(zhCN.locale)
watch(locale, val => {
  dayjs.locale(val)
})

const componentSize = ref('middle')
useUserTheme()
</script>

<style>
#app {
  height: 100%;
}
.ant-pro-sider {
  z-index: 20;
}
.ant-modal-body {
  padding-bottom: 0;
}
.has-breadcrumb {
  padding: 10px 24px;
}
.table-query {
  margin-bottom: 8px;
}
.ant-btn-link {
  margin-right: 0;
  padding: 0;
}
.ant-col {
  padding-left: 6px;
}
</style>
