<template>
  <a-dropdown>
        <span class="account-avatar" style="display: inline-block">
          <a-avatar size="small" style="background-color: #f56a00" class="avatar">
            {{ userStore.userinfo.username }}
          </a-avatar>
          <span>{{ userStore.nickName }}</span>
        </span>
    <template #overlay>
      <a-menu>
        <a-menu-item>
          <template #icon>
            <SettingOutlined />
          </template>
          <router-link :to="accountCenterPath">
            <span>个人设置</span>
          </router-link>
        </a-menu-item>
        <a-menu-divider />
        <a-menu-item>
          <template #icon>
            <LogoutOutlined />
          </template>
          <span @click="logout">退出登录</span>
        </a-menu-item>
      </a-menu>
    </template>
  </a-dropdown>
</template>

<script setup>
import { Modal } from 'ant-design-vue'
import { useUserStore } from '@/store/user'

const userStore = useUserStore()
const accountCenterPath = '/account/center'

const logout = () => {
  Modal.confirm({
    title: '退出登录',
    content: '确认退出登录吗?',
    okText: '确认',
    cancelText: '取消',
    onOk () {
      userStore.Logout({}).then(res => {
        location.reload()
      })
    },
    onCancel () {}
  })
}
</script>

<style lang="less" scoped>
.account-avatar {
  .avatar {
    text-align: center;
    margin-right: 4px;
    background: rgba(255, 255, 255, 0.85);
  }
}
</style>
