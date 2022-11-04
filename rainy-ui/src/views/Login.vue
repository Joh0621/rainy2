<template>
  <div class="login_background">
    <div class="login_wrap">
       <div class="left_wrap">
         <div class="logo_img">电科院数据门户</div>
<!--          <img src="/img/logo.png" class="logo_img"/>-->
       </div>
       <div class="right_wrap">
           <div class="login_main">
            <div class="login-form">
              <div class="login-form-wrap">
                <div class="login-header">
                  <div class="logo">
                    <img :alt="sys.title" :src="sys.logo" />
                    <label>{{ sys.title }}</label>
                    <component :is="'user-outlined'" class="xn-icons" />
                  </div>
                </div>
                <img src="/img/login_tip.png" class="login_tip"/>
              <a-form :model="form" @finish="onFinish" @finishFailed="onFinishFailed" autocomplete="off">
                <a-form-item name="username" :rules="[{ required: true, message: '请输入用户名' }]">
                  <a-alert v-if="errMessage" style="margin-bottom: 8px;height:30px;" :message="errMessage" type="error" show-icon />
                  <div v-if="!errMessage" style="margin-bottom: 8px;height:30px;">&nbsp;</div>
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
                  <a href="/" class="forget_password">忘记密码?</a>
                </a-form-item>
                <a-form-item>
                  <a-button style="width: 100%; background: #205986; border-color:#205986;border-radius:25px;" size="large" type="primary" html-type="submit">登录</a-button>
                </a-form-item>
              </a-form>
            </div>
            </div>
          </div>
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
import { defaultConfig } from '@/config/defaultConfig'

const router = useRouter()
const userStore = useUserStore()
const appStore = useAppStore()

const sys = ref({
  title: appStore.config.sysTitle || defaultConfig.title,
  logo: appStore.config.sysLogo || defaultConfig.logo
})

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
    }, 1000)
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
  background-image: url(/img/login_background.png);
}

.login_wrap{
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width:1000px;
  height:500px;
  position:absolute;
}
.left_wrap{
  width:620px;
  height:100%;
  float:left;
  overflow: hidden;
  background-position: center;
  background-image: url(/img/left_background.png);
  background-size: 170%;
  background-repeat: no-repeat;
  position: absolute;
  left:15px;
  z-index:-998;
}
.logo_img{
  width: 100%;
  height: auto;
  position:absolute;
  top:60px;
  text-align: center;
  font-weight:600;
  font-size: 40px;
  color: #205985;
}
.login_tip{
  width:40px;
  height:auto;
  position: absolute;
  top:100px;
  left:60px;
}
.right_wrap{
  width:520px;
  height:100%;
  overflow: hidden;
  background-position: center;
  background-image: url(/img/right_background.png);
  background-size: 160%;
  background-repeat: no-repeat;
  position: absolute;
  top:16px;
  left:580px;
  z-index:-999;
}
.forget_password{
  color: #666666;
  float:right;
}
.ant-input-affix-wrapper{
  border: 0px solid #d9d9d9;
  border-bottom-color: #666666;
  border-bottom-width: 1px;
  border-radius: 2px;
  background:rgba(255,0,0,0);
}

.ant-input-affix-wrapper-focused, .ant-input-affix-wrapper:focus{
  box-shadow: 0 0 0 0px var(--ant-primary-color-outline);
  border-right-width:0px!important;
}
.ant-input-affix-wrapper:not(.ant-input-affix-wrapper-disabled):hover {
  border-bottom-color: #666666;
  border-bottom-width: 1px;
  border-right-width: 0px!important;
  z-index: 1;
}
:deep(.ant-input){
  background-color: rgba(255,0,0,0);
}
.ant-form-item-has-error :not(.ant-input-affix-wrapper-disabled):not(.ant-input-affix-wrapper-borderless).ant-input-affix-wrapper{
  background-color:rgba(255,0,0,0);
}
.ant-form-item-has-error :not(.ant-input-affix-wrapper-disabled):not(.ant-input-affix-wrapper-borderless).ant-input-affix-wrapper:focus{
  border:0px;
  box-shadow:0 0 0 0px var(--ant-primary-color-outline);
  border-right-width:0px!important;
}
:deep(.ant-form-item-has-error) :not(.ant-input-disabled):not(.ant-input-borderless).ant-input, .ant-form-item-has-error :not(.ant-input-disabled):not(.ant-input-borderless).ant-input:hover{
  background-color:rgba(255,0,0,0);
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
  margin-top:100px;
  overflow: auto;
  display: flex;
}
.login-form {
  /*top: 15%;
  right: 15%;
  position: absolute;*/
  width: 260px;
  margin-left: 15%;
  margin-top: 20px;
  padding: 10px 0;
}
.login-header {
  margin-bottom: 20px;
  display:none;
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
