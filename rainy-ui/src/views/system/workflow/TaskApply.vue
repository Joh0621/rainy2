<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="流程名称">
          <a-input v-model:value="queryParam.processName" placeholder="请输入流程名称" />
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
        <a @click="handleDetail(record)">删除</a>
        <a-divider type="vertical"/>
        <a @click="() => { taskTrack.open(record) }">跟踪</a>
      </template>
    </b-table>
    <TaskComplete ref="taskComplete" @ok="handleOk"></TaskComplete>
    <TaskTrack ref="taskTrack" @ok="handleOk"></TaskTrack>
  </a-card>
</template>

<script setup>
import { List } from '@/api/main/dataApply'
import TaskComplete from './TaskComplete.vue'
import TaskTrack from './TaskTrack.vue'
import { useAppStore } from '@/store/app'
import { message } from 'ant-design-vue'

const appStore = useAppStore()

const options = {
  showAdd: false,
  showBatchDel: false
}

const taskTrack = ref()
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '设备名称', dataIndex: 'dataId', width: '120px', ellipsis: true },
  { title: '数据目录', dataIndex: 'dataDirectionId', width: '100px' },
  { title: '责任部门', dataIndex: 'orgId', width: '100px' },
  { title: '申请时间', dataIndex: 'startTime' },
  { title: '审批状态', dataIndex: 'approved' },
  { title: '审批时间', dataIndex: 'approvedTime' },
  { title: '审批人', dataIndex: 'approvedUsername' },
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

const taskComplete = ref()
const handleDetail = (record) => {
  message.info('开发中....')
}

</script>
