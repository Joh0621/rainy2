<template>
  <div><h2>sdfjskl</h2></div>
  <div :class="prefixCls">
    <a-tabs v-model="currentTab" @change="handleTabChange">
      <a-tab-pane v-for="v in icons" :tab="v.title" :key="v.key">
        <ul>
          <li v-for="(icon, key) in v.icons" :key="`${v.key}-${key}`" :class="{ 'active': selectedIcon === icon }" @click="handleSelectedIcon(icon)" >
            <a-icon :type="icon" :style="{ fontSize: '36px' }" />
          </li>
        </ul>
      </a-tab-pane>
    </a-tabs>
  </div>
</template>

<script setup>
import icons from './icons'
const props = defineProps({
  prefixCls: {
    type: String,
    default: 'ant-pro-icon-selector'
  },
  value: {
    type: String
  }
})

onMounted(() => {
  autoSwitchTab()
})
const selectedIcon = ref(props.value || '')
const currentTab = ref('directional')
const emits = defineEmits(['change'])
const handleSelectedIcon = (icon) => {
  selectedIcon.value = icon
  emits('change', icon)
}
const handleTabChange = (activeKey) => {
  currentTab.value = activeKey
}
const autoSwitchTab = () => {
  icons.some(item => item.icons.some(icon => icon === this.value) && (this.currentTab = item.key))
}
</script>
