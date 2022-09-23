<template>
  <a-space style="margin-bottom: 8px">
    <a-button v-if="options.showAdd" type="primary" @click="handleAdd"><PlusOutlined />新增</a-button>
    <a-popconfirm
        v-if="options.showBatchDel"
        :disabled="state.selectedRowKeys.length === 0"
        title="确认批量删除吗？"
        @confirm="handleBatchDel">
      <a-button :disabled="state.selectedRowKeys.length === 0" danger><DeleteOutlined />批量删除</a-button>
    </a-popconfirm>
    <slot name="operation"></slot>
  </a-space>
  <a-spin :spinning="spinning">
    <a-table
      :row-key="rowKey"
      :columns="columns"
      :data-source="dataSource"
      :row-selection="{ selectedRowKeys: state.selectedRowKeys, onChange: onSelectChange }"
      :pagination="pagination"
      @change="handleChange"
    >
      <template #bodyCell="{ column, record }">
        <template v-if="column.dataIndex">
          <slot :name="column.dataIndex" :record="record"></slot>
        </template>
      </template>
    </a-table>
  </a-spin>
</template>

<script setup>
import { PlusOutlined, DeleteOutlined } from '@ant-design/icons-vue'

const props = defineProps({
  options: {
    default: {
      showAdd: true,
      showBatchDel: true
    }
  },
  columns: {
    type: Array,
    default: () => []
  },
  loadData: {
    type: Function,
    required: true
  },
  rowKey: {
    type: [String, Function],
    default: 'key'
  }
})

const dataSource = ref([])
const spinning = ref(false)
const pagination = ref({
  current: 1,
  pageSize: 8,
  total: 0
})

const state = reactive({
  selectedRowKeys: [],
  selectedRows: []
})
const onSelectChange = (selectedRowKeys, selectedRows) => {
  state.selectedRowKeys = selectedRowKeys
  state.selectedRows = selectedRows
}

onMounted(() => {
  refresh()
})

const refresh = () => {
  spinning.value = true
  const parameter = {
    current: pagination.value.current,
    size: pagination.value.pageSize
  }
  props
    .loadData(parameter)
    .then((res) => {
      dataSource.value = res.records
      pagination.value.total = res.total
    })
    .finally(() => {
      setTimeout(() => {
        spinning.value = false
      }, 200)
    })
}

const handleChange = (page) => {
  pagination.value = page
  refresh()
}

const emits = defineEmits(['add', 'batchDel'])
const handleAdd = () => {
  emits('add')
}
const handleBatchDel = () => {
  emits('batchDel', state.selectedRowKeys, toRaw(state.selectedRows))
}

defineExpose({
  state,
  refresh
})
</script>
