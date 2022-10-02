<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="系统模块">
          <a-input v-model:value="queryParam.module" placeholder="请输入模块名" />
        </a-form-item>
        <a-form-item label="用户名">
          <a-input v-model:value="queryParam.username" placeholder="请输入用户名" />
        </a-form-item>
<!--        <a-form-item label="时间选择">-->
<!--          <a-range-picker v-model="queryParam.datetime" show-time></a-range-picker>-->
<!--        </a-form-item>-->
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
      <template #type="{ record }">
        {{ appStore.dictItemValue('sys_login_type', record.type) }}
      </template>
      <template #success="{ record }">
        {{ appStore.dictItemValue('sys_yes_or_no', record.success) }}
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
import { List, Del, Export } from '@/api/log/OperationLog'
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
  { title: '系统模块', dataIndex: 'module' },
  { title: '用户名', dataIndex: 'username' },
  { title: '时间', dataIndex: 'datetime' },
  { title: '详情', dataIndex: 'detail' },
  { title: '操作地址', dataIndex: 'ip' },
  { title: '浏览器', dataIndex: 'browser' },
  { title: '操作系统', dataIndex: 'os' },
  { title: '是否成功', dataIndex: 'success' },
  { title: '错误信息', dataIndex: 'errorMessage' },
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
