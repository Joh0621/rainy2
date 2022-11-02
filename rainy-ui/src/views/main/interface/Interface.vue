<template>
  <a-card>
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="接口名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入接口名称" />
        </a-form-item>
        <a-form-item label="接口编码">
          <a-input v-model:value="queryParam.code" placeholder="请输唯一编码" />
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
        :options="{ showAdd: false, showBatchDel: false }"
        :row-key="record => record.id"
        :load-data="data"
        @batch-del="handleBatchDel"
    >
<!--      <template #status="{ record }">-->
<!--        <a-switch @click="handleChange(record)" :checkedValue="0" :unCheckedValue="1" v-model:checked="record.status" checked-children="启用" un-checked-children="停用" />-->
<!--      </template>-->
      <template #action="{ record }">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical"/>
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </template>
      <template #expandedRowRender="{ record }">
        <p style="margin: 0">
          {{ record.description }}
        </p>
      </template>
    </b-table>
  </a-card>
</template>
<script setup>
import { List, Del } from '@/api/main/interface.js'
import { toIdNamesParam } from '@/utils/ParamUtils.js'
import { message } from 'ant-design-vue'

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '接口名称', dataIndex: 'apiName' },
  { title: '调用者', dataIndex: 'username' },
  { title: '调用次数', dataIndex: 'totalCount' },
  { title: '传输总量(byte)', dataIndex: 'totalDataSize' },
  { title: '平均响应时间(ms)', dataIndex: 'avgResponseTime' }
  // { title: '描述', dataIndex: 'description' },
  // { title: '状态', dataIndex: 'status' }
  // { title: '操作', dataIndex: 'action', width: '150px' }
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

// const handleChange = (record) => {
//   Edit(record).then(res => {
//     if (res.success) {
//       message.info(res.message)
//     }
//   })
// }

const handleEdit = (record) => {
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
</script>
<style scoped>
</style>
