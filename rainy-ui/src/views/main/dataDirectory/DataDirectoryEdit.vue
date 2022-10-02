<template>
  <a-modal
      v-model:visible="visible"
      :title="(flag ? '新增' : '编辑') + '目录'"
      :confirm-loading="confirmLoading"
      :destroyOnClose="false"
      :maskClosable="false"
      :forceRender="true"
      @ok="handleOk"
      @cancel="handleCancel">
    <a-form
        ref="formRef"
        layout="horizontal"
        :model="form"
        :label-col="labelCol"
        :wrapper-col="wrapperCol"
    >
      <a-form-item v-show="false" name="id"></a-form-item>
      <a-form-item
          name="orgId"
          label="组织机构"
          :rules="[{ required: true, message: '请选择组织机构' }]"
          has-feedback
      >
        <a-tree-select
            v-model:value="form.orgId"
            :fieldNames="fieldNames"
            placeholder="请选择组织机构"
            tree-default-expand-all
            :tree-data="orgTreeData"
        >
        </a-tree-select>
      </a-form-item>
      <a-form-item
        label="上级目录"
        name="parentId"
        :rules="[{ required: true, message: '请选择上级目录' }]"
        has-feedback>
        <a-tree-select
            v-model:value="form.parentId"
            :fieldNames="fieldNames"
            placeholder="请选择上级目录"
            tree-default-expand-all
            :tree-data="treeData"
        ></a-tree-select>
      </a-form-item>
      <a-form-item
        label="目录名称"
        name="name"
        :rules="[{ required: true, message: '请输入目录名称' }]"
        has-feedback>
        <a-input v-model:value="form.name" placeholder="请输入目录名称" />
      </a-form-item>
      <a-form-item
          label="目录类型"
          name="type"
          :rules="[{ required: true, message: '请选择目录类型' }]"
          has-feedback>
        <a-select v-model:value="form.type" placeholder="请选择目录类型">
          <a-select-option v-for="item in appStore.dictItems('biz_data_directory_type')" :key="item.value" :value="item.value">
            {{ item.name }}
          </a-select-option>
        </a-select>
      </a-form-item>
      <a-form-item
          name="sort"
          label="排序"
          :rules="[
          { required: true, message: '请输入排序' }
        ]"
          has-feedback
      >
        <a-input-number
            style="width: 100%"
            v-model:value="form.sort"
            placeholder="请输入排序"
        />
      </a-form-item>
      <a-form-item
          name="description"
          label="描述"
          has-feedback
      >
        <a-textarea v-model:value="form.description" placeholder="请输入描述" :rows="4" />
      </a-form-item>
    </a-form>
  </a-modal>
</template>

<script setup>
import { Tree, Add, Edit } from '@/api/main/dataDirectory'
import { Tree as OrgTree } from '@/api/org/org'
import { message } from 'ant-design-vue'

import { useAppStore } from '@/store/app'
const appStore = useAppStore()
const labelCol = reactive({ span: 5, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })

const fieldNames = {
  label: 'name',
  value: 'id',
  key: 'id'
}

const visible = ref(false)
const confirmLoading = ref(false)
const flag = ref(true)
const treeData = ref([])
const orgTreeData = ref([])
const form = ref({})
const formRef = ref()

const open = (flagVal, record) => {
  flag.value = flagVal
  visible.value = true
  form.value = record
}

onMounted(() => {
  loadTree()
  loadOrgTree()
})

const loadTree = () => {
  Tree({}).then(res => {
    treeData.value = [{
      name: 'root',
      id: 0,
      children: res.data
    }]
  })
}

const loadOrgTree = () => {
  OrgTree({}).then(res => {
    orgTreeData.value = res.data
  })
}

const handleOk = () => {
  confirmLoading.value = true
  formRef.value
    .validateFields()
    .then((values) => {
      if (flag.value) {
        handleAdd(values)
      } else {
        handleEdit(values)
      }
    })
    .catch((err) => {
      err.errorFields.forEach((msg) => {
        console.warn(msg.errors)
      })
    })
    .finally(() => {
      confirmLoading.value = false
    })
}

const emits = defineEmits(['ok'])

const handleAdd = (values) => {
  Add(values).then((res) => {
    if (res.success) {
      message.info(res.message)
      emits('ok')
      handleCancel()
    }
  })
}

const handleEdit = (values) => {
  Edit(values).then((res) => {
    if (res.success) {
      message.info(res.message)
      emits('ok')
      handleCancel()
    }
  })
}

const handleCancel = () => {
  visible.value = false
  form.value = {}
}


defineExpose({
  open
})
</script>
