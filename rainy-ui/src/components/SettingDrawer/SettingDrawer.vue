<template>
  <a-drawer v-model:visible="visible" :width="300" placement="right" :closable="false">
    <template #handle>
      <div class="ant-pro-setting-drawer-handle" @click="handleShowDrawer">
        <SettingOutlined v-if="!visible" />
        <CloseOutlined v-else />
      </div>
    </template>
    <div class="margin-bottom: 24px">
      <h3>导航模式</h3>
      <a-radio-group :value="modelValue.layout" @change="e => updateConf(e.target.value, 'layout')">
        <a-radio value="side">
          <img src="https://gw.alipayobjects.com/zos/rmsportal/LCkqqYNmvBEbokSDscrm.svg" />
        </a-radio>
        <a-radio value="top">
          <img src="https://gw.alipayobjects.com/zos/antfincdn/URETY8%24STp/KDNDBbriJhLwuqMoxcAr.svg" />
        </a-radio>
<!--        <a-radio value="dark">-->
<!--          <img src="https://gw.alipayobjects.com/zos/antfincdn/hmKaLQvmY2/LCkqqYNmvBEbokSDscrm.svg" />-->
<!--        </a-radio>-->
        <!--        <a-radio value="mix">混合菜单布局</a-radio>-->
      </a-radio-group>
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
      <a-row style="margin-bottom: 12px">
        <a-col :span="12">自动分割菜单</a-col>
        <a-col :span="12" style="text-align: right">
          <a-switch
            checked-children="开"
            un-checked-children="关"
            :checked="modelValue.splitMenus"
            @change="checked => updateConf(checked, 'splitMenus')"
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
            :checked="modelValue.multiTag"
            @change="checked => updateConf(checked, 'multiTag')"
          />
        </a-col>
      </a-row>
    </div>
  </a-drawer>
</template>

<script setup>
import { apply, colors } from '@/hooks/useTheme'

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

const updateConf = (val, type) => {
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
</style>
