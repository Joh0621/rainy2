<template>
  <a-icon :type="props.type" />
</template>
<script setup>
import { createFromIconfontCN } from '@ant-design/icons-vue'
import { defaultConfig } from '@/config/defaultConfig.js'
const props = defineProps({
  type: {
    default: 'icon-unorderedlist'
  }
})
const AIcon = createFromIconfontCN({
  scriptUrl: defaultConfig.iconfontUrl // ε¨ iconfont.cn δΈηζ
})
</script>
