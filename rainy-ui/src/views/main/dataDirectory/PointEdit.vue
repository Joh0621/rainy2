<template>
  <a-modal
    v-model:visible="visible"
    :title="(flag ? '新增' : '编辑') + '点码'"
    :confirm-loading="confirmLoading"
    :destroyOnClose="false"
    :maskClosable="false"
    :forceRender="true"
    @ok="handleOk"
    @cancel="handleCancel"
  >
    <a-form
      ref="formRef"
      layout="horizontal"
      :model="form"
      :label-col="labelCol"
      :wrapper-col="wrapperCol"
    >
      <a-form-item v-show="false" name="id"></a-form-item>
      <a-form-item
          label="数据目录"
          name="dataDirectoryId"
          :rules="[{ required: true, message: '请选择数据目录' }]"
          has-feedback>
        <a-tree-select
            v-model:value="form.dataDirectoryId"
            :fieldNames="fieldNames"
            placeholder="请选择数据目录"
            tree-default-expand-all
            :tree-data="treeData"
        ></a-tree-select>
      </a-form-item>
      <a-form-item
          name="deviceCode"
          label="设备编码"
          :rules="[{ required: true, message: '请输入设备编码!' }]"
          has-feedback
      >
        <a-input
            :disabled="!flag"
            v-model:value="form.deviceCode"
            placeholder="请输入设备编码！"
        />
      </a-form-item>
      <a-form-item
          name="code"
          label="数据点码"
          :rules="[{ required: true, message: '请输入数据点码!' }]"
          has-feedback
      >
        <a-input
            :disabled="!flag"
            v-model:value="form.code"
            placeholder="请输入数据点码！"
        />
      </a-form-item>
      <a-form-item
        name="name"
        label="数据点名"
        has-feedback
      >
        <a-textarea v-model:value="form.name" placeholder="请输入数据点名" :rows="4" />
      </a-form-item>
    </a-form>
  </a-modal>
</template>
<script setup>
import { Add, Edit } from '@/api/main/point'
import { message } from 'ant-design-vue'
import { Tree } from '@/api/main/dataDirectory'

const labelCol = reactive({ span: 5, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })

const fieldNames = {
  label: 'name',
  value: 'id',
  key: 'id'
}

// 是否是新增: true 新增，false 编辑，默认新增
const flag = ref(true)
const visible = ref(false)
const confirmLoading = ref(false)
const form = ref({})
const formRef = ref()
const treeData = ref([])

onMounted(() => {
  loadTree()
})

const loadTree = () => {
  Tree({}).then(res => {
    treeData.value = res.data
  })
}
const open = (flagValue, record) => {
  visible.value = true
  flag.value = flagValue
  form.value = record
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
      handleCancel()
    }
  })
}

const handleEdit = (values) => {
  Edit(values).then((res) => {
    if (res.success) {
      message.info(res.message)
      handleCancel()
    }
  })
}

const handleCancel = () => {
  visible.value = false
  emits('ok')
}

defineExpose({
  open
})
</script>
