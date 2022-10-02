<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="角色名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入角色名称" />
        </a-form-item>
        <a-form-item label="角色编码">
          <a-input v-model:value="queryParam.code" placeholder="请输唯一编码" />
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
      <template #isDefault="{ record }">
        {{ appStore.dictItemValue('sys_yes_or_no', record.isDefault) }}
      </template>
      <template #action="{ record }">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical"/>
        <a-dropdown>
          <a class="ant-dropdown-link" @click.prevent>
            更多  <DownOutlined />
          </a>
          <template #overlay>
            <a-menu>
              <a-menu-item>
                <a-button @click="handleAuthorize(record)" type="link" size="small">分配菜单</a-button>
              </a-menu-item>
              <a-menu-item>
                <a-popconfirm :disabled="record.isDefault" title="确认删除吗？" @confirm="handleDel(record)">
                  <a-button type="link" size="small" :disabled="record.isDefault" danger>删除</a-button>
                </a-popconfirm>
              </a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </template>
    </b-table>
    <role-edit ref="editor" @ok="handleOk"></role-edit>
    <role-authorize ref="authorizer" @ok="handleOk"></role-authorize>
  </a-card>
</template>

<script setup>
import { useAppStore } from '@/store/app'
import { List, Del, Export } from '@/api/permission/Role'
import { toIdNamesParam } from '@/utils/ParamUtils'
import RoleEdit from './RoleEdit.vue'
import RoleAuthorize from './RoleAuthorize.vue'
import { message } from 'ant-design-vue'
import { DownOutlined } from '@ant-design/icons-vue'

const appStore = useAppStore()

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '角色名称', dataIndex: 'name' },
  { title: '角色编码', dataIndex: 'code' },
  { title: '描述', dataIndex: 'description', ellipsis: true },
  { title: '排序', dataIndex: 'sort' },
  { title: '是否默认', dataIndex: 'isDefault' },
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
    isDefault: false
  })
}

const authorizer = ref()
const handleAuthorize = (record) => {
  authorizer.value.open(record)
}
const handleEdit = (record) => {
  // 转化为 string
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
