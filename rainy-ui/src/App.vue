<template>
  <ConfigProvider :locale="locale === 'en' ? enUS : zhCN" :component-size="componentSize">
    <router-view />
  </ConfigProvider>
</template>

<script setup>
import { ConfigProvider } from 'ant-design-vue'
import enUS from 'ant-design-vue/es/locale/en_US'
import zhCN from 'ant-design-vue/es/locale/zh_CN'
import dayjs from 'dayjs'
import 'dayjs/locale/zh-cn'

const locale = ref(zhCN.locale)
watch(locale, val => {
  dayjs.locale(val)
})

const componentSize = ref('middle')
</script>
