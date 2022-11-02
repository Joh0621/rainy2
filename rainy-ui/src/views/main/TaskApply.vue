<template>
  <a-card :bordered="false">
    <div class="table-query">
      <a-form layout="inline">
        <a-form-item label="设备名称">
          <a-input v-model:value="queryParam.deviceName" placeholder="请输入设备名称" />
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
        :options="options"
        :columns="columns"
        :row-key="record => record.id"
        :load-data="data"
    >
      <template #finished="{ record }">
        {{ appStore.dictItemValue('sys_yes_or_no', record.finished)}}
      </template>
            <template #status="{ record }">
              <a-switch @click="handleChange(record)" :checkedValue="0" :unCheckedValue="1" v-model:checked="record.status" checked-children="启用" un-checked-children="停用" />
            </template>
      <template #approved="{ record }">
        <a-tag v-if="record.approved === 0" color="#2db7f5">
          {{ appStore.dictItemValue('wf_approve_status', record.approved)}}
        </a-tag>
        <a-tag v-if="record.approved === 1" color="#87d068">
          {{ appStore.dictItemValue('wf_approve_status', record.approved)}}
        </a-tag>
        <a-tag v-if="record.approved === 2" color="#108ee9">
          {{ appStore.dictItemValue('wf_approve_status', record.approved)}}
        </a-tag>
      </template>
      <template #action="{ record }">
        <a @click="() => { taskTrack.open(record) }">跟踪</a>
        <a-divider type="vertical"/>
        <a-dropdown>
          <a class="ant-dropdown-link" @click.prevent>
            更多  <DownOutlined />
          </a>
          <template #overlay>
            <a-menu>
              <a-menu-item>
                <a-button :disabled="record.approved !== 1" @click="downloadPointCode(record)" type="link" size="small">下载点码</a-button>
              </a-menu-item>
              <a-menu-item>
                <a-button :disabled="record.approved !== 1" @click="lookAccessToken(record)" type="link" size="small">接口密钥</a-button>
              </a-menu-item>
              <a-menu-item>
                <a-popconfirm :disabled="record.approved !== 1" title="确认取消申请吗？" @confirm="handleCancelApply(record)">
                  <a-button :disabled="record.approved !== 1" type="link" size="small" danger>取消申请</a-button>
                </a-popconfirm>
              </a-menu-item>
              <a-menu-item>
                <a-popconfirm :disabled="record.approved !== 2" title="确认删除吗？" @confirm="handleCancelApply(record)">
                  <a-button :disabled="record.approved !== 2" type="link" size="small" danger>删除</a-button>
                </a-popconfirm>
              </a-menu-item>
            </a-menu>
          </template>
        </a-dropdown>
      </template>
    </b-table>
    <TaskComplete ref="taskComplete" @ok="handleOk"></TaskComplete>
    <TaskTrack ref="taskTrack"></TaskTrack>
    <AccessToken ref="accessToken"></AccessToken>
  </a-card>
</template>

<script setup>
import { List, Edit, CancelApply, PointDownload } from '@/api/main/dataApply'
import TaskComplete from '../system/workflow/TaskComplete.vue'
import TaskTrack from '../system/workflow/TaskTrack.vue'
import AccessToken from './AccessToken.vue'
import { useAppStore } from '@/store/app'
import { message } from 'ant-design-vue'
import { download } from '@/utils/Utils'

const appStore = useAppStore()

const options = {
  showAdd: false,
  showBatchDel: false
}

const taskTrack = ref()
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '设备名称', dataIndex: 'dataName', ellipsis: true },
  { title: '数据目录', dataIndex: 'dataDirectionName', ellipsis: true },
  // { title: '责任部门', dataIndex: 'orgName' },
  { title: '申请人', dataIndex: 'applyUsername' },
  { title: '申请时间', dataIndex: 'applyTime' },
  { title: '审批状态', dataIndex: 'approved' },
  { title: '状态', dataIndex: 'status' },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return List(Object.assign(parameter, queryParam.value)).then(res => {
    return res.data
  })
}

const downloadPointCode = record => {
  const param = {
    id: record.id,
    name: record.dataName
  }
  PointDownload(param).then(res => {
    download(res)
  })
}

const accessToken = ref()
const lookAccessToken = (record) => {
  accessToken.value.open(record)
}

const handleCancelApply = record => {
  const param = {
    id: record.id,
    name: record.dataName
  }
  CancelApply(param).then(res => {
    if (res.success) {
      message.info(res.message)
      handleOk()
    }
  })
}

const handleChange = (record) => {
  const param = {
    id: record.id,
    status: record.status
  }
  Edit(param).then(res => {
    if (res.success) {
      message.info(res.message)
    }
  })
}

const handleOk = () => {
  table.value.refresh()
}
const handleReset = () => {
  queryParam.value = {}
  handleOk()
}
</script>
