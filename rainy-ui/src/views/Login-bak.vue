<template>
  <div class="login_background">
    <div class="login_background_front"></div>
    <div class="login_main">
      <div class="login_config">
        <a-dropdown>
          <global-outlined />
        </a-dropdown>
      </div>
      <div class="login-form">
        <a-card>
          <div class="login-header">
            <div class="logo">
              <img :alt="sys.title" :src="sys.logo" />
              <label>{{ sys.title }}</label>
              <component :is="'user-outlined'" class="xn-icons" />
            </div>
          </div>
          <a-tabs v-model:activeKey="activeKey">
            <a-tab-pane key="userAccount" tab="账号密码">
              <a-form :model="form" @finish="onFinish" @finishFailed="onFinishFailed" autocomplete="off">
                <a-form-item name="username" :rules="[{ required: true, message: '请输入用户名' }]">
                  <a-alert v-if="errMessage" style="margin-bottom: 8px;" :message="errMessage" type="error" show-icon />
                  <a-input v-model:value="form.username" size="large" placeholder="请输入用户名">
                    <template #prefix>
                      <UserOutlined style="color: rgba(0, 0, 0, 0.25)" />
                    </template>
                  </a-input>
                </a-form-item>
                <a-form-item name="password" :rules="[{ required: true, message: '请输入密码' }]">
                  <a-input-password v-model:value="form.password" size="large" placeholder="请输入密码">
                    <template #prefix>
                      <LockOutlined style="color: rgba(0, 0, 0, 0.25)" />
                    </template>
                  </a-input-password>
                </a-form-item>
                <a-form-item>
                  <a href="/" style="color: #0d84ff">忘记密码?</a>
                </a-form-item>
                <a-form-item>
                  <a-button style="width: 100%" size="large" type="primary" html-type="submit">登录</a-button>
                </a-form-item>
              </a-form>
            </a-tab-pane>
            <a-tab-pane key="userSms" :tab="'手机号登录'" force-render>
              <a-form ref="phoneLoginFormRef">
                <a-form-item name="phone">
                  <a-input  placeholder="请输入手机号" size="large">
                    <template #prefix>
                      <mobile-outlined style="color: rgba(0, 0, 0, 0.25)" />
                    </template>
                  </a-input>
                </a-form-item>
                <a-form-item name="phoneValidCode">
                  <a-row :gutter="8">
                    <a-col :span="17">
                      <a-input
                          placeholder="请输入验证码"
                          size="large"
                      >
                        <template #prefix>
                          <mail-outlined style="color: rgba(0, 0, 0, 0.25)" />
                        </template>
                      </a-input>
                    </a-col>
                    <a-col :span="7">
                      <a-button size="large" style="width: 100%">获取验证码</a-button>
                    </a-col>
                  </a-row>
                </a-form-item>
                <a-form-item>
                  <a-button type="primary" style="width: 100%" :loading="false" round size="large">登录</a-button>
                </a-form-item>
              </a-form>
            </a-tab-pane>
          </a-tabs>
          <three-login/>
        </a-card>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { useUserStore } from '../store/user'
import { useAppStore } from '../store/app'
import { notification } from 'ant-design-vue'
import { timeFix } from '../utils/Utils'
import ThreeLogin from './ThreeLogin.vue'
import { defaultConfig } from '@/config/defaultConfig.js'

const router = useRouter()
const userStore = useUserStore()
const appStore = useAppStore()

const sys = ref({
  title: appStore.config.sysTitle || defaultConfig.title,
  logo: appStore.config.sysLogo || defaultConfig.logo
})

const activeKey = ref('userAccount')
const form = reactive({
  username: '',
  password: ''
})

const errMessage = ref('')
const onFinish = (values) => {
  userStore.Login(values).then(res => {
    router.replace({ path: '/' })
    setTimeout(() => {
      notification.success({
        message: '欢迎',
        description: `${timeFix()}，欢迎回来`
      })
    }, 500)
  }).catch(err => {
    errMessage.value = err.message
  })
}

const onFinishFailed = (errorInfo) => {
  console.log('Failed:', errorInfo)/**/
}
</script>

<style lang="less" scoped>
.login_background {
  width: 100%;
  height: 100%;
  overflow: hidden;
  background-size: cover;
  background-position: center;
  background-image: url(/img/login/login_background.png);
}
.login_background_front {
  width: 450px;
  height: 450px;
  margin-left: 100px;
  margin-top: 15%;
  overflow: hidden;
  /*position: relative;*/
  background-size: cover;
  background-position: center;
  background-image: url(/img/login/login_background_front.png);
  animation-name: myfirst;
  animation-duration: 5s;
  animation-timing-function: linear;
  animation-delay: 1s;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-play-state: running;
  /* Safari and Chrome: */
  -webkit-animation-name: myfirst;
  -webkit-animation-duration: 5s;
  -webkit-animation-timing-function: linear;
  -webkit-animation-delay: 1s;
  -webkit-animation-iteration-count: infinite;
  -webkit-animation-direction: alternate;
  -webkit-animation-play-state: running;
}
@keyframes myfirst {
  0% {
    left: 0;
    top: 0;
  }
  50% {
    left: 50px;
    top: 0;
  }
  100% {
    left: 0;
    top: 0;
  }
}
@-webkit-keyframes myfirst /* Safari and Chrome */ {
  0% {
    left: 0;
    top: 0;
  }
  50% {
    left: 50px;
    top: 0;
  }
  100% {
    left: 0;
    top: 0;
  }
}
.login_adv__title h2 {
  font-size: 40px;
}
.login_adv__title h4 {
  font-size: 18px;
  margin-top: 10px;
  font-weight: normal;
}
.login_adv__title p {
  font-size: 14px;
  margin-top: 10px;
  line-height: 1.8;
  color: rgba(255, 255, 255, 0.6);
}
.login_adv__title div {
  margin-top: 10px;
  display: flex;
  align-items: center;
}
.login_adv__title div span {
  margin-right: 15px;
}
.login_adv__title div i {
  font-size: 40px;
}
.login_adv__title div i.add {
  font-size: 20px;
  color: rgba(255, 255, 255, 0.6);
}
/*background-image:linear-gradient(transparent, #000);*/
.login_main {
  flex: 1;
  overflow: auto;
  display: flex;
}
.login-form {
  top: 15%;
  right: 15%;
  position: absolute;
  width: 450px;
  margin-left: 10%;
  margin-top: 20px;
  padding: 10px 0;
}
.login-header {
  margin-bottom: 20px;
}
.login-header .logo {
  display: flex;
  align-items: center;
}
.login-header .logo img {
  width: 35px;
  height: 35px;
  vertical-align: bottom;
  margin-right: 10px;
}
.login-header .logo label {
  font-size: 24px;
}
.login-header h2 {
  font-size: 24px;
  font-weight: bold;
  margin-top: 40px;
}
.login_config {
  position: absolute;
  top: 20px;
  right: 20px;
}
@media (max-width: 1200px) {
  .login-form {
    width: 340px;
  }
}
@media (max-width: 1000px) {
  .login_main {
    display: block;
  }
  .login_background_front {
    display: none;
  }
  .login-form {
    width: 100%;
    padding: 20px 40px;
    right: 0 !important;
    top: 0 !important;
  }
}
</style>
