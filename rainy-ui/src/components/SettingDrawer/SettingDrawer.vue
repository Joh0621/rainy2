<template>
  <a-drawer v-model:visible="visible" :width="300" placement="right" :closable="false">
    <template #handle>
      <div class="ant-pro-setting-drawer-handle" @click="handleShowDrawer">
        <SettingOutlined v-if="!visible" />
        <CloseOutlined v-else />
      </div>
    </template>
    <div>
      <h4>整体风格设置</h4>
      <div class="setting-drawer-checkbox">
        <a-tooltip>
          <template #title>
            亮色菜单风格
          </template>
          <div class="setting-drawer-item" @click="updateConf('light', 'navTheme')">
            <img src="/img/light.svg" alt="light">
            <div class="setting-drawer-selectIcon">
              <check-outlined v-if="navTheme === 'light'" />
            </div>
          </div>
        </a-tooltip>
        <a-tooltip>
          <template #title>
            暗色菜单风格
          </template>
          <div class="setting-drawer-item" @click="updateConf('dark', 'navTheme')">
            <img src="/img/dark.svg" alt="dark">
            <div class="setting-drawer-selectIcon">
              <check-outlined v-if="navTheme === 'dark'" />
            </div>
          </div>
        </a-tooltip>
      </div>
      <h4>整体布局设置</h4>
      <div class="setting-drawer-checkbox">
        <a-tooltip>
          <template #title>
            侧边菜单布局
          </template>
          <div class="setting-drawer-item" @click="updateConf('side', 'layout')">
            <img src="/img/side.svg" alt="side">
            <div class="setting-drawer-selectIcon">
              <check-outlined v-if="layout === 'side'" />
            </div>
          </div>
        </a-tooltip>
        <a-tooltip>
          <template #title>
            顶部菜单布局
          </template>
          <div class="setting-drawer-item" @click="updateConf('top', 'layout')">
            <img src="/img/top.svg" alt="top">
            <div class="setting-drawer-selectIcon">
              <check-outlined v-if="layout === 'top'" />
            </div>
          </div>
        </a-tooltip>
        <a-tooltip>
          <template #title>
            混合布局
          </template>
          <div class="setting-drawer-item" @click="updateConf('mix', 'layout')">
            <img class="layout-mix" style="width: 49px;height: 42px" :src="layoutMix" alt="mix">
            <div class="setting-drawer-selectIcon">
              <check-outlined v-if="layout === 'mix'" />
            </div>
          </div>
        </a-tooltip>
      </div>
      <h4>主题色</h4>
      <div>
        <a-tooltip v-for="(item, index) in colors" :key="index">
          <template #title>
            {{ item }}
          </template>
          <a-tag
            style="
              line-height: 20px;
              height: 20px;
              width: 20px;
              text-align: center;
              cursor: pointer;
              padding-left: 0;
              padding-right: 0;
            "
            :color="item"
            @click="updateTheme(item)"
          >
            <CheckOutlined :style="item === primaryColor ? '' : 'color:' + item" />
          </a-tag>
        </a-tooltip>
      </div>
      <a-divider />
      <a-row style="margin-bottom: 12px">
        <a-col :span="12">固定 Header</a-col>
        <a-col :span="12" style="text-align: right">
          <a-switch
            checked-children="开"
            un-checked-children="关"
            :checked="modelValue.fixedHeader"
            @change="checked => updateConf(checked, 'fixedHeader')"
          />
        </a-col>
      </a-row>
      <a-row style="margin-bottom: 12px">
        <a-col :span="12">固定 左侧菜单</a-col>
        <a-col :span="12" style="text-align: right">
          <a-switch
            checked-children="开"
            un-checked-children="关"
            :checked="modelValue.fixSiderbar"
            @change="checked => updateConf(checked, 'fixSiderbar')"
          />
        </a-col>
      </a-row>
      <a-divider />
      <h3>内容区域</h3>
      <a-row style="margin-bottom: 12px">
        <a-col :span="12">顶栏</a-col>
        <a-col :span="12" style="text-align: right">
          <a-switch
            checked-children="开"
            un-checked-children="关"
            :checked="modelValue.headerRender === undefined"
            @change="checked => updateConf(checked === true && undefined, 'headerRender')"
          />
        </a-col>
      </a-row>
      <a-row style="margin-bottom: 12px">
        <a-col :span="12">页脚</a-col>
        <a-col :span="12" style="text-align: right">
          <a-switch
            checked-children="开"
            un-checked-children="关"
            :checked="modelValue.footerRender === undefined"
            @change="checked => updateConf(checked === true && undefined, 'footerRender')"
          />
        </a-col>
      </a-row>
      <a-row style="margin-bottom: 12px">
        <a-col :span="12">菜单头</a-col>
        <a-col :span="12" style="text-align: right">
          <a-switch
            checked-children="开"
            un-checked-children="关"
            :checked="modelValue.menuHeaderRender === undefined"
            @change="checked => updateConf(checked === true && undefined, 'menuHeaderRender')"
          />
        </a-col>
      </a-row>
      <a-row style="margin-bottom: 12px">
        <a-col :span="12">多标签</a-col>
        <a-col :span="12" style="text-align: right">
          <a-switch
            checked-children="开"
            un-checked-children="关"
            :checked="modelValue.multiTab"
            @change="checked => updateConf(checked, 'multiTab')"
          />
        </a-col>
      </a-row>
    </div>
  </a-drawer>
</template>

<script setup>
import { apply, colors } from '@/hooks/useTheme'
import layoutMix from '@/assets/layout-mix.png'
import { defaultConfig } from '@/config/defaultConfig'

const props = defineProps({
  modelValue: {}
})
const emit = defineEmits(['update:modelValue'])

const visible = ref(false)
const primaryColor = ref(props.modelValue.primaryColor)
apply(primaryColor.value)

const handleShowDrawer = () => {
  visible.value = !visible.value
}

const navTheme = ref(localStorage.getItem('navTheme') || defaultConfig.navTheme)
const layout = ref(localStorage.getItem('layout') || defaultConfig.layout)
const updateConf = (val, type) => {
  if (type === 'navTheme') {
    navTheme.value = val
  }
  if (type === 'layout') {
    layout.value = val
  }
  localStorage.setItem(type, val)
  const newVal = {
    ...toRaw(props.modelValue),
    [`${type}`]: val
  }
  emit('update:modelValue', newVal)
}

const updateTheme = (color) => {
  primaryColor.value = color
  apply(color)
}
</script>

<style lang="less">
.ant-pro-setting-drawer-handle {
  position: absolute;
  top: 240px;
  right: 300px;
  z-index: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 48px;
  height: 48px;
  font-size: 16px;
  text-align: center;
  background: var(--ant-primary-color);
  border-radius: 4px 0 0 4px;
  cursor: pointer;
  pointer-events: auto;

  > span {
    color: rgb(255, 255, 255);
    font-size: 20px;
  }
}

.setting-drawer-checkbox {
  display: flex;
  cursor: pointer;

  .setting-drawer-item {
    margin-right: 16px;
    .setting-drawer-selectIcon {
      position: relative;
      left: 20px;
      bottom: 32px;
      color: var(--ant-primary-color);
    }
  }
}
.layout-mix {
  border-radius: 4px;
  box-shadow: 0 1px 2.5px 0 rgb(0 0 0 / 18%);
}
</style>
