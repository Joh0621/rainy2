<template>
  <a-modal
    v-model:visible="visible"
    :title="(flag? '新增' : '编辑') + '职位'"
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
        name="name"
        label="职位名称"
        :rules="[{ required: true, message: '请输入职位名称!' }]"
        has-feedback
      >
        <a-input v-model:value="form.name" placeholder="请输入职位名称!" />
      </a-form-item>
      <a-form-item
        name="code"
        label="唯一编码"
        :rules="[{ required: true, message: '请输入唯一编码!' }]"
        has-feedback
      >
        <a-input
          :disabled="!flag"
          v-model:value="form.code"
          placeholder="请输入唯一编码！"
        />
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
          placeholder="请输入排序！"
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
import { Add, Edit } from '@/api/org/position'
import { message } from 'ant-design-vue'

const labelCol = reactive({ span: 5, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })

const form = ref({})
const formRef = ref()

// 是否是新增: true 新增，false 编辑，默认新增
const flag = ref(true)
// const title = ref((flag.value ? '新增' : '编辑') + '职位')
const visible = ref(false)
const confirmLoading = ref(false)

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

const emits = defineEmits(['ok'])
const handleCancel = () => {
  visible.value = false
  formRef.value.resetFields()
  emits('ok')
}

defineExpose({
  open
})
</script>
