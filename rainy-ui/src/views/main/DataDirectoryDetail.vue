<template>
  <a-card>
    <a-card-meta :title="device.name" :description="device.description" />
    <a-tabs style="margin-top: 10px" v-model:activeKey="activeKey">
      <a-tab-pane key="0" tab="基本信息">
        <basic :device="device"/>
      </a-tab-pane>
      <a-tab-pane key="1" tab="数据点码">
        <point />
      </a-tab-pane>
      <a-tab-pane key="2" tab="数据预览" force-render>
        <point-preview />
      </a-tab-pane>
      <a-tab-pane key="3" tab="血缘关系">
        <blood-rel />
      </a-tab-pane>
    </a-tabs>
    <div>
      <a-button @click="confirm" type="primary" primary>一键申请</a-button>
    </div>
  </a-card>
</template>
<script setup>
import Basic from './Basic.vue'
import Point from './Point.vue'
import PointPreview from './PointPreview.vue'
import BloodRel from './BloodRel.vue'
import { Apply } from '@/api/main/dataApply'
import { Detail } from '@/api/main/device'
import { useRouter } from 'vue-router'
import { message, Modal } from 'ant-design-vue'

const router = useRouter()
onMounted(() => {
  detail()
})

const id = router.currentRoute.value.params.id
const device = ref({})
const detail = () => {
  Detail(id).then(res => {
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
      message.info('申请成功！')
    }
  })
}
</script>
<style scoped>
.ant-card-meta-title {
  margin-bottom: 16px
}
</style>
