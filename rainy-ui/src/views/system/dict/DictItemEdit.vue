<template>
  <a-modal
    v-model:visible="visible"
    :title="(flag ? '新增' : '编辑') + '字典项'"
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
          name="dictCode"
          label="所属字典"
          :rules="[{ required: true, message: '请选择所属字典' }]"
          has-feedback
      >
        <a-select v-model:value="form.dictCode" placeholder="请选择所属字典">
          <a-select-option
              v-for="item in appStore.dicts()"
              :key="item.dictCode"
              :value="item.dictCode"
          >
            {{ item.name }}
          </a-select-option>
        </a-select>
      </a-form-item>
      <a-form-item
        name="code"
        label="字典项编码"
        :rules="[{ required: true, message: '请输入字典项编码' }]"
        has-feedback
      >
        <a-input
          :disabled="!flag"
          v-model:value="form.code"
          placeholder="请输入字典项编码"
        />
      </a-form-item>
      <a-form-item
          name="value"
          label="字典项值"
          :rules="[{ required: true, message: '请输入字典项值' }]"
          has-feedback
      >
        <a-input v-model:value="form.value" placeholder="请输入字典项值" />
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
import { Add, Edit } from '@/api/system/dictItem'
import { message } from 'ant-design-vue'
import { useAppStore } from '@/store/app'

const appStore = useAppStore()

const labelCol = reactive({ span: 5, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })
const formRef = ref()

// 是否是新增: true 新增，false 编辑，默认新增
const flag = ref(true)
const visible = ref(false)
const confirmLoading = ref(false)
const form = ref({})

const open = (flagValue, record) => {
  visible.value = true
  console.log(record)
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
      // 更新
      appStore.Common()
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
