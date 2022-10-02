<template>
  <a-modal
      v-model:visible="visible"
      style="top: 40px;"
      :width="1200"
      title="字典项"
      :confirm-loading="confirmLoading"
      :destroyOnClose="false"
      :maskClosable="false"
      :forceRender="true"
      @ok="visible = false"
  >
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="所属字典">
          <a-select style="width: 150px" v-model:value="queryParam.dictCode" placeholder="请选择所属字典" @select="$refs.table.refresh()">
            <a-select-option
                v-for="item in appStore.dicts()"
                :key="item.dictCode"
                :value="item.dictCode">
              {{ item.name }}
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item label="字典项编码">
          <a-input v-model:value="queryParam.code" placeholder="请输入字典项编码" />
        </a-form-item>
        <a-form-item label="字典项值">
          <a-input v-model:value="queryParam.value" placeholder="请输字典项值" />
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
        :columns="columns"
        :row-key="record => record.id"
        :load-data="data"
        @add="handleAdd"
        @batch-del="handleBatchDel"
    >
      <template #operation>
        <a-download ref="downloader" title="导出" description="导出全部数据" @dl="handleExportExcel"></a-download>
      </template>
      <template #dictCode="{ record }">
        {{ appStore.dictName(record.dictCode) }}
      </template>
      <template #dataType="{ record }">
        {{ appStore.dictItemValue('sys_data_type', record.dataType) }}
      </template>
      <template #action="{ record }">
        <a-button @click="handleEdit(record)" type="link" size="small">编辑</a-button>
        <a-divider type="vertical"/>
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </template>
    </b-table>
    <dict-item-edit ref="editor" @ok="handleOk"></dict-item-edit>
  </a-modal>
</template>

<script setup>
import { useAppStore } from '@/store/app'
import { List, Del, Export } from '@/api/system/dictItem'
import { toIdNamesParam } from '@/utils/ParamUtils'
import { sortValue } from '@/utils/constants'
import DictItemEdit from './DictItemEdit.vue'
import { message } from 'ant-design-vue'

const appStore = useAppStore()

const visible = ref(false)
const confirmLoading = ref(false)

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '所属字典', dataIndex: 'dictCode' },
  { title: '字典项编码', dataIndex: 'code', ellipsis: true },
  { title: '字典项值', dataIndex: 'value', ellipsis: true },
  { title: '描述', dataIndex: 'description', ellipsis: true },
  { title: '排序', dataIndex: 'sort' },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return List(Object.assign(parameter, queryParam.value)).then(res => {
    return res.data
  })
}

const open = dict => {
  visible.value = true
  queryParam.value.dictCode = dict.code
  handleOk()
}

const handleOk = () => {
  table.value.refresh()
}
const handleReset = () => {
  queryParam.value = {}
  handleOk()
}

const editor = ref()
const handleAdd = () => {
  editor.value.open(true, {
    sort: sortValue,
    dictCode: queryParam.value.dictCode
  })
}
const handleEdit = (record) => {
  editor.value.open(false, record)
}

const handleDel = (record) => {
  const idNamesParam = toIdNamesParam(record)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success('删除成功！')
      handleOk()
      // 更新
      appStore.Common()
    }
  })
}
const handleBatchDel = (keys, rows) => {
  const idNamesParam = toIdNamesParam(rows)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success('删除成功！')
      handleOk()
      // 更新
      appStore.Common()
    }
  })
}

const downloader = ref()
const handleExportExcel = () => {
  Export().then(res => {
    downloader.value.download(res)
  })
}

defineExpose({
  open
})
</script>
<style scoped>
.ant-modal-body {
  min-height: 400px;
}
</style>
