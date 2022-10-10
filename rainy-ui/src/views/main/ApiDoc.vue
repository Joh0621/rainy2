<template>
  <div style="margin-bottom: 8px;">
    <a @click="downloadDoc">文档下载</a>
  </div>
  <a-collapse v-model:activeKey="activeKey">
    <a-collapse-panel key="1" header="实时数据接口">
      <h3>接口地址：http://localhost:8080/api/</h3>
      <code>{{ text }}</code>
      <p>{{ text }}</p>
    </a-collapse-panel>
    <a-collapse-panel key="2" header="历史数据接口">
      <p>{{ text }}</p>
    </a-collapse-panel>
  </a-collapse>
</template>

<script setup>
const text = 'A dog is a type of domesticated animal.Known for its loyalty and faithfulness,it can be found as a welcome guest in many households across the world.'
const activeKey = ref(['1'])

watch(activeKey, val => {
  console.log(val)
})

const baseURL = import.meta.env.VITE_API_BASE_URL
const downloadDoc = () => {
  location.href = baseURL + '/file/download?fileName=接口文档.pdf'
}
</script>

<style scoped>

</style>
