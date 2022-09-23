<template>
  <a-modal
    v-model:visible="visible"
    :title="'分配菜单'"
    :confirm-loading="confirmLoading"
    :destroyOnClose="false"
    :maskClosable="false"
    :forceRender="true"
    @ok="handleOk"
    @cancel="handleCancel"
  >
    <a-tree></a-tree>
  </a-modal>
</template>

<script setup>
const visible = ref(false)
const confirmLoading = ref(false)

const open = (record) => {
  visible.value = true
}

const handleOk = () => {
  confirmLoading.value = true
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
