<template>
  <div style="margin-bottom: 8px;">
    <a href="/接口文档.pdf">文档下载</a>
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

<script lang="ts">
import { defineComponent, ref, watch } from 'vue'

export default defineComponent({
  setup () {
    const text = 'A dog is a type of domesticated animal.Known for its loyalty and faithfulness,it can be found as a welcome guest in many households across the world.'
    const activeKey = ref(['1'])

    watch(activeKey, val => {
      console.log(val)
    })

    return {
      text,
      activeKey
    }
  }
})
</script>

<style scoped>

</style>
