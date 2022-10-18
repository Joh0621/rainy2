<template>
  <a-card>
    <a-card-meta :title="device.name" :description="device.description" />
    <a-tabs style="margin-top: 10px" v-model:activeKey="activeKey">
      <a-tab-pane key="0" tab="基本信息">
        <basic :device="device"/>
        <div>
          <a-button @click="handleApply" type="primary" primary>一键申请</a-button>
        </div>
        <ApplyData ref="applyData"/>
      </a-tab-pane>
      <a-tab-pane key="1" tab="测点描述">
        <point :device-code="deviceCode" />
      </a-tab-pane>
      <a-tab-pane key="2" tab="数据预览" force-render>
        <point-preview />
      </a-tab-pane>
      <a-tab-pane key="3" tab="血缘关系">
        <blood-rel />
      </a-tab-pane>
      <a-tab-pane key="4" tab="接口文档">
        <api-doc />
      </a-tab-pane>
    </a-tabs>
  </a-card>
</template>
<script setup>
import Basic from './Basic.vue'
import Point from './Point.vue'
import PointPreview from './PointPreview.vue'
import BloodRel from './BloodRel.vue'
import ApiDoc from './ApiDoc.vue'
import ApplyData from './ApplyData.vue'
import { Detail } from '@/api/main/device'
import { useRouter } from 'vue-router'

const router = useRouter()
onMounted(() => {
  detail()
})
const deviceCode = router.currentRoute.value.params.deviceCode
const device = ref({})
const detail = () => {
  Detail(deviceCode).then(res => {
    device.value = res.data
  })
}
const activeKey = ref('0')

const applyData = ref()
const handleApply = () => {
  applyData.value.open(device.value)
}
</script>
<style scoped>
.ant-card-meta-title {
  margin-bottom: 16px
}
</style>
