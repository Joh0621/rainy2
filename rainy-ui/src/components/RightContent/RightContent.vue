<template>
  <div style="margin-right: 12px">
    <a-space size="small">
      <span>
        <a-badge :count="11" title="title">
          <bell-outlined style="font-size: 16px; padding: 4px" />
        </a-badge>
      </span>
      <a style="padding: 0 12px; display: inline-block; user-select: none" @click="handleClick"><BgColorsOutlined /></a>
      <a-dropdown>
        <template #overlay>
          <a-menu>
            <a-menu-item>
              <template #icon>
                <SettingOutlined />
              </template>
              <span>个人设置</span>
            </a-menu-item>
            <a-menu-item>
              <template #icon>
                <LogoutOutlined />
              </template>
              <span @click="logout">退出登录</span>
            </a-menu-item>
          </a-menu>
        </template>
        <span class="ant-pro-account-avatar">
          <a-avatar size="small" :src="avatar" class="antd-pro-global-header-index-avatar" />
          <span>{{ nickName }}</span>
        </span>
      </a-dropdown>
    </a-space>
  </div>
</template>

<script setup>
import { SettingOutlined, LogoutOutlined, BgColorsOutlined, BellOutlined } from '@ant-design/icons-vue'

import { apply, randomTheme } from '@/hooks/useTheme'
import { Modal } from 'ant-design-vue'

defineProps({
  nickName: {
    default: ''
  },
  avatar: {
    default: ''
  }
})

const logout = () => {
  Modal.confirm({
    title: '退出登录',
    content: '确认退出登录吗?',
    okText: '确认',
    cancelText: '取消',
    onOk () {
      localStorage.removeItem('Access-Token')
      location.reload()
    },
    onCancel () {}
  })
}
const handleClick = () => {
  apply(randomTheme())
}
</script>
<style lang="less" scoped>
.ant-account-avatar {
  cursor: pointer;
  text-align: center;
}
</style>
