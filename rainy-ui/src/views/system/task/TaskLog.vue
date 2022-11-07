<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="任务名称">
          <a-input v-model:value="queryParam.username" placeholder="请输入任务名称" />
        </a-form-item>
        <a-form-item label="任务分类">
          <a-select style="width: 150px" v-model:value="queryParam.category" placeholder="请选择分类" @select="$refs.table.refresh()">
            <a-select-option :key="item.value" v-for="item in appStore.dictItems('sys_task_category')" :value="item.value">
              {{ item.name }}
            </a-select-option>
          </a-select>
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
      @batch-del="handleBatchDel"
    >
      <template #operation>
        <a-download ref="downloader" title="导出" description="导出全部数据" @dl="handleExportExcel"></a-download>
      </template>
      <template #category="{ record }">
        {{ appStore.dictItemValue('sys_task_category', record.category) }}
      </template>
      <template #success="{ record }">
        <a-tag color="green">{{ appStore.dictItemValue('sys_yes_or_no', record.success) }}</a-tag>
      </template>
      <template #errorMessage="{ record }">
        <a-tag v-if="record.errorMessage" color="red">
          {{ record.errorMessage }}
        </a-tag>
      </template>
      <template #action="{ record }">
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </template>
    </b-table>
  </a-card>
</template>

<script setup>
import { useAppStore } from '@/store/app'
import { Del, Export, List } from '@/api/system/taskLog'
import { toIdNamesParam } from '@/utils/ParamUtils'
import { message } from 'ant-design-vue'

const appStore = useAppStore()

const options = {
  showAdd: false,
  showBatchDel: true
}
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '任务名称', dataIndex: 'name' },
  { title: '任务分类', dataIndex: 'category' },
  { title: '执行时间', dataIndex: 'datetime', width: '170px' },
  { title: 'class类名', dataIndex: 'className', width: '220px' },
  { title: '是否成功', dataIndex: 'success' },
  { title: '错误信息', dataIndex: 'errorMessage', ellipsis: true },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return List(Object.assign(parameter, queryParam.value)).then(res => {
    return res.data
  })
}

const handleOk = () => {
  table.value.refresh()
}
const handleReset = () => {
  queryParam.value = {}
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

const downloader = ref()
const handleExportExcel = () => {
  Export().then(res => {
    downloader.value.download(res)
  })
}

</script>
