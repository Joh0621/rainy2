<template>
  <div class="login-box">
    <a-form
        class="user-layout-login"
        :model="formState"
        name="basic"
        :label-col="{ span: 8 }"
        :wrapper-col="{ span: 6 }"
        autocomplete="off"
        @finish="onFinish"
        @finishFailed="onFinishFailed"
    >
      <a-form-item label="账号" name="username" :rules="[{ required: true, message: '请输入账号!' }]">
        <a-input v-model:value="formState.username" />
      </a-form-item>
      <a-form-item
          label="密码"
          name="password"
          current-password
          :rules="[{ required: true, message: '请输入密码!' }]"
      >
        <a-input-password v-model:value="formState.password" />
      </a-form-item>
      <a-form-item name="remember" :wrapper-col="{ offset: 8, span: 16 }">
        <a-checkbox v-model:checked="formState.remember">记住我</a-checkbox>
      </a-form-item>
      <a-form-item :wrapper-col="{ offset: 8, span: 16 }">
        <a-button style="width: 354px" type="primary" html-type="submit">登录</a-button>
      </a-form-item>
    </a-form>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { message } from 'ant-design-vue'
const router = useRouter()
const formState = reactive({
  username: '',
  password: '',
  remember: false
})
const onFinish = (values) => {
  // console.log('Success:', values)
  if (values.username === 'admin' && values.password === '!QAZxsw@') {
    localStorage.setItem('Access-Token', '1')
    router.replace({ path: '/' })
  } else {
    message.error('账号或密码错误！')
  }
}

const onFinishFailed = (errorInfo) => {
  console.log('Failed:', errorInfo)/**/
}
</script>
<style lang="less">
.login-box {
  margin-top: 100px;
}
</style>
