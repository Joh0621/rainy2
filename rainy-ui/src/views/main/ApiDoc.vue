<template>
  <div style="margin-bottom: 8px;">
    <a @click="downloadDoc">文档下载</a>
  </div>
<!--  <a-collapse v-model:activeKey="activeKey">-->
<!--    <a-collapse-panel key="1" header="实时数据接口">-->
<!--      <h4>接口地址</h4>-->
<!--      <pre><code>http://localhost:8080</code></pre>-->
<!--      <h4>请求方法</h4>-->
<!--      <pre><code>GET</code></pre>-->
<!--      <h4>请求参数</h4>-->
<!--      <pre><code>GET</code></pre>-->
<!--      <p>{{ text }}</p>-->
<!--    </a-collapse-panel>-->
<!--  </a-collapse>-->
</template>

<script setup>
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
