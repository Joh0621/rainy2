<template>
  <a-card>
    <a-space>
      <a-button @click="handlePreview" type="primary">预览</a-button>
      <a-button @click="handleSave">保存</a-button>
      <a-button @click="handleExport" type="dashed"><a ref="downloadBpmn">导出</a></a-button>
      <a-button @click="handleExportImg" type="dashed"><a ref="downloadSvg">下载svg</a></a-button>
    </a-space>
    <div ref="container" class="bpmn-container"></div>
    <div ref="propertiesPanel" class="properties-panel"></div>
  </a-card>
</template>

<script setup>
/* 右边工具栏样式 */
import 'bpmn-js/dist/assets/diagram-js.css'
import 'bpmn-js/dist/assets/bpmn-js.css'
import 'bpmn-js/dist/assets/bpmn-font/css/bpmn-embedded.css'
import 'bpmn-js-properties-panel/dist/assets/properties-panel.css'

import BpmnModeler from 'bpmn-js/lib/Modeler'
import {
  BpmnPropertiesProviderModule,
  BpmnPropertiesPanelModule,
  CamundaPlatformPropertiesProviderModule
} from 'bpmn-js-properties-panel'
import CamundaBpmnModdle from 'camunda-bpmn-moddle/resources/camunda.json'
import { ProcessBpmn20xml } from '@/api/workflow/workflow.js'
import { bpmn20xml } from '@/views/system/workflow/bpmn20xml.js'
import { message } from 'ant-design-vue'

onMounted(() => {
  initBpmModeler()
  processBpmn20xml('')
})

const container = ref()
const propertiesPanel = ref()
const bpmModeler = ref()
const initBpmModeler = () => {
  bpmModeler.value = new BpmnModeler({
    container: container.value,
    propertiesPanel: {
      parent: propertiesPanel.value
    },
    additionalModules: [
      // 左边工具栏以及节点
      BpmnPropertiesProviderModule,
      BpmnPropertiesPanelModule,
      CamundaPlatformPropertiesProviderModule
    ],
    moddleExtensions: {
      camunda: CamundaBpmnModdle
    }
  })

  bpmModeler.value.on('commandStack.changed', (e) => {
    console.log(e)
  })
}

const processBpmn20xml = id => {
  if (!id) {
    bpmModeler.value.importXML(bpmn20xml).then(res => {
      const { warnings } = res
      console.log(warnings)
    }).catch(err => {
      console.log(err.message, err.warnings)
    })
  } else {
    const param = {
      processDefinitionId: id
    }
    ProcessBpmn20xml(param).then(res => {
      bpmModeler.value.importXML(res.data).then(res => {
        const { warnings } = res
        console.log(warnings)
      }).catch(err => {
        console.log(err.message, err.warnings)
      })
    })
  }
}

const handlePreview = () => {
  bpmModeler.value.saveXML({ format: true }).then(res => {
    console.log(res.xml)
  }).catch(err => {
    console.log(err)
  })
  // bpmModeler.value._definitions.rootElements[0].id = 'Process_001'
}

const handleSave = () => {
  message.info('保存成功！')
  // bpmModeler.value.saveSVG(())
}

const downloadBpmn = ref()
const handleExport = () => {
  bpmModeler.value.saveXML({ format: true }).then(res => {
    const encodedData = encodeURIComponent(res.xml)
    downloadBpmn.value.href = 'data:application/bpmn20-xml;charset=UTF-8,' + encodedData
    downloadBpmn.value.download = 'bpmn20.bpmn'
  }).catch(err => {
    console.log(err)
  })
}


const downloadSvg = ref()
const handleExportImg = () => {
  bpmModeler.value.saveSVG().then(res => {
    const encodedData = encodeURIComponent(res.svg)
    downloadSvg.value.href = 'data:application/bpmn20-xml;charset=UTF-8,' + encodedData
    downloadSvg.value.download = 'bpmn.svg'
  }).catch((err) => {
    console.log(err)
  })
}
</script>

<style lang="less">
.bpmn-container {
  height: 550px
}
.properties-panel {
  width: 260px;
  position: absolute;
  right: 10px;
  top: 80px;
  border: 1px gainsboro solid;
}
.full-modal {
  .ant-modal {
    max-width: 100%;
    top: 0;
    padding-bottom: 0;
    margin: 0;
  }
  .ant-modal-content {
    display: flex;
    flex-direction: column;
    height: calc(100vh);
  }
  .ant-modal-body {
    flex: 1;
  }
}
</style>
