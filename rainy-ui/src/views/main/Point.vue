<template>
    <b-table
        ref="table"
        :options="options"
        :columns="columns"
        :row-key="record => record.id"
        :load-data="data"
    >
    </b-table>
</template>

<script setup>
import { List } from '@/api/main/point'

const props = defineProps({
  deviceCode: {
    type: String
  }
})

const options = {
  showAdd: false,
  showBatchDel: false
}
const columns = [
  { title: '设备名称', dataIndex: 'deviceName' },
  // { title: '设备编码', dataIndex: 'deviceCode' },
  { title: '测点点码', dataIndex: 'code' },
  { title: '测点描述', dataIndex: 'name', ellipsis: true }
]
const queryParam = ref({
  deviceCode: props.deviceCode
})
const data = (parameter) => {
  return List(Object.assign(parameter, queryParam.value)).then(res => {
    return res.data
  })
}

const table = ref()

defineExpose({
  open
})

</script>
