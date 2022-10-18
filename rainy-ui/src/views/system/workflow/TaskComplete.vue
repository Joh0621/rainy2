<template>
  <a-modal
    v-model:visible="visible"
    :title="'任务审批'"
    :width="600"
    :confirm-loading="confirmLoading"
    :destroyOnClose="false"
    :maskClosable="false"
    :forceRender="true"
    @ok="handleOk"
    @cancel="handleCancel"
  >
    <a-descriptions style="margin-left: 12px;" title="设备信息">
      <a-descriptions-item label="设备名称">{{ record.name }}</a-descriptions-item>
      <a-descriptions-item label="所属场站">{{ record.dataDirectoryName }}</a-descriptions-item>
      <a-descriptions-item label="测点数量">{{ record.pointCount }}</a-descriptions-item>
      <a-descriptions-item label="申请人">{{ record.startBy }}</a-descriptions-item>
      <a-descriptions-item label="描述">{{ record.description }}</a-descriptions-item>
    </a-descriptions>
    <a-divider/>
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
          <a-radio :value="1">同意</a-radio>
          <a-radio :value="2">不同意</a-radio>
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
import { DetailById } from '@/api/main/device'
import { message } from 'ant-design-vue'

const labelCol = reactive({ span: 4, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })
const formRef = ref()

const visible = ref(false)
const confirmLoading = ref(false)
const form = ref({})
const record = ref({})

const open = (recordValue) => {
  visible.value = true
  form.value.taskId = recordValue.id
  form.value.approved = 1
  if (recordValue.variables.dataType === 0) {
    DetailById(recordValue.variables.dataId).then(res => {
      record.value = res.data
      record.value.startBy = recordValue.startBy
    })
  }
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
  form.value = {}
  emits('ok')
}

defineExpose({
  open
})
</script>
<style lang="less" scoped>
.ant-divider-horizontal {
  margin-top: 12px
}
</style>
