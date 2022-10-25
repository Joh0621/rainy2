<template>
  <a-drawer
      v-model:visible="visible"
      class="custom-class"
      style="color: red"
      title="修改密码"
      placement="right"
  >
    <a-spin :spinning="spinning">
      <a-form
          ref="formRef"
          :model="form"
          :label-col="labelCol"
          :wrapper-col="wrapperCol">
        <a-form-item
            label="原密码"
            name="oldPassword"
            :rules="[ { required: true, message: '请输入原密码' }]"
            has-feedback>
          <a-input-password v-model:value="form.oldPassword" placeholder="请输入原密码"/>
        </a-form-item>
        <a-form-item
            label="新密码"
            name="password"
            :rules="[ { required: true, message: '请输入新密码' }]"
            has-feedback>
          <a-input-password v-model:value="form.password" placeholder="请输入新密码"/>
        </a-form-item>
        <a-form-item
            label="确认密码"
            name="confirmPassword"
            :rules="[ { required: true, message: '请输入确认密码' }]"
            has-feedback>
          <a-input-password v-model:value="form.confirmPassword" placeholder="请输入确认密码"/>
        </a-form-item>
        <a-form-item>
          <a-row>
            <a-col :offset="8">
              <a-button @click="updatePassword" type="primary">确定</a-button>
            </a-col>
          </a-row>
        </a-form-item>
      </a-form>
    </a-spin>
  </a-drawer>
</template>

<script setup>
import { message } from 'ant-design-vue'
import { UpdatePassword } from '@/api/permission/user'

const visible = ref(false)
const spinning = ref(false)
const labelCol = reactive({ span: 6, offset: 0 })
const wrapperCol = reactive({ span: 18, offset: 0 })
const form = ref({})
const open = (uname) => {
  visible.value = true
  form.value.username = uname
}

const formRef = ref()
const updatePassword = () => {
  formRef.value
    .validateFields()
    .then((values) => {
      spinning.value = true
      UpdatePassword(values).then(res => {
        if (res.success) {
          message.info(res.message)
          visible.value = false
        }
      })
    })
    .catch((err) => {
      err.errorFields.forEach((msg) => {
        console.warn(msg.errors)
      })
    })
    .finally(() => {
      setTimeout(() => {
        spinning.value = false
      }, 200)
    })
}
defineExpose({
  open
})
</script>

<style lang="less" scoped>
</style>
