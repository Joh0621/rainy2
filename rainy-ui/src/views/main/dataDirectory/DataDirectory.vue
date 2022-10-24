<template>
  <a-row :gutter="16">
    <a-col :span="5">
      <a-card>
        <a-skeleton :loading="loading">
          <h3>数据目录</h3>
          <a-directory-tree
              :fieldNames="fieldNames"
              :show-icon="true"
              :tree-data="treeData"
              :selectedKeys="[queryParam.dataDirectoryId]"
              @select="handleTreeSelect"
              defaultExpandAll>
            <template #title="record">
              <a-dropdown :trigger="['contextmenu']">
                <span>{{ record.name }}</span>
                <template #overlay>
                  <a-menu>
                    <a-menu-item @click="onAddClick(record)"><a>新增目录</a></a-menu-item>
                    <a-menu-item @click="onEditClick(record)">编辑目录</a-menu-item>
                    <a-menu-item>
                      <a-popconfirm title="确认删除吗？" @confirm="onDelClick(record)">
                        <a-button type="link" size="small" danger>删除目录</a-button>
                      </a-popconfirm>
                    </a-menu-item>
                  </a-menu>
                </template>
              </a-dropdown>
            </template>
          </a-directory-tree>
        </a-skeleton>
      </a-card>
    </a-col>
    <a-col :span="19" style="padding-left: 6px">
      <a-card>
        <div class="table-query">
          <a-form layout="inline">
            <a-form-item label="设备名称">
              <a-input v-model:value="queryParam.name" placeholder="请输入设备名称" />
            </a-form-item>
            <a-form-item label="设备编码">
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
          <template #major="{ record }">
            {{ appStore.dictItemValue('biz_major', record.major) }}
          </template>
          <template #updateFrequency="{ record }">
            {{ appStore.dictItemValue('biz_data_update_frequency', record.updateFrequency) }}
          </template>
          <template #operation>
            <a-download ref="downloader" title="导出" description="导出全部数据" @dl="handleExportExcel"></a-download>
            <a-upload
                name="file"
                v-model:file-list="fileList"
                :action="uploadUrl"
                :headers="headers"
                @change="handleChange"
            >
              <a-button type="dashed">
                <import-outlined />
                批量导入
              </a-button>
            </a-upload>
            <a-button @click="downloadTemplate" type="dashed">
              <download-outlined/>
              模版下载
            </a-button>
          </template>
          <template #action="{ record }">
            <a @click="handlePoint(record)">测点描述</a>
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
                    <a-popconfirm title="确认删除吗？" @confirm="handleDel(record)">
                      <a-button type="link" size="small" danger>删除</a-button>
                    </a-popconfirm>
                  </a-menu-item>
                </a-menu>
              </template>
            </a-dropdown>
          </template>
        </b-table>
        <data-directory-edit ref="dataDirectoryEditor" @ok="loadTree"></data-directory-edit>
        <device-edit ref="deviceEditor"></device-edit>
        <Point ref="point" />
      </a-card>
    </a-col>
  </a-row>
</template>
<script setup>
import { Del, Tree } from '@/api/main/dataDirectory'
import { List as ListDevices, Del as DelDevice, Export } from '@/api/main/device'
import DataDirectoryEdit from './DataDirectoryEdit.vue'
import Point from './Point.vue'
import DeviceEdit from './DeviceEdit.vue'
import { toIdNamesParam } from '@/utils/ParamUtils'
import { message } from 'ant-design-vue'
import { useAppStore } from '@/store/app'
import { sortValue, TOKEN_NAME } from '@/utils/constants'

const appStore = useAppStore()
const baseURL = import.meta.env.VITE_API_BASE_URL


const fieldNames = {
  key: 'id',
  title: 'name'
}
const searchValue = ref('')
const treeData = ref([])
const point = ref()
const handlePoint = record => {
  point.value.open(record)
}
watch(searchValue, value => {
})
onMounted(() => {
  loadTree()
})
const loading = ref(false)
const loadTree = () => {
  loading.value = true
  Tree().then(res => {
    treeData.value = res.data
  }).finally(() => {
    loading.value = false
  })
}
const handleTreeSelect = (selectedKeys, e) => {
  if (selectedKeys.length > 0 && e.node.children.length === 0) {
    queryParam.value.dataDirectoryId = selectedKeys[0]
    handleOk()
  }
}
const dataDirectoryEditor = ref()
const onAddClick = (record) => {
  dataDirectoryEditor.value.open(true, {
    sort: sortValue,
    type: appStore.dictItems('biz_data_directory_type')[0].value,
    parentId: record.id
  })
}
const onEditClick = (record) => {
  dataDirectoryEditor.value.open(false, record)
}
const onDelClick = (record) => {
  const idNamesParam = toIdNamesParam(record)
  Del(idNamesParam).then((res) => {
    if (res.success) {
      message.success(res.message)
      loadTree()
    }
  })
}
const fileList = ref([])
const uploadUrl = baseURL + '/devices/import'
const headers = {}
headers[TOKEN_NAME] = localStorage.getItem(TOKEN_NAME)

const handleChange = (info) => {
  if (info.file.status !== 'uploading') {
    // console.log(info.file, info.fileList)
  }
  if (info.file.status === 'done') {
    if (info.file.response.code === 200) {
      message.success(`${info.file.name}导入成功`)
    } else {
      message.error(`${info.file.name}导入失败：${info.file.response.message}`)
    }
    fileList.value = []
  } else if (info.file.status === 'error') {
    message.error(`${info.file.name} file upload failed.`)
  }
}

console.log(headers)
const table = ref()
const queryParam = ref({})
const columns = [
  { title: '设备名称', dataIndex: 'name' },
  { title: '所属场站', dataIndex: 'dataDirectoryName' },
  { title: '专业', dataIndex: 'major' },
  { title: '更新频率', dataIndex: 'updateFrequency' },
  { title: '责任部门', dataIndex: 'orgName' },
  { title: '责任人', dataIndex: 'responsible' },
  { title: '描述', dataIndex: 'description', ellipsis: true },
  { title: '操作', dataIndex: 'action', width: '150px' }
]
const data = (parameter) => {
  return ListDevices(Object.assign(parameter, queryParam.value)).then(res => {
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

const deviceEditor = ref()
const handleAdd = () => {
  deviceEditor.value.open(true, {
    dataType: 'string'
  })
}
const handleEdit = (record) => {
  deviceEditor.value.open(false, record)
}

const handleDel = (record) => {
  const idNamesParam = toIdNamesParam(record)
  DelDevice(idNamesParam).then((res) => {
    if (res.success) {
      message.success(res.message)
      handleOk()
    }
  })
}
const handleBatchDel = (keys, rows) => {
  const idNamesParam = toIdNamesParam(rows)
  DelDevice(idNamesParam).then((res) => {
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
const downloadTemplate = () => {
  location.href = baseURL + '/file/download?fileName=模版.xlsx'
}
</script>
<style scoped>
.ant-tag {
  cursor: pointer;
}
.ant-tree .ant-tree-node-content-wrapper .ant-tree-iconEle {
  color: blue;
}
</style>
