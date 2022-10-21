<template>
  <span class="header-item">
    <notice-icon/>
  </span>
  <span class="header-item">
    <a @click="handleClick"><BgColorsOutlined /> </a>
  </span>
  <span class="header-item">
    <avatar-dropdown />
  </span>
</template>

<script setup>
import NoticeIcon from '@/components/RightContent/NoticeIcon.vue'
import AvatarDropdown from '@/components/RightContent/AvatarDropdown.vue'
import { apply, randomTheme } from '@/hooks/useTheme'

const handleClick = () => {
  apply(randomTheme())
}
</script>
<style lang="less" scoped>
.header-item {
  margin: 0;
  display: inline-block;
  cursor: pointer;
  padding: 0 10px;
}
.header-item:hover {
  background-color: rgba(0,0,0,0.045);
}
</style>
