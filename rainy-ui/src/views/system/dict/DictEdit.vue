<template>
  <a-modal
    v-model:visible="visible"
    :title="(flag ? '新增' : '编辑') + '字典'"
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
        label="字典名称"
        :rules="[{ required: true, message: '请输入字典名称' }]"
        has-feedback
      >
        <a-input v-model:value="form.name" placeholder="请输入字典名称" />
      </a-form-item>
      <a-form-item
        name="code"
        label="唯一编码"
        :rules="[{ required: true, message: '请输入唯一编码' }]"
        has-feedback
      >
        <a-input
          :disabled="!flag"
          v-model:value="form.code"
          placeholder="请输入唯一编码"
        />
      </a-form-item>
      <a-form-item
        name="categoryCode"
        label="字典分类"
        :rules="[{ required: true, message: '请选择分类' }]"
        has-feedback
      >
        <a-select v-model:value="form.categoryCode" placeholder="请选择分类">
          <a-select-option
            :key="item.value"
            v-for="item in appStore.dictItems('sys_dict_category')"
            :value="item.value"
          >
            {{ item.name }}
          </a-select-option>
        </a-select>
      </a-form-item>
      <a-form-item
        name="dataType"
        label="数据类型"
        :rules="[{ required: true, message: '请选择数据类型' }]"
        has-feedback
      >
        <a-select v-model:value="form.dataType" placeholder="请选择数据类型">
          <a-select-option
            :key="item.value"
            v-for="item in appStore.dictItems('sys_data_type')"
            :value="item.value"
          >
            {{ item.name }}
          </a-select-option>
        </a-select>
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
import { Add, Edit } from '@/api/system/dict'
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
