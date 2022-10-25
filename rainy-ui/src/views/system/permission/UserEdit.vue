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
        :rules="[{ required: true, message: '请输入用户名' }]"
        has-feedback
      >
        <a-input :disabled="!flag" v-model:value="form.username" placeholder="请输入用户名" allow-clear>
          <template #prefix>
            <UserOutlined style="color: rgba(0, 0, 0, 0.25)" />
          </template>
        </a-input>
      </a-form-item>
      <a-form-item
          name="password"
          label="密码"
          :rules="[{ required: true, message: '请输入密码' }]"
          has-feedback
      >
        <a-input-password type="password" v-model:value="form.password" autocomplete="off" placeholder="请输入密码">
          <template #prefix>
            <LockOutlined style="color: rgba(0, 0, 0, 0.25)" />
          </template>
        </a-input-password>
      </a-form-item>
      <a-form-item
          name="nickName"
          label="昵称"
          :rules="[{ required: true, message: '请输入昵称' }]"
          has-feedback
      >
        <a-input v-model:value="form.nickName" placeholder="请输入昵称" />
      </a-form-item>
      <a-form-item
          name="birthday"
          label="生日"
          :rules="[{ required: true, message: '请输入生日' }]"
          has-feedback
      >
        <a-date-picker v-model:value="form.birthday" :format="'YYYY-MM-DD'" placeholder="请输入生日" />
      </a-form-item>
      <a-form-item
          name="telephone"
          label="手机号"
          :rules="[{ pattern: /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/, required: true, message: '请输入正确的11位手机号' }]"
          has-feedback
      >
        <a-input v-model:value="form.telephone" placeholder="请输入手机号" />
      </a-form-item>
      <a-form-item
          name="email"
          label="邮箱"
          :rules="[{ type: 'email', required: true, message: '请输入正确格式的邮箱' }]"
          has-feedback
      >
        <a-input v-model:value="form.email" placeholder="请输入邮箱" />
      </a-form-item>
      <a-form-item
        name="orgId"
        label="组织"
        :rules="[{ required: true, message: '请选择组织' }]"
        has-feedback
      >
        <a-tree-select
          v-model:value="form.orgId"
          :fieldNames="fieldNames"
          placeholder="请选择组织"
          tree-default-expand-all
          :tree-data="treeData"
          showSearch
          treeNodeFilterProp="name"
        >
        </a-tree-select>
      </a-form-item>
      <a-form-item
          name="positionId"
          label="职位"
          :rules="[{ required: false, message: '请输入职位' }]"
          has-feedback
      >
        <a-input v-model:value="form.positionId" placeholder="请输入职位" />
      </a-form-item>
    </a-form>
  </a-modal>
</template>
<script setup>
import { Tree } from '@/api/org/org'
import { Add, Edit } from '@/api/permission/user'
import { message } from 'ant-design-vue'
import dayjs from 'dayjs'

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
    treeData.value = res.data
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
  if (!flagValue) {
    form.value.birthday = dayjs(record.birthday)
  } else {
    form.value.birthday = dayjs()
  }
}

const handleOk = () => {
  confirmLoading.value = true
  formRef.value
    .validateFields()
    .then((values) => {
      values.birthday = values.birthday.format('YYYY-MM-DD')
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
