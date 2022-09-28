<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="流程名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入流程名称" />
        </a-form-item>
        <a-form-item label="流程编码">
          <a-input v-model:value="queryParam.code" placeholder="请输唯一编码" />
        </a-form-item>
        <a-form-item>
          <a-space>
            <a-button type="primary" @click="table.refresh()">查询</a-button>
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
      <template #action="{ record }">
        <a @click="handleDesign(record)">设计</a>
        <a-divider type="vertical"/>
        <a @click="handleEdit(record)">冻结</a>
        <a-divider type="vertical"/>
        <a @click="handleEdit(record)">部署</a>
        <a-divider type="vertical"/>
        <a @click="handleEdit(record)">导出</a>
        <a-divider type="vertical"/>
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </template>
    </b-table>
  </a-card>
</template>

<script setup>
import { ListProcessDefinitions } from '@/api/workflow/workflow'
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '流程分类', dataIndex: 'category' },
  { title: '流程名称', dataIndex: 'name' },
  { title: '流程key', dataIndex: 'key' },
  // { title: '描述', dataIndex: 'description', ellipsis: true },
  { title: '操作', dataIndex: 'action', width: '240px' }
]
const data = (parameter) => {
  return ListProcessDefinitions(Object.assign(parameter, queryParam.value)).then(res => {
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

const processDesigner = ref()
const handleDesign = (record) => {
  processDesigner.value.open(record)
}
const handleAdd = () => {
  processDesigner.value.open({})
}
const handleEdit = (record) => {
  processDesigner.value.open(record)
}

const handleDel = (record) => {
}
const handleBatchDel = (keys, rows) => {
}

</script>
