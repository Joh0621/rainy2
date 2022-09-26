<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="流程名称">
          <a-input v-model:value="queryParam.processName" placeholder="请输入流程名称" />
        </a-form-item>
        <a-form-item label="发起人">
          <a-input v-model:value="queryParam.startBy" placeholder="请输入发起人" />
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
    >
      <template #action="{ record }">
        <a @click="handleComplete(record)">审批</a>
      </template>
    </b-table>
    <TaskComplete ref="taskComplete" @ok="handleOk"></TaskComplete>
  </a-card>
</template>

<script setup>
import { ListTasks } from '@/api/workflow/workflow'
import TaskComplete from './TaskComplete.vue'

const options = {
  showAdd: false,
  showBatchDel: false
}
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '流程名称', dataIndex: 'processName', width: '120px', ellipsis: true },
  { title: '发起人', dataIndex: 'startBy', width: '100px' },
  // { title: '任务编号', dataIndex: 'id', ellipsis: true },
  { title: '任务节点', dataIndex: 'name' },
  { title: '开始时间', dataIndex: 'startTime' },
  { title: '截止时间', dataIndex: 'dueDate' },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return ListTasks(Object.assign(parameter, queryParam.value)).then(res => {
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

const taskComplete = ref()
const handleComplete = (record) => {
  taskComplete.value.open(record)
}

</script>
