<template>
  <a-modal
      v-model:visible="visible"
      :title="'接口密钥'"
      :confirm-loading="confirmLoading"
      :destroyOnClose="false"
      :maskClosable="false"
      :forceRender="true"
      @ok="handleOk"
      @cancel="handleCancel"
  >
    <a-row>
      <a-col :span="20">
        <a-input-group compact>
          <a-input-password ref="tokenRef" style="width: calc(100% - 40px)" v-model:value="token">
          </a-input-password>
          <a-tooltip title="拷贝">
            <a-button @click="copyLink">
              <template #icon><CopyOutlined /></template>
            </a-button>
          </a-tooltip>
        </a-input-group>
      </a-col>
      <a-col :span="4">
        <a-button @click="refresh" type="primary">
          刷新
        </a-button>
      </a-col>
    </a-row>
    <div class="margin-t20"></div>
  </a-modal>
</template>
<script setup>
import { Get, Edit } from '@/api/main/accessToken'
import useClipboard from 'vue-clipboard3'
import { message } from 'ant-design-vue'

// 是否是新增: true 新增，false 编辑，默认新增
const visible = ref(false)
const confirmLoading = ref(false)
const record = ref({})

const open = (recordValue) => {
  visible.value = true
  record.value = recordValue
  getToken()
}

const token = ref('9b33ee0f-0629-4eef-abb8-37c5aabb23d4')

const getToken = () => {
  const param = {
    userDataId: record.value.id
  }
  Get(param).then(res => {
    token.value = res.data.accessToken
  })
}

const copyLink = () => {
  const { toClipboard } = useClipboard()
  toClipboard(token.value).then(res => {
    message.info('拷贝成功')
  })
}
const refresh = () => {
  const param = {
    userDataId: record.value.id
  }
  Edit(param).then((res) => {
    if (res.success) {
      message.info(res.message)
      getToken()
    }
  })
}
const handleOk = () => {
  handleCancel()
}

const emits = defineEmits(['ok'])

const handleCancel = () => {
  visible.value = false
  emits('ok')
}

defineExpose({
  open
})
</script>
