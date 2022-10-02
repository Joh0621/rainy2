<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="菜单名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入菜单名称" />
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
      <template #type="{ record }">
        <a-tag v-if="record.type === 0" color="#2db7f5">
          {{ appStore.dictItemValue('sys_menu_type', record.type) }}
        </a-tag>
        <a-tag v-if="record.type === 1" color="#87d068">
          {{ appStore.dictItemValue('sys_menu_type', record.type) }}
        </a-tag>
        <a-tag v-if="record.type === 2" color="cyan">
          {{ appStore.dictItemValue('sys_menu_type', record.type) }}
        </a-tag>
      </template>
      <template #action="{ record }">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical"/>
        <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
          <a-button type="link" danger>删除</a-button>
        </a-popconfirm>
      </template>
    </b-table>
    <menu-edit ref="editor" @ok="handleOk"></menu-edit>
    <role-authorize ref="authorizer" @ok="handleOk"></role-authorize>
  </a-card>
</template>

<script setup>
import MenuEdit from './MenuEdit.vue'
import RoleAuthorize from './RoleAuthorize.vue'
import { useAppStore } from '@/store/app'
import { Tree, Del, Export } from '@/api/system/menu.js'
import { toIdNamesParam } from '@/utils/ParamUtils'
import { sortValue } from '@/utils/constants'
import { message } from 'ant-design-vue'

const appStore = useAppStore()

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '菜单名称', dataIndex: 'name' },
  { title: '菜单类型', dataIndex: 'type' },
  // { title: '路由名称', dataIndex: 'name' },
  { title: '路由地址', dataIndex: 'path' },
  { title: '前端组件', dataIndex: 'component' },
  { title: '内链Url', dataIndex: 'url' },
  { title: '权限码', dataIndex: 'permission' },
  { title: '排序', dataIndex: 'sort' },
  { title: '描述', dataIndex: 'description' },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return Tree(Object.assign(parameter, queryParam.value)).then(res => {
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
    parentId: 0,
    type: 1,
    target: '_self',
    component: 'Iframe',
    icon: 'icon-Report',
    show: true,
    sort: sortValue
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
