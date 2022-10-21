<template>
  <a-row :gutter="16">
    <a-col :span="12">
      <a-card :bordered="false">
        <a-statistic title="我的申请" :value="1" />
      </a-card>
    </a-col>
    <a-col :span="12">
      <a-card :bordered="false">
        <a-statistic title="我的待办" :value="2">
          <template #title>
            sdfsdf
          </template>
        </a-statistic>
      </a-card>
    </a-col>
  </a-row>
</template>
<script setup>

</script>
<style scoped>
</style>
