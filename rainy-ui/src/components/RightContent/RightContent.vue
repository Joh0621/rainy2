<template>
  <span>
      <a-input-search
          style="width: 240px;display: inline-block;margin-top: 12px"
          placeholder="请输入设备名称/测点名称"
          v-model:value="searchValue"
          @search="onSearch"
      />
  </span>
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
import router from '@/router/index'

const handleClick = () => {
  apply(randomTheme())
}
const searchValue = ref('')
const onSearch = () => {
  router.push({ path: '/data/directory', query: { s: searchValue.value } })
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
