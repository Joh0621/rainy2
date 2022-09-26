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

const options = {
  showAdd: false,
  showBatchDel: false
}
const columns = [
  { title: '编号', dataIndex: 'id', width: '50px' },
  { title: '设备编码', dataIndex: 'deviceCode', width: '80px' },
  { title: '点码', dataIndex: 'code', width: '200px' },
  { title: '点名', dataIndex: 'name', ellipsis: true }
]
const queryParam = ref({})
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
