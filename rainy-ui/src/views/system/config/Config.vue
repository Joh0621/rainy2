<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="配置名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入配置名称" />
        </a-form-item>
        <a-form-item label="配置编码">
          <a-input v-model:value="queryParam.code" placeholder="请输唯一编码" />
        </a-form-item>
        <a-form-item label="配置分类">
          <a-select style="width: 150px" v-model:value="queryParam.categoryCode" placeholder="请选择分类" @select="$refs.table.refresh()">
            <a-select-option :key="item.value" v-for="item in appStore.dictItems('sys_config_category')" :value="item.value">
              {{ item.name }}
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item>
          <a-space>
            <a-button type="primary" @click="handleOk">查询</a-button>
            <a-button @click="handleReset">重置</a-button>
          </a-space>
        </a-form-item>
      </a-form>
    </div>
    <b-table
      ref="table"
      :columns="columns"
      :row-key="record => record.id"
      :load-data="data"
      @add="handleAdd"
      @batch-del="handleBatchDel"
    >
      <template #operation>
        <a-download ref="downloader" title="导出" description="导出全部数据" @dl="handleExportExcel"></a-download>
      </template>
      <template #categoryCode="{ record }">
        {{ appStore.dictItemValue('sys_config_category', record.categoryCode) }}
      </template>
      <template #dataType="{ record }">
        {{ appStore.dictItemValue('sys_data_type', record.dataType) }}
      </template>
      <template #action="{ record }">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical"/>
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" size="small" danger>删除</a-button>
        </a-popconfirm>
      </template>
    </b-table>
    <config-edit ref="editor" @ok="handleOk"></config-edit>
  </a-card>
</template>

<script setup>
import { useAppStore } from '@/store/app'
import { List, Del, Export } from '@/api/system/config.js'
import { toIdNamesParam } from '@/utils/ParamUtils'
import ConfigEdit from './ConfigEdit.vue'
import { message } from 'ant-design-vue'

const appStore = useAppStore()

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '配置分类', dataIndex: 'categoryCode', width: '100px' },
  { title: '配置名称', dataIndex: 'name', ellipsis: true },
  { title: '配置编码', dataIndex: 'code', ellipsis: true },
  { title: '配置值', dataIndex: 'value' },
  { title: '数据类型', dataIndex: 'dataType' },
  { title: '描述', dataIndex: 'description', ellipsis: true },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return List(Object.assign(parameter, queryParam.value)).then(res => {
    return res.data
  })
}

const handleOk = () => {
  table.value.refresh()
}
const handleReset = () => {
  queryParam.value = {}
  handleOk()
}

const editor = ref()
const handleAdd = () => {
  editor.value.open(true, {
    dataType: 'string'
  })
}
const handleEdit = (record) => {
  editor.value.open(false, record)
}

const handleDel = (record) => {
  const idNamesParam = toIdNamesParam(record)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success(res.message)
      handleOk()
    }
  })
}
const handleBatchDel = (keys, rows) => {
  const idNamesParam = toIdNamesParam(rows)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success(res.message)
      handleOk()
    }
  })
}

const downloader = ref()
const handleExportExcel = () => {
  Export().then(res => {
    downloader.value.download(res)
  })
}

</script>
