<template>
  <a-card>
    <a-card-meta :title="device.name" :description="device.description" />
    <a-tabs style="margin-top: 10px" v-model:activeKey="activeKey">
      <a-tab-pane key="0" tab="基本信息">
        <basic :device="device"/>
        <div>
          <a-button @click="confirm" type="primary" primary>一键申请</a-button>
        </div>
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
import { Apply } from '@/api/main/dataApply'
import { Detail } from '@/api/main/device'
import { useRouter } from 'vue-router'
import { message, Modal } from 'ant-design-vue'

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

const confirm = () => {
  Modal.confirm({
    title: '一键申请',
    content: `确认申请该设备[${device.value.name}]数据吗?`,
    okText: '确认',
    cancelText: '取消',
    onOk () {
      apply()
    },
    onCancel () {}
  })
}

const apply = () => {
  console.log(device.value)
  Apply(device.value).then(res => {
    if (res.success) {
      message.info('申请成功')
    }
  })
}
</script>
<style scoped>
.ant-card-meta-title {
  margin-bottom: 16px
}
</style>
