<template>
  <a-modal
    v-model:visible="visible"
    :width="800"
    :title="'分配角色'"
    :confirm-loading="confirmLoading"
    :destroyOnClose="false"
    :maskClosable="false"
    :forceRender="true"
    @ok="handleOk"
    @cancel="handleCancel"
  >
    <b-table
      ref="table"
      :options="options"
      :columns="columns"
      :row-key="record => record.id"
      :load-data="data"
    >
      <template #isDefault="{ record }">
        {{ appStore.dictItemValue('sys_yes_or_no', record.isDefault) }}
      </template>
    </b-table>
  </a-modal>
</template>

<script setup>
import { List } from '@/api/permission/role'
import { ListRoleIdsByUserId, AssignRoles } from '@/api/permission/user'
import { useAppStore } from '@/store/app'
import { message } from 'ant-design-vue'

const appStore = useAppStore()

const visible = ref(false)
const confirmLoading = ref(false)

const options = {
  showAdd: false,
  showBatchDel: false
}
const columns = [
  { title: '角色名称', dataIndex: 'name' },
  { title: '描述', dataIndex: 'description', ellipsis: true },
  { title: '是否默认', dataIndex: 'isDefault' }
]
const data = (parameter) => {
  return List(Object.assign(parameter, {})).then(res => {
    return res.data
  })
}

const user = ref({})
const open = (record) => {
  visible.value = true
  user.value = record
  listRoleIdsByUserId()
}

const table = ref()
const listRoleIdsByUserId = () => {
  const param = {
    id: user.value.id,
    name: user.value.username
  }
  ListRoleIdsByUserId(param).then(res => {
    table.value.state.selectedRowKeys = res.data
  })
}

const assignRoles = () => {
  confirmLoading.value = true
  const roles = table.value.state.selectedRows
  const ids = roles.map(item => item.id)
  const names = roles.map(item => item.name)
  const param = {
    id: user.value.id,
    name: user.value.username,
    ids,
    names
  }
  AssignRoles(param).then(res => {
    if (res.success) {
      message.info(res.message)
      handleCancel()
    }
  }).finally(() => {
    confirmLoading.value = false
  })
}

const handleOk = () => {
  assignRoles()
}

const handleCancel = () => {
  visible.value = false
  table.value.state.selectedRowKeys = []
  table.value.state.selectedRows = []
}

defineExpose({
  open
})

</script>
