<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="字典名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入字典名称" />
        </a-form-item>
        <a-form-item label="字典编码">
          <a-input v-model:value="queryParam.code" placeholder="请输唯一编码" />
        </a-form-item>
        <a-form-item label="字典分类">
          <a-select style="width: 100px" v-model:value="queryParam.categoryCode" placeholder="请选择分类" @select="$refs.table.refresh()">
            <a-select-option :key="item.value" v-for="item in appStore.dictItems('sys_dict_category')" :value="item.value">
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
        {{ appStore.dictItemValue('sys_dict_category', record.categoryCode) }}
      </template>
      <template #dataType="{ record }">
        {{ appStore.dictItemValue('sys_data_type', record.dataType) }}
      </template>
      <template #action="{ record }">
        <a @click="handleDictItem(record)">字典项</a>
        <a-divider type="vertical"/>
        <a-dropdown>
          <a class="ant-dropdown-link" @click.prevent>
            更多  <DownOutlined />
          </a>
          <template #overlay>
            <a-menu>
              <a-menu-item>
                <a-button @click="handleEdit(record)" type="link" size="small">编辑</a-button>
              </a-menu-item>
              <a-menu-item>
                <a-popconfirm title="确认删除字典以及字典项吗？" @confirm="handleDel(record)">
                  <a-button type="link" size="small" danger>删除</a-button>
                </a-popconfirm>
              </a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </template>
    </b-table>
    <dict-edit ref="editor" @ok="handleOk"></dict-edit>
    <DictItem ref="dictItem"></DictItem>
  </a-card>
</template>

<script setup>
import { useAppStore } from '@/store/app'
import { List, Del, Export } from '@/api/system/dict'
import { toIdNamesParam } from '@/utils/ParamUtils'
import DictEdit from './DictEdit.vue'
import DictItem from './DictItem.vue'
import { message } from 'ant-design-vue'
import { DownOutlined } from '@ant-design/icons-vue'

const appStore = useAppStore()

const dictItem = ref()

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '字典分类', dataIndex: 'categoryCode', width: '100px' },
  { title: '字典名称', dataIndex: 'name', ellipsis: true },
  { title: '字典编码', dataIndex: 'code', ellipsis: true },
  { title: '数据类型', dataIndex: 'dataType' },
  { title: '描述', dataIndex: 'description', ellipsis: true },
  // { title: '排序', dataIndex: 'sort' },
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

const handleDictItem = record => {
  dictItem.value.open(record)
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
      // 更新
      appStore.Common()
    }
  })
}
const handleBatchDel = (keys, rows) => {
  const idNamesParam = toIdNamesParam(rows)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success(res.message)
      handleOk()
      // 更新
      appStore.Common()
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
