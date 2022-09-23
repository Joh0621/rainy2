<template>
  <a-divider />
  <a-form
      :model="formState"
      name="basic"
      :label-col="{ span: 8 }"
      :wrapper-col="{ span: 6 }"
      autocomplete="off"
      @finish="onFinish"
      @finishFailed="onFinishFailed"
  >
    <a-form-item label="Username" name="username" :rules="[{ required: true, message: 'Please input your username!' }]">
      <a-input v-model:value="formState.username" />
    </a-form-item>

    <a-form-item
        label="Password"
        name="password"
        current-password
        :rules="[{ required: true, message: 'Please input your password!' }]"
    >
      <a-input-password v-model:value="formState.password" />
    </a-form-item>

    <a-form-item name="remember" :wrapper-col="{ offset: 8, span: 16 }">
      <a-checkbox v-model:checked="formState.remember">Remember me</a-checkbox>
    </a-form-item>

    <a-form-item :wrapper-col="{ offset: 8, span: 16 }">
      <a-button type="primary" html-type="submit">Submit</a-button>
    </a-form-item>
  </a-form>
  <div>
    <div ref="container" style="height: 200px" />
  </div>
</template>
<script setup>
import { useRouter } from 'vue-router'
const router = useRouter()
const formState = reactive({
  username: '',
  password: '',
  remember: true
})
const onFinish = (values) => {
  // console.log('Success:', values)
  localStorage.setItem('Access-Token', '1')
  router.replace({ path: '/' })
}

const onFinishFailed = (errorInfo) => {
  console.log('Failed:', errorInfo)/**/
}
</script>
