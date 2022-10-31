<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="任务名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入任务名称" />
        </a-form-item>
        <a-form-item label="任务分类">
          <a-select style="width: 150px" v-model:value="queryParam.categoryCode" placeholder="请选择分类" @select="$refs.table.refresh()">
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
      :columns="columns"
      :row-key="record => record.id"
      :load-data="data"
      @add="handleAdd"
      @batch-del="handleBatchDel"
    >
      <template #operation>
        <a-download ref="downloader" title="导出" description="导出全部数据" @dl="handleExportExcel"></a-download>
      </template>
      <template #category="{ record }">
        {{ appStore.dictItemValue('sys_task_category', record.category) }}
      </template>
      <template #status="{ record }">
        <a-badge v-if="record.status === 0" status="processing" text="运行中" />
        <a-badge v-if="record.status === 1" status="error" text="暂停中" />
      </template>
      <template #action="{ record }">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical"/>
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </template>
    </b-table>
    <task-edit ref="editor" @ok="handleOk"></task-edit>
  </a-card>
</template>

<script setup>
import { useAppStore } from '@/store/app'
import { List, Del, Export } from '@/api/system/task'
import { toIdNamesParam } from '@/utils/ParamUtils'
import TaskEdit from './TaskEdit.vue'
import { message } from 'ant-design-vue'

const appStore = useAppStore()

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '任务分类', dataIndex: 'category' },
  { title: '任务名称', dataIndex: 'name' },
  { title: 'cron表达式', dataIndex: 'cron' },
  { title: 'class类名', dataIndex: 'className', width: '220px' },
  { title: '状态', dataIndex: 'status' },
  { title: '描述', dataIndex: 'description', ellipsis: true },
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

const editor = ref()
const handleAdd = () => {
  editor.value.open(true, {
    status: 0
  })
}
const handleEdit = (record) => {
  editor.value.open(false, record)
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
