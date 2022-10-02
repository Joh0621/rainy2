<template>
  <a-modal
    v-model:visible="visible"
    :title="(flag ? '新增' : '编辑') + '用户'"
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
        name="username"
        label="用户名"
        :rules="[{ required: true, message: '请输入用户名称!' }]"
        has-feedback
      >
        <a-input v-model:value="form.username" placeholder="请输入用户名称!" />
      </a-form-item>
      <a-form-item
          name="password"
          label="密码"
          :rules="[{ required: true, message: '请输入密码!' }]"
          has-feedback
      >
        <a-input type="password" v-model:value="form.password" placeholder="请输入密码!" />
      </a-form-item>
      <a-form-item
          name="nickName"
          label="昵称"
          :rules="[{ required: true, message: '请输入昵称!' }]"
          has-feedback
      >
        <a-input v-model:value="form.nickName" placeholder="请输入昵称!" />
      </a-form-item>
      <a-form-item
          name="birthday"
          label="生日"
          :rules="[{ required: true, message: '请输入生日!' }]"
          has-feedback
      >
        <a-input v-model:value="form.birthday" placeholder="请输入生日!" />
      </a-form-item>
      <a-form-item
          name="telephone"
          label="手机号"
          :rules="[{ required: true, message: '请输入手机号!' }]"
          has-feedback
      >
        <a-input v-model:value="form.telephone" placeholder="请输入手机号!" />
      </a-form-item>
      <a-form-item
          name="email"
          label="邮箱"
          :rules="[{ required: true, message: '请输入邮箱!' }]"
          has-feedback
      >
        <a-input v-model:value="form.email" placeholder="请输入邮箱!" />
      </a-form-item>
      <a-form-item
        name="orgId"
        label="组织"
        :rules="[{ required: true, message: '请选择组织!' }]"
        has-feedback
      >
        <a-tree-select
          v-model:value="form.parentId"
          :fieldNames="fieldNames"
          placeholder="请选择组织"
          tree-default-expand-all
          :tree-data="treeData"
        >
        </a-tree-select>
      </a-form-item>
      <a-form-item
          name="parentId"
          label="职位"
          :rules="[{ required: true, message: '请输入职位!' }]"
          has-feedback
      >
        <a-input v-model:value="form.position" placeholder="请输入职位!" />
      </a-form-item>
    </a-form>
  </a-modal>
</template>
<script setup>
import { Add, Edit, Tree } from '@/api/org/org'
import { message } from 'ant-design-vue'

const labelCol = reactive({ span: 5, offset: 0 })
const wrapperCol = reactive({ span: 16, offset: 0 })

const form = ref({})
const formRef = ref()

const fieldNames = {
  label: 'name',
  value: 'id',
  key: 'id'
}
const treeData = ref([])
onMounted(() => {
  Tree({}).then(res => {
    treeData.value = [{
      name: 'root',
      id: 0,
      children: res.data
    }]
  })
})

// 是否是新增: true 新增，false 编辑，默认新增
const flag = ref(true)
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
  formRef.value.resetFields()
  emits('ok')
}

defineExpose({
  open
})
</script>
