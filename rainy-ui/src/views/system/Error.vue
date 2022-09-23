<template>
  <a-result
    :status="status"
    :style="{
      height: '100%',
      background: '#fff',
    }"
    :title="router.currentRoute.value.params.status"
    sub-title="Welcome you access this page."
  >
    <template #extra>
      <a-button type="primary" @click="handleClick">Back Home</a-button>
    </template>
  </a-result>
</template>

<script setup>
import router from '@/router'
const handleClick = () => {
  router.push({ path: '/' })
}
</script>
