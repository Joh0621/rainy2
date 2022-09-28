<template>
  <a-modal
      v-model:visible="visible"
      :width="800"
      :title="'任务跟踪'"
      :confirm-loading="confirmLoading"
      :destroyOnClose="false"
      :maskClosable="false"
      :forceRender="true"
      @ok="handleOk"
      @cancel="handleCancel"
  >
    <div>
      <div ref="container" style="height: 300px">
        <div ref="canvas"></div>
      </div>
    </div>
  </a-modal>
</template>
<script setup>
import BpmnViewer from 'bpmn-js'
import { ProcessBpmn20xml } from '@/api/workflow/workflow'

const visible = ref(false)
const confirmLoading = ref(false)

const open = (record) => {
  visible.value = true
  processBpmn20xml()
}

const bpmn20xml = ref()
const processBpmn20xml = () => {
  const param = {
    processDefinitionId: 'process-data-apply:1:7dc4d7f9-3e0e-11ed-a6b7-72e0deb8de6f'
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
