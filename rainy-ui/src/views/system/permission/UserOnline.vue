<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="用户名">
          <a-input v-model:value="queryParam.username" placeholder="请输入用户名!" />
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
      <template #status="{ record }">
        {{ appStore.dictItemValue('sys_user_status', record.status) }}
      </template>
      <template #action="{ record }">
        <a @click="handleDel(record)">下线</a>
        <a-divider type="vertical"/>
      </template>
    </b-table>
  </a-card>
</template>

<script setup>
import { ListOnline, KickOut } from '@/api/permission/user'
import { toIdNamesParam } from '@/utils/ParamUtils'
import { message } from 'ant-design-vue'
import { useAppStore } from '@/store/app'

const appStore = useAppStore()

const options = {
  showAdd: false,
  showDel: false
}
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '用户名', dataIndex: 'username' },
  { title: '昵称', dataIndex: 'nickName' },
  { title: '生日', dataIndex: 'birthday' },
  { title: '手机号', dataIndex: 'telephone' },
  { title: '邮箱', dataIndex: 'email' },
  { title: '状态', dataIndex: 'status' },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return ListOnline(Object.assign(parameter, queryParam.value)).then(res => {
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

// 删除
const handleDel = (record) => {
  const idNamesParam = toIdNamesParam(record)
  KickOut(idNamesParam).then((res) => {
    if (res.success) {
      message.success('删除成功！')
      handleOk()
    }
  })
}

// 批量删除
// const handleBatchDel = (keys, rows) => {
//   const idNamesParam = toIdNamesParam(rows)
//   KickOut(idNamesParam).then((res) => {
//     if (res.success) {
//       message.success('删除成功！')
//       handleOk()
//     }
//   })
// }
</script>
