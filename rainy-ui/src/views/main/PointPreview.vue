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
const options = {
  showAdd: false,
  showBatchDel: false
}
const columns = [
  { title: '测点点码', dataIndex: 'code', width: '200px' },
  { title: '测点描述', dataIndex: 'desc', width: '200px' },
  { title: '测点值', dataIndex: 'value', ellipsis: true }
]
const data = (parameter) => {
  return new Promise((resolve) => {
    resolve([
      { code: '01205163110010120011', desc: '风机风速', value: 7.6 },
      { code: '01205163110010120018', desc: '风机环境温度', value: 23 },
      { code: '01101101110011010006', desc: '有功功率', value: 34.2 },
      { code: '01101101110011010007', desc: '无功功率', value: 21.32 },
      { code: '01101101110011010004', desc: '总发电量', value: 212 },
      { code: '01101101110011000013', desc: '叶轮转速', value: 50 },
      { code: '01101101110011000058', desc: '电网相电流', value: 12 }
    ])
  })
}

const table = ref()

defineExpose({
  open
})

</script>
