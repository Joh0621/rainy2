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
      <template #finished="{ record }">
        {{ appStore.dictItemValue('sys_yes_or_no', record.finished)}}
      </template>
      <template #action="{ record }">
        <a @click="handleTrack(record)">详情</a>
      </template>
    </b-table>
    <TaskTrack ref="taskTrack" @ok="handleOk"></TaskTrack>
  </a-card>
</template>

<script setup>
import { ListHistoryTasks } from '@/api/workflow/workflow'
import TaskTrack from './TaskTrack.vue'
import { useAppStore } from '@/store/app'

const appStore = useAppStore()

const options = {
  showAdd: false,
  showBatchDel: false
}
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '流程名称', dataIndex: 'processName', width: '120px', ellipsis: true },
  { title: '任务节点', dataIndex: 'name' },
  { title: '发起人', dataIndex: 'startBy' },
  // { title: '任务编号', dataIndex: 'id', ellipsis: true },
  { title: '开始时间', dataIndex: 'startTime' },
  { title: '结束时间', dataIndex: 'endTime' },
  { title: '任务耗时(ms)', dataIndex: 'durationInMillis' },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  queryParam.value.finished = true
  return ListHistoryTasks(Object.assign(parameter, queryParam.value)).then(res => {
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

const taskTrack = ref()
const handleTrack = (record) => {
  taskTrack.value.open(record)
}

</script>
