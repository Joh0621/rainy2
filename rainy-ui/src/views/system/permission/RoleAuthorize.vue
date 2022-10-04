<template>
  <a-modal
    v-model:visible="visible"
    title="分配菜单"
    :confirm-loading="confirmLoading"
    :destroyOnClose="false"
    :maskClosable="false"
    :forceRender="true"
    @ok="handleOk"
    @cancel="handleCancel"
  >
    <a-spin :spinning="spinning">
      <a-row>
        <a-col :span="12" :offset="3">
          <a-tree
              v-model:checkedKeys="checkedKeys"
              :fieldNames="fieldNames"
              :tree-data="treeData"
              checkable
              @check="handleCheck">
          </a-tree>
        </a-col>
      </a-row>
    </a-spin>
  </a-modal>
</template>

<script setup>
import { Tree, MenuAssign, RoleMenuIds } from '@/api/system/menu.js'
import { toIdNameParam } from '@/utils/ParamUtils'
import { message } from 'ant-design-vue'

const visible = ref(false)
const confirmLoading = ref(false)

const record = ref({})
const open = (recordVal) => {
  visible.value = true
  record.value = recordVal
  menuTree()
}

const checkedKeys = ref([])
const roleMenuIds = () => {
  const param = toIdNameParam(record.value)
  RoleMenuIds(param).then(res => {
    checkedKeys.value = res.data
  }).finally(() => {
    spinning.value = false
  })
}
const checkedNodes = ref([])
const halfCheckedKeys = ref([])
const handleCheck = (keys, e) => {
  checkedKeys.value = keys
  checkedNodes.value = e.checkedNodes
  halfCheckedKeys.value = e.halfCheckedKeys
}

const fieldNames = {
  key: 'id',
  title: 'name'
}
const treeData = ref([])
const spinning = ref(false)
const menuTree = () => {
  spinning.value = true
  Tree({}).then(res => {
    treeData.value = res.data
    // 查询拥有的菜单
    roleMenuIds()
  })
}

const emits = defineEmits(['ok'])
const menuAssign = () => {
  confirmLoading.value = true
  MenuAssign(getParam()).then(res => {
    if (res.success) {
      message.info(res.message)
      handleCancel()
      emits('ok')
    }
  }).finally(() => {
    confirmLoading.value = false
  })
}

const getParam = () => {
  const param = {
    id: record.value.id,
    name: record.value.name,
    ids: [],
    halfIds: [],
    names: []
  }
  checkedNodes.value.forEach(node => {
    param.ids.push(node.id)
    param.names.push(node.name)
  })
  param.halfIds = halfCheckedKeys.value
  return param
}

const handleOk = () => {
  menuAssign()
}

const handleCancel = () => {
  visible.value = false
}

defineExpose({
  open
})
</script>
