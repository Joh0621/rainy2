<template>
  <a-descriptions>
    <a-descriptions-item label="设备名称">{{device.name}}</a-descriptions-item>
    <a-descriptions-item label="设备编码">{{device.code}}</a-descriptions-item>
    <a-descriptions-item label="更新时间">{{device.updateTime}}</a-descriptions-item>
    <a-descriptions-item label="责任人">{{device.responsible}}</a-descriptions-item>
    <a-descriptions-item label="描述">
      新能源场站数据
    </a-descriptions-item>
  </a-descriptions>
</template>

<script setup>
defineProps({
  device: {
    default: {}
  }
})
</script>

<style scoped>

</style>
