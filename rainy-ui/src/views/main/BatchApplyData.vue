<template>
  <a-modal
      v-model:visible="visible"
      :title="'批量申请'"
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
      <a-form-item
          label="设备名称"
          has-feedback
      >
        <a-input :disabled="true" v-model:value="record.name" />
      </a-form-item>
      <a-form-item
          name="remarks"
          label="数据用途"
          :rules="[{ required: true, message: '请输入数据用途' }]"
          has-feedback
      >
        <a-textarea v-model:value="form.remarks" placeholder="请输入数据用途" :rows="4" />
      </a-form-item>
    </a-form>
  </a-modal>
</template>
<script setup>
import { Apply } from '@/api/main/dataApply.js'
import { message } from 'ant-design-vue'

const labelCol = reactive({ span: 4, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })

// 是否是新增: true 新增，false 编辑，默认新增
const visible = ref(false)
const confirmLoading = ref(false)
const record = ref({})
const form = ref({})
const formRef = ref({})

const open = (recordValue) => {
  visible.value = true
  record.value = recordValue
  console.log(recordValue)
}

const handleOk = () => {
  apply()
}

const apply = () => {
  confirmLoading.value = true
  formRef.value
    .validateFields()
    .then((values) => {
      const param = {
        device: record.value,
        remarks: values.remarks,
        dataType: 0
      }
      Apply(param).then(res => {
        if (res.success) {
          message.info('申请成功')
          handleCancel()
        }
      })
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

const handleCancel = () => {
  visible.value = false
  emits('ok')
}

defineExpose({
  open
})
</script>
