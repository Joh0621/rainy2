<template>
  <a-modal
    v-model:visible="visible"
    title="分配数据权限"
    :confirm-loading="confirmLoading"
    :destroyOnClose="false"
    :maskClosable="false"
    :forceRender="true"
    @ok="handleOk"
    @cancel="handleCancel"
  >
    <a-spin :spinning="spinning">
      <a-row>
        <a-col :offset="3">
          <a-select
              v-model:value="dataPermission"
              show-search
              placeholder="请选择数据权限"
              style="width: 350px"
              :options="options"
              :filter-option="filterOption"
              @change="handleChange"
          ></a-select>
          <a-divider style="margin: 16px 0"/>
          <a-tree
              :disabled="dataPermission !== 'ss'"
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
import { Tree } from '@/api/org/org'

const dataPermission = ref('tom')
const options = ref([{
  value: 'jack',
  label: '仅自己'
}, {
  value: 'lucy',
  label: '所属部门'
}, {
  value: 'tom',
  label: '所属部门及以下'
}, {
  value: 'ss',
  label: '自定义'
}])

const handleChange = value => {
  console.log(`selected ${value}`)
}

const filterOption = (input, option) => {
  return option.value.toLowerCase().indexOf(input.toLowerCase()) >= 0
}

const visible = ref(false)
const confirmLoading = ref(false)

const record = ref({})
const open = (recordVal) => {
  visible.value = true
  record.value = recordVal
  orgTree()
}

const checkedKeys = ref([])
const checkedNodes = ref([])
const halfCheckedKeys = ref([])
const isChecked = ref(false)
const handleCheck = (keys, e) => {
  checkedKeys.value = keys
  checkedNodes.value = e.checkedNodes
  halfCheckedKeys.value = e.halfCheckedKeys
  isChecked.value = true
}

const fieldNames = {
  key: 'id',
  title: 'name'
}
const treeData = ref([])
const spinning = ref(false)
const orgTree = () => {
  spinning.value = true
  Tree({}).then(res => {
    treeData.value = res.data
  }).finally(() => {
    spinning.value = false
  })
}

const emits = defineEmits(['ok'])

const handleOk = () => {
  emits('ok')
}

const handleCancel = () => {
  visible.value = false
  isChecked.value = false
  checkedNodes.value = []
}

defineExpose({
  open
})
</script>
