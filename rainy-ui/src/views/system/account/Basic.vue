<template>
  <a-form :model="formState" :label-col="labelCol" :wrapper-col="wrapperCol">
    <a-form-item label="账号">
      <a-input :disabled="true" v-model:value="formState.username" />
    </a-form-item>
    <a-form-item label="昵称">
      <a-input v-model:value="formState.nickName" />
    </a-form-item>
    <a-form-item label="手机号">
      <a-input v-model:value="formState.telephone" />
    </a-form-item>
    <a-form-item label="邮箱">
      <a-input v-model:value="formState.email" />
    </a-form-item>
    <a-form-item :wrapper-col="{ span: 14, offset: 2 }">
      <a-button type="primary" @click="onSubmit">更新基本信息</a-button>
    </a-form-item>
  </a-form>
</template>

<script setup>
import { useUserStore } from '@/store/user'
const userStore = useUserStore()
// const form = ref(userStore.userinfo)

const formState = reactive(userStore.userinfo)

const labelCol = {
  style: {
    width: '68px'
  }
}
const wrapperCol = {
  span: 14
}
const onSubmit = () => {
  // console.log('submit!', toRaw(formState))
}
</script>

<style lang="less" scoped>
</style>
