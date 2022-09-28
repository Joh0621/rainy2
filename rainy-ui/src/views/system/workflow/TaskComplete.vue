<template>
  <a-modal
    v-model:visible="visible"
    :title="'任务审批'"
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
      <a-form-item v-show="false" name="taskId"></a-form-item>
      <a-form-item
        name="approved"
        label="是否同意"
        :rules="[
          { required: true, message: '请选择是否同意' }
        ]"
        has-feedback
      >
        <a-radio-group
          v-model:value="form.approved">
          <a-radio :value="true">同意</a-radio>
          <a-radio :value="false">不同意</a-radio>
        </a-radio-group>
      </a-form-item>
      <a-form-item
        name="remarks"
        label="审批意见"
        :rules="[
          { required: true, message: '请输入审批意见' }
        ]"
        has-feedback
      >
        <a-textarea v-model:value="form.remarks" placeholder="请输入审批意见" :rows="4" />
      </a-form-item>
    </a-form>
  </a-modal>
</template>
<script setup>
import { CompleteTask } from '@/api/workflow/workflow'
import { message } from 'ant-design-vue'

const labelCol = reactive({ span: 5, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })
const formRef = ref()

const visible = ref(false)
const confirmLoading = ref(false)
const form = ref({})

const open = (record) => {
  visible.value = true
  form.value.taskId = record.id
  form.value.approved = true
}

const handleOk = () => {
  confirmLoading.value = true
  formRef.value
    .validateFields()
    .then((values) => {
      completeTask(values)
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
const completeTask = (values) => {
  CompleteTask(values).then((res) => {
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
