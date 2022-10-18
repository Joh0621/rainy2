<template>
  <a-modal
      v-model:visible="visible"
      :width="1000"
      :title="'任务详情'"
      :confirm-loading="confirmLoading"
      :destroyOnClose="false"
      :maskClosable="false"
      :forceRender="true"
      @ok="handleOk"
      @cancel="handleCancel"
  >
    <div>
      <div ref="container" style="width: 600px;height: 220px">
        <div ref="canvas" style="margin-left: 100px"></div>
      </div>
      <div>
        <h3>审批记录</h3>
        <a-table :dataSource="dataSource" :columns="columns" />
      </div>
    </div>
  </a-modal>
</template>
<script setup>
import BpmnViewer from 'bpmn-js'
import { ListActivities, ProcessBpmn20xml } from '@/api/workflow/workflow'

const visible = ref(false)
const confirmLoading = ref(false)
const record = ref({})
const open = (recordValue) => {
  visible.value = true
  record.value = recordValue
  loadData(record.value.processInstanceId)
  processBpmn20xml()
}

const bpmn20xml = ref()
const processBpmn20xml = () => {
  const param = {
    processDefinitionId: record.value.processDefinitionId
  }
  ProcessBpmn20xml(param).then(res => {
    bpmn20xml.value = res.data
    preview()
  })
}

const container = ref()
let bpmnViewer = null
const preview = () => {
  bpmnViewer = new BpmnViewer({ container: container.value })
  bpmnViewer.importXML(bpmn20xml.value).then(res => {
    const { warnings } = res
    console.log(warnings)
    const canvas = bpmnViewer.get('canvas')
    canvas.zoom('fit-viewport')
  }).catch(err => {
    console.log(err.message, err.warnings)
  })
}

const columns = [
  { title: '节点名称', dataIndex: 'name', width: '140px' },
  { title: '开始时间', dataIndex: 'startTime', width: '200px' },
  { title: '结束时间', dataIndex: 'endTime', width: '200px' },
  { title: '操作人', dataIndex: 'assignee', width: '80px' },
  { title: '审批意见', dataIndex: 'remarks' }
]
const dataSource = ref([])
const loadData = (id) => {
  const param = {
    processInstanceId: id
  }
  ListActivities(param).then(res => {
    dataSource.value = res.data
  })
}

const handleOk = () => {
  handleCancel()
}

const handleCancel = () => {
  visible.value = false
  bpmnViewer.destroy()
}

defineExpose({
  open
})
</script>
<style>
.bjs-container {
  margin-left: 100px;
}
</style>
