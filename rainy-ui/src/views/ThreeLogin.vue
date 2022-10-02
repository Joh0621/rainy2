<template>
  <a-divider>第三方登录</a-divider>
  <div class="login-oauth">
    <a-space align="start">
      <a-button type="primary" shape="circle">
        <WechatOutlined/>
      </a-button>
    </a-space>
  </div>
</template>

<script setup>
import { WechatOutlined } from '@ant-design/icons-vue'
</script>

<style scoped>
.login-oauth {
  display: flex;
  justify-content: center;
}
</style>
