<template>
  <a-modal
      v-model:visible="visible"
      style="top: 40px"
      :width="1200"
      title="点码管理"
      :confirm-loading="confirmLoading"
      :destroyOnClose="false"
      :maskClosable="false"
      :forceRender="true"
      @ok="handleCancel"
      @cancel="handleCancel"
  >
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="测点点码">
          <a-input v-model:value="queryParam.code" placeholder="请输入点码" />
        </a-form-item>
        <a-form-item label="测定描述">
          <a-input v-model:value="queryParam.name" placeholder="请输测点描述" />
        </a-form-item>
        <a-form-item>
          <a-space>
            <a-button type="primary" @click="handleOk">查询</a-button>
            <a-button @click="handleReset">重置</a-button>
          </a-space>
        </a-form-item>
      </a-form>
    </div>
    <b-table
        ref="table"
        :options="options"
        :columns="columns"
        :row-key="record => record.id"
        :load-data="data"
        @add="handleAdd"
        @batch-del="handleBatchDel"
    >
      <template #operation>
        <a-download ref="downloader" title="导出" description="导出全部数据" @dl="handleExportExcel"></a-download>
      </template>
      <template #action="{ record }">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical"/>
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </template>
    </b-table>
    <point-edit ref="editor" @ok="handleOk"></point-edit>
  </a-modal>
</template>

<script setup>
import { List, Export, Del } from '@/api/main/point'
import PointEdit from './PointEdit.vue'
import { toIdNamesParam } from '@/utils/ParamUtils'

import { message } from 'ant-design-vue'

const visible = ref(false)
const confirmLoading = ref(false)

const options = {
  showAdd: true,
  showBatchDel: true
}
const columns = [
  { title: '设备名称', dataIndex: 'deviceName' },
  { title: '设备编码', dataIndex: 'deviceCode' },
  { title: '测点点码', dataIndex: 'code' },
  { title: '测点描述', dataIndex: 'name', ellipsis: true },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const queryParam = ref({})
const data = (parameter) => {
  return List(Object.assign(parameter, queryParam.value)).then(res => {
    return res.data
  })
}

const device = ref({})
const open = (record) => {
  visible.value = true
  device.value = record
  queryParam.value.deviceCode = record.code
  table.value.refresh()
}

const table = ref()
const handleOk = () => {
  table.value.refresh()
}

const handleReset = () => {
  queryParam.value.code = ''
  queryParam.value.name = ''
  handleOk()
}

const handleDel = (record) => {
  const idNamesParam = toIdNamesParam(record)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success(res.message)
      handleOk()
    }
  })
}

const handleBatchDel = (keys, rows) => {
  const idNamesParam = toIdNamesParam(rows)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success(res.message)
      handleOk()
    }
  })
}

const editor = ref()
const handleAdd = () => {
  editor.value.open(true, {
    deviceCode: device.value.code,
    deviceName: device.value.name
  })
}

const handleEdit = record => {
  editor.value.open(false, record)
}

const downloader = ref()
const handleExportExcel = () => {
  Export().then(res => {
    downloader.value.download(res)
  })
}
const handleCancel = () => {
  visible.value = false
  queryParam.value = {}
}

defineExpose({
  open
})

</script>
