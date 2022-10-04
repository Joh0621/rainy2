<template>
  <a-modal
    v-model:visible="visible"
    :width="800"
    :title="(flag ? '新增' : '编辑') + '菜单'"
    :confirm-loading="confirmLoading"
    :destroyOnClose="false"
    :maskClosable="false"
    :forceRender="true"
    @ok="handleOk"
    @cancel="handleCancel"
  >
    <a-spin :spinning="spinning">
      <a-form
          ref="formRef"
          layout="horizontal"
          :model="form"
          :label-col="labelCol"
          :wrapper-col="wrapperCol"
      >
        <a-form-item v-show="false" name="id"></a-form-item>
        <a-row :gutter="gutter">
          <a-col :span="span">
            <a-form-item
                name="name"
                label="菜单名称"
                :rules="[{ required: true, message: '请输入菜单名称' }]"
                has-feedback
            >
              <a-input v-model:value="form.name" placeholder="请输入菜单名称" />
            </a-form-item>
          </a-col>
          <a-col :span="span">
            <a-form-item
                name="type"
                label="菜单类型"
                :rules="[{ required: true, message: '请选择菜单类型' }]"
                has-feedback
            >
              <a-radio-group v-model:value="form.type" @change="handleMenuTypeChange">
                <a-radio-button v-for="item in appStore.dictItems('sys_menu_type')" :key="item.value" :value="item.value">
                  {{ item.name }}
                </a-radio-button>
              </a-radio-group>
            </a-form-item>
          </a-col>
        </a-row>
        <a-row :gutter="gutter">
          <a-col :span="span">
            <a-form-item
                name="parentId"
                label="上级菜单"
                :rules="[{ required: true, message: '请选择上级菜单' }]"
                has-feedback
            >
              <a-tree-select
                  v-model:value="form.parentId"
                  :fieldNames="fieldNames"
                  placeholder="请选择上级菜单"
                  :tree-data="treeData"
                  :tree-default-expanded-keys="[0]"
                  showSearch
                  treeNodeFilterProp="name"
              >
              </a-tree-select>
            </a-form-item>
          </a-col>
          <a-col :span="span">
            <a-form-item
                name="target"
                label="打开方式"
                :rules="[{ required: true, message: '请选择菜单打开方式' }]"
                has-feedback
            >
              <a-radio-group :disabled="form.type === 0 || form.type === 2" v-model:value="form.target" @change="handleTargetChange">
                <a-radio
                    :disabled="form.type === 1 && item.value === '_none'"
                    v-for="item in appStore.dictItems('sys_menu_target')"
                    :key="item.value"
                    :value="item.value"
                >{{ item.name }}</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
        </a-row>
        <a-row v-if="form.type !== 2" :gutter="gutter">
          <a-col :span="span">
            <a-form-item
                name="component"
                label="前端组件"
                :rules="[{ required: form.target !== '_blank', message: '请输入前端组件' }]"
                has-feedback
            >
              <a-input :disabled="form.type === 0 || form.type === 2 || form.target === '_self' || form.target === '_blank'" v-model:value="form.component" placeholder="请输入前端组件" />
            </a-form-item>
          </a-col>
          <a-col :span="span">
            <a-form-item
                name="path"
                label="路由地址"
                :rules="[{ required: form.type === 1 && form.target !== '_blank', message: '请输入路由地址' }]"
                has-feedback
            >
              <a-input :disabled="form.type === 0 || form.target === '_blank'" v-model:value="form.path" placeholder="请输入路由地址" />
            </a-form-item>
          </a-col>
        </a-row>
        <a-row v-if="form.type !== 2" :gutter="gutter">
          <a-col :span="span">
            <a-form-item
                name="icon"
                label="菜单图标"
                has-feedback
            >
              <a-input :disabled="true" v-model:value="form.icon">
                <template  #addonAfter>
                  <setting-outlined @click="selectIcon"/>
                </template>
              </a-input>
            </a-form-item>
          </a-col>
          <a-col :span="span">
            <a-form-item
                name="url"
                label="外链地址"
                :rules="[{ required: form.target === '_self' || form.target === '_blank', message: '请输入外链地址' }]"
                has-feedback
            >
              <a-input :disabled="form.target === '_component' || form.target === '_none'" v-model:value="form.url" placeholder="请输入外链地址" />
            </a-form-item>
          </a-col>
        </a-row>
        <a-row :gutter="gutter">
          <a-col :span="span">
            <a-form-item
                name="sort"
                label="排序"
                :rules="[{ required: true, message: '请输入排序' }]"
                has-feedback
            >
              <a-input-number
                  style="width: 100%"
                  v-model:value="form.sort"
                  placeholder="请输入排序"
              />
            </a-form-item>
          </a-col>
          <a-col :span="span">
            <a-form-item
                name="description"
                label="描述"
                has-feedback
            >
              <a-input v-model:value="form.description" placeholder="请输入描述"/>
            </a-form-item>
          </a-col>
        </a-row>
        <a-row :gutter="gutter">
          <a-col :span="span">
            <a-form-item
                name="show"
                label="是否显示"
                :rules="[ { required: true, message: '请选择是否显示' }]"
                has-feedback
            >
              <a-radio-group v-model:value="form.show">
                <a-radio
                    v-for="item in appStore.dictItems('sys_yes_or_no')"
                    :key="item.value"
                    :value="item.value"
                >{{ item.name }}</a-radio>
              </a-radio-group>
            </a-form-item>
          </a-col>
          <a-col v-if="form.type === 2" :span="span">
            <a-form-item
                name="permission"
                label="权限码"
                :rules="[ { required: true, message: '请输入权限码' }]"
                has-feedback
            >
              <a-input v-model:value="form.permission" placeholder="请输入权限码"/>
            </a-form-item>
          </a-col>
        </a-row>
      </a-form>
    </a-spin>
  </a-modal>
  <IconSelector ref="iconSelector" @select="handleSelectIcon"></IconSelector>
</template>
<script setup>
import { Tree, Add, Edit } from '@/api/system/menu.js'
import { message } from 'ant-design-vue'
import { useAppStore } from '@/store/app'
import { SettingOutlined } from '@ant-design/icons-vue'

const appStore = useAppStore()

const labelCol = reactive({ span: 5, offset: 0 })
const wrapperCol = reactive({ span: 18, offset: 0 })
const gutter = [24, 8]
const span = 12

// 是否是新增: true 新增，false 编辑，默认新增
const flag = ref(true)
const visible = ref(false)
const confirmLoading = ref(false)
const spinning = ref(false)

const form = ref({})
const formRef = ref()

const open = (flagValue, record) => {
  visible.value = true
  flag.value = flagValue
  form.value = record
  loadTree()
}

const fieldNames = {
  label: 'name',
  value: 'id',
  key: 'id'
}
const treeData = ref([])
const loadTree = () => {
  spinning.value = true
  Tree({}).then(res => {
    treeData.value = [{
      name: 'root',
      id: 0,
      children: res.data
    }]
  }).finally(() => {
    spinning.value = false
  })
}

const handleMenuTypeChange = e => {
  const value = e.target.value
  if (value === 0) {
    form.value.target = '_component'
    form.value.component = 'PageView'
    form.value.path = null
    form.value.url = ''
  }
  if (value === 1) {
    form.value.target = '_self'
    form.value.component = 'Iframe'
  }
  if (value === 2) {
    form.value.target = '_none'
  }
}

const handleTargetChange = e => {
  if (e.target.value === '_component') {
    form.value.component = ''
  }
  if (e.target.value === '_self') {
    form.value.component = 'Iframe'
  }
  if (e.target.value === '_blank') {
    form.value.path = ''
    form.value.component = ''
  }
}

const iconSelector = ref()
const selectIcon = () => {
  iconSelector.value.open(form.value.icon)
}

const handleSelectIcon = icon => {
  form.value.icon = icon
}

const handleOk = () => {
  confirmLoading.value = true
  formRef.value
    .validateFields()
    .then((values) => {
      if (flag.value) {
        handleAdd(values)
      } else {
        handleEdit(values)
      }
    })
    .catch((err) => {
      err.errorFields.forEach((msg) => {
        console.warn(msg.errors)
      })
    })
    .finally(() => {
      confirmLoading.value = false
    })
}


const handleAdd = (values) => {
  Add(values).then((res) => {
    if (res.success) {
      message.info(res.message)
      handleCancel()
    }
  })
}

const handleEdit = (values) => {
  Edit(values).then((res) => {
    if (res.success) {
      message.info(res.message)
      handleCancel()
    }
  })
}

const emits = defineEmits(['ok'])
const handleCancel = () => {
  visible.value = false
  formRef.value.resetFields()
  emits('ok') // 防止修改后不确定导致的列表显示不一致问
}

defineExpose({
  open
})
</script>
