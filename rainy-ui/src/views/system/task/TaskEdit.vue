<template>
  <a-modal
    v-model:visible="visible"
    :title="(flag ? '新增' : '编辑') + '任务'"
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
        label="任务名称"
        :rules="[{ required: true, message: '请输入任务名称' }]"
        has-feedback
      >
        <a-input v-model:value="form.name" placeholder="请输入任务名称" />
      </a-form-item>
      <a-form-item
        name="category"
        label="任务分类"
        :rules="[{ required: true, message: '请选择分类' }]"
        has-feedback
      >
        <a-select v-model:value="form.category" placeholder="请选择分类">
          <a-select-option
            :key="item.value"
            v-for="item in appStore.dictItems('sys_task_category')"
            :value="item.value"
          >
            {{ item.name }}
          </a-select-option>
        </a-select>
      </a-form-item>
      <a-form-item
          name="cron"
          label="cron表达式"
          :rules="[{ required: true, message: '请输入cron表达式' }]"
          has-feedback
      >
        <a-input v-model:value="form.cron" placeholder="请输入cron表达式" />
      </a-form-item>
      <a-form-item
        name="className"
        label="class类"
        :rules="[{ required: true, message: '请选择class类' }]"
        has-feedback
      >
        <a-select v-model:value="form.className" placeholder="请选择class类">
          <a-select-option
            :key="item"
            v-for="item in classes"
            :value="item"
          >
            {{ item }}
          </a-select-option>
        </a-select>
      </a-form-item>
      <a-form-item
          name="status"
          label="状态"
          :rules="[ { required: true, message: '请选择任务状态' }]"
          has-feedback
      >
        <a-radio-group v-model:value="form.status">
          <a-radio
              v-for="item in appStore.dictItems('sys_task_status')"
              :key="item.value"
              :value="item.value"
          >{{ item.name }}</a-radio>
        </a-radio-group>
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
import { Add, Edit, ListClasses } from '@/api/system/task'
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
  loadClasses()
}

const classes = ref([])

const loadClasses = () => {
  ListClasses().then(res => {
    classes.value = res.data
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
