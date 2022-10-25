<template>
  <a-form ref="formRef" :model="form" :label-col="labelCol" :wrapper-col="wrapperCol">
    <a-form-item v-show="false" name="id"></a-form-item>
    <a-form-item
        name="username"
        label="账号"
        :rules="[{ required: true, message: '请输入账号' }]"
        has-feedback
    >
      <a-input :disabled="true" v-model:value="form.username" />
    </a-form-item>
    <a-form-item
        name="nickName"
        label="昵称"
        :rules="[{ required: true, message: '请输入昵称' }]"
        has-feedback
    >
      <a-input v-model:value="form.nickName" />
    </a-form-item>
    <a-form-item
        name="birthday"
        label="生日"
        :rules="[{ required: true, message: '请输入生日' }]"
        has-feedback
    >
      <a-date-picker v-model:value="form.birthday" :value-format="'YYYY-MM-DD'" :format="'YYYY-MM-DD'" placeholder="请输入生日" />
    </a-form-item>
    <a-form-item
        name="telephone"
        label="手机号"
        :rules="[{ pattern: /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/, required: true, message: '请输入正确的11位手机号' }]"
        has-feedback
    >
      <a-input v-model:value="form.telephone" />
    </a-form-item>
    <a-form-item
        name="email"
        label="邮箱"
        :rules="[{ type: 'email', required: true, message: '请输入正确格式的邮箱' }]"
        has-feedback
    >
      <a-input v-model:value="form.email" placeholder="请输入邮箱"/>
    </a-form-item>
    <a-form-item :wrapper-col="{ span: 14, offset: 2 }">
      <a-button type="primary" @click="onSubmit">更新基本信息</a-button>
    </a-form-item>
  </a-form>
</template>

<script setup>
// import dayjs from 'dayjs'
import { useUserStore } from '@/store/user'
import { UpdateUserinfo } from '@/api/permission/user'
import { message } from 'ant-design-vue'

const userStore = useUserStore()

const labelCol = {
  style: {
    width: '68px'
  }
}
const wrapperCol = {
  span: 14
}

const form = ref({
  id: userStore.userinfo.id,
  username: userStore.userinfo.username,
  nickName: userStore.userinfo.nickName,
  birthday: userStore.userinfo.birthday,
  telephone: userStore.userinfo.telephone,
  email: userStore.userinfo.email
})

const loading = ref(false)
const formRef = ref()
const onSubmit = () => {
  loading.value = true
  formRef.value
    .validateFields()
    .then((values) => {
      // values.birthday = values.birthday.format('YYYY-MM-DD')
      UpdateUserinfo(values).then(res => {
        if (res.success) {
          message.info(res.message)
          userStore.userinfo = {
            ...values
          }
        }
      })
    })
    .catch((err) => {
      console.log(err)
      err.errorFields.forEach((msg) => {
        console.warn(msg.errors)
      })
    })
    .finally(() => {
      loading.value = false
    })
}
</script>

<style lang="less" scoped>
</style>
