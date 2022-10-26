<template>
  <a-spin :spinning="loading">
    <a-form ref="formRef" :model="form" :label-col="labelCol" :wrapper-col="wrapperCol">
      <a-form-item v-show="false" name="id"></a-form-item>
<!--      <a-form-item-->
<!--          name="username"-->
<!--          label="账号"-->
<!--          :rules="[{ required: true, message: '请输入账号' }]"-->
<!--          has-feedback-->
<!--      >-->
<!--        {{ form.username }}-->
<!--      </a-form-item>-->
      <a-form-item
          name="nickName"
          label="姓名"
          has-feedback
      >
        {{ form.nickName }}
      </a-form-item>
      <a-form-item
          name="org"
          label="部门"
          has-feedback
      >
        {{ form.org }}
      </a-form-item>
<!--      <a-form-item-->
<!--          name="birthday"-->
<!--          label="生日"-->
<!--          :rules="[{ required: true, message: '请输入生日' }]"-->
<!--          has-feedback-->
<!--      >-->
<!--        <a-date-picker v-model:value="form.birthday" :value-format="'YYYY-MM-DD'" :format="'YYYY-MM-DD'" placeholder="请输入生日" />-->
<!--      </a-form-item>-->
      <a-form-item
          name="phoneNumber"
          label="手机号"
          :rules="[{ pattern: /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/, required: true, message: '请输入正确的11位手机号' }]"
          has-feedback
      >
        <a-input v-model:value="form.phoneNumber" placeholder="请输入手机号" />
      </a-form-item>
      <a-form-item
          name="telephone"
          label="座机"
          :rules="[ {required: true, message: '请输入座机' }]"
          has-feedback
      >
        <a-input v-model:value="form.telephone" placeholder="请输入座机" />
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
  </a-spin>
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
  org: userStore.userinfo.org,
  birthday: userStore.userinfo.birthday,
  phoneNumber: userStore.userinfo.phoneNumber,
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
      err.errorFields.forEach((msg) => {
        console.warn(msg.errors)
      })
    })
    .finally(() => {
      setTimeout(() => {
        loading.value = false
      }, 200)
    })
}
</script>

<style lang="less" scoped>
</style>
