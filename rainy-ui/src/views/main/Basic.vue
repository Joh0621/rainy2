<template>
  <a-descriptions>
    <a-descriptions-item label="设备名称">{{device.name}}</a-descriptions-item>
    <a-descriptions-item label="设备编码">{{device.code}}</a-descriptions-item>
    <a-descriptions-item label="更新时间">{{device.updateTime}}</a-descriptions-item>
    <a-descriptions-item label="所属场站">{{device.dataDirectoryName}}</a-descriptions-item>
    <a-descriptions-item label="责任部门">{{device.orgName}}</a-descriptions-item>
    <a-descriptions-item label="责任人">{{device.responsible}}</a-descriptions-item>
    <a-descriptions-item label="所属专业">
      {{ appStore.dictItemValue('biz_major', device.major ) }}
    </a-descriptions-item>
    <a-descriptions-item label="更新频率">
      {{ appStore.dictItemValue('biz_data_update_frequency', device.updateFrequency) }}
    </a-descriptions-item>
    <a-descriptions-item label="测点数量">
      {{ device.pointCount }}
    </a-descriptions-item>

  </a-descriptions>
</template>

<script setup>
import { useAppStore } from '@/store/app'
const appStore = useAppStore()

defineProps({
  device: {
    default: {}
  }
})
</script>

<style scoped>

</style>
