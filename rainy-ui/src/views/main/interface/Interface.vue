<template>
  <a-card>
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="接口名称">
          <a-input v-model:value="queryParam.name" placeholder="请输入接口名称" />
        </a-form-item>
        <a-form-item label="接口编码">
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
        <a-button @click="downloadTemplate" type="dashed">
          <download-outlined/>
          模版下载
        </a-button>
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
              </a-menu-item>
              <a-menu-item>
                <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
                  <a-button type="link" size="small" danger>删除</a-button>
                </a-popconfirm>
              </a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </template>
    </b-table>
  </a-card>
</template>
<script setup>
import { List, Del } from '@/api/main/interface.js'
import { toIdNamesParam } from '@/utils/ParamUtils.js'
import { message } from 'ant-design-vue'

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '接口名称', dataIndex: 'name' },
  { title: '所属场站', dataIndex: 'dataDirectoryName' },
  { title: '专业', dataIndex: 'major' },
  { title: '更新频率', dataIndex: 'updateFrequency' },
  { title: '责任部门', dataIndex: 'orgName' },
  { title: '责任人', dataIndex: 'responsible' },
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

const handleEdit = (record) => {
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
</script>
<style scoped>
</style>
