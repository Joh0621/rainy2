<template>
  <a-row :gutter="16">
    <a-col :span="5">
      <a-card :bordered="false">
        <a-skeleton :loading="loading">
          <a-tree
            v-if="treeData.length"
            :fieldNames="fieldNames"
            :tree-data="treeData"
            @select="handleTreeSelect"
            defaultExpandAll>
          </a-tree>
        </a-skeleton>
      </a-card>
    </a-col>
    <a-col :span="19" style="padding-left: 6px">
      <a-card :bordered="false">
        <div class="table-query">
          <a-form layout="inline">
            <a-form-item label="组织名称">
              <a-input v-model:value="queryParam.name" placeholder="请输入组织名称" />
            </a-form-item>
            <a-form-item label="组织编码">
              <a-input v-model:value="queryParam.code" placeholder="请输唯一编码" />
            </a-form-item>
            <a-form-item>
              <a-space>
                <a-button type="primary" @click="table.refresh()">查询</a-button>
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
          <template #action="{ record }">
            <a @click="handleEdit(record)">编辑</a>
            <a-divider type="vertical"/>
            <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
              <a-button type="link" size="small" danger>删除</a-button>
            </a-popconfirm>
          </template>
        </b-table>
        <org-edit ref="editor" @ok="handleOk"></org-edit>
      </a-card>
    </a-col>
  </a-row>
</template>

<script setup>
import { List, Tree, Del, Export } from '@/api/org/org'
import { toIdNamesParam } from '@/utils/ParamUtils'
import { sortValue } from '@/utils/constants'
import OrgEdit from './OrgEdit.vue'
import { message } from 'ant-design-vue'

const fieldNames = {
  key: 'id',
  title: 'name'
}
const loading = ref(false)
const treeData = ref([])
const tree = () => {
  loading.value = true
  Tree({}).then(res => {
    treeData.value = res.data
  }).finally(() => {
    loading.value = false
  })
}
const handleTreeSelect = (selectedKeys) => {
  if (selectedKeys.length) {
    queryParam.value.id = selectedKeys[0]
  } else {
    queryParam.value.id = null
  }
  table.value.refresh()
}
onMounted(() => {
  tree()
})

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '组织名称', dataIndex: 'name' },
  { title: '组织编码', dataIndex: 'code' },
  { title: '描述', dataIndex: 'description', ellipsis: true },
  { title: '排序', dataIndex: 'sort' },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return List(Object.assign(parameter, queryParam.value)).then(res => {
    return res.data
  })
}

const handleOk = () => {
  tree()
  table.value.refresh()
}
const handleReset = () => {
  queryParam.value = {}
  handleOk()
}

const editor = ref()
const handleAdd = () => {
  editor.value.open(true, {
    sort: sortValue,
    parentId: 0
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
