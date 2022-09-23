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
      <template #isDefault="{ record }">
        {{ appStore.dictItemValue('sys_yes_or_no', record.isDefault) }}
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
import { useAppStore } from '@/store/app'
import PointEdit from './PointEdit.vue'
import { toIdNamesParam } from '@/utils/ParamUtils'

import { message } from 'ant-design-vue'

const appStore = useAppStore()

const visible = ref(false)
const confirmLoading = ref(false)

const options = {
  showAdd: true,
  showBatchDel: true
}
const columns = [
  { title: '编号', dataIndex: 'id' },
  { title: '设备编码', dataIndex: 'deviceCode' },
  { title: '点码', dataIndex: 'code' },
  { title: '点名', dataIndex: 'name', ellipsis: true },
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
  queryParam.value.deviceCode = record.deviceCode
}

const table = ref()
const handleOk = () => {
  table.value.refresh()
}

const handleDel = (record) => {
  const idNamesParam = toIdNamesParam(record)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success('删除成功！')
      handleOk()
    }
  })
}

const handleBatchDel = (keys, rows) => {
  const idNamesParam = toIdNamesParam(rows)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success('删除成功！')
      handleOk()
    }
  })
}

const editor = ref()
const handleAdd = () => {
  editor.value.open(true, {})
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
