<template>
  <a-row :gutter="24">
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
            <a-form-item label="用户名">
              <a-input v-model:value="queryParam.username" placeholder="请输入用户名!" />
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
          <template #status="{ record }">
            {{ appStore.dictItemValue('sys_user_status', record.status) }}
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
                    <a-button @click="handleAuthorize(record)" type="link" size="small">分配角色</a-button>
                  </a-menu-item>
                  <a-menu-item>
                    <a-button @click="resetPassword(record)" type="link" size="small">重置密码</a-button>
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
        <user-edit ref="editor" @ok="handleOk"></user-edit>
        <user-authorize ref="authorizer"></user-authorize>
      </a-card>
    </a-col>
  </a-row>
</template>

<script setup>
import { Tree } from '@/api/org/org'
import { List, Del, Export } from '@/api/permission/user'
import { toIdNamesParam } from '@/utils/ParamUtils'
import { sortValue } from '@/utils/constants'
import UserEdit from './UserEdit.vue'
import UserAuthorize from './UserAuthorize.vue'
import { message } from 'ant-design-vue'
import { DownOutlined } from '@ant-design/icons-vue'
import { useAppStore } from '@/store/app'

const appStore = useAppStore()

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
    queryParam.value.orgId = selectedKeys[0]
  } else {
    queryParam.value.orgId = null
  }
  handleOk()
}
onMounted(() => {
  tree()
})

const table = ref()
const queryParam = ref({})
const columns = [
  { title: '用户名', dataIndex: 'username' },
  { title: '昵称', dataIndex: 'nickName' },
  { title: '生日', dataIndex: 'birthday' },
  { title: '手机号', dataIndex: 'telephone' },
  { title: '邮箱', dataIndex: 'email' },
  { title: '状态', dataIndex: 'status' },
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
const authorizer = ref()
//  分配角色
const handleAuthorize = (record) => {
  authorizer.value.open(record)
}

//  // 重置密码
const resetPassword = record => {
  // 重置密码
}

const editor = ref()
// 添加用户
const handleAdd = () => {
  editor.value.open(true, {
    sort: sortValue,
    parentId: 0
  })
}
// 编辑
const handleEdit = (record) => {
  editor.value.open(false, record)
}
// 删除
const handleDel = (record) => {
  const idNamesParam = toIdNamesParam(record)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success('删除成功！')
      handleOk()
    }
  })
}
// 批量删除
const handleBatchDel = (keys, rows) => {
  const idNamesParam = toIdNamesParam(rows)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success('删除成功！')
      handleOk()
    }
  })
}

// excel 导出
const downloader = ref()
const handleExportExcel = () => {
  Export().then(res => {
    downloader.value.download(res)
  })
}

</script>
