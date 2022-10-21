<template>
  <a-row :gutter="24">
    <a-col :span="5">
      <a-card>
        <a-skeleton :loading="loading">
          <a-directory-tree
              :fieldNames="fieldNames"
              :show-icon="true"
              :tree-data="treeData"
              :selectedKeys="[queryParam.dataDirectoryId]"
              @select="handleTreeSelect"
              defaultExpandAll>
          </a-directory-tree>
        </a-skeleton>
      </a-card>
    </a-col>
    <a-col :span="19" style="padding-left: 6px">
      <a-card>
        <div class="table-query">
          <a-form layout="inline">
<!--            <a-form-item label="设备名称">-->
<!--              <a-input v-model:value="queryParam.name" placeholder="请输入设备名称" />-->
<!--            </a-form-item>-->
<!--            <a-form-item label="设备编码">-->
<!--              <a-input v-model:value="queryParam.code" placeholder="请输唯一编码" />-->
<!--            </a-form-item>-->
            <a-form-item>
              <a-input style="width: 300px" v-model:value="queryParam.name" placeholder="请输入设备名称/设备编码/测点名称" />
            </a-form-item>
            <a-form-item>
            </a-form-item>
            <a-form-item>
              <a-space>
                <a-button type="primary" @click="handleOk">查询</a-button>
                <a-button @click="handleReset">重置</a-button>
              </a-space>
            </a-form-item>
          </a-form>
          <div style="margin-top: 12px">
            专业：
            <a-radio-group size="default" v-model:value="queryParam.major" @change="handleOk">
              <a-radio-button :key="item.value" v-for="item in appStore.dictItems('biz_major')" :value="item.value">
                {{item.name}}
              </a-radio-button>
            </a-radio-group>
          </div>
        </div>
        <a-spin :spinning="dataLoading">
          <a-list item-layout="vertical" size="large" :pagination="pagination" @change="handleChange" :data-source="listData">
            <template #renderItem="{ item }">
              <a-list-item :key="item.id">
                <a-list-item-meta :description="item.description">
                  <template #title>
                    <router-link :to="`/device/${item.code}`">
                      <a class="data-title">{{ item.name }}</a>
                    </router-link>
                    <a-divider type="vertical"/>
                    <a-tag color="orange">
                      {{ appStore.dictItemValue('biz_major', item.major ) }}
                    </a-tag>
                  </template>
                </a-list-item-meta>
                {{ item.content }}
              </a-list-item>
            </template>
          </a-list>
        </a-spin>
      </a-card>
    </a-col>
  </a-row>
</template>
<script setup>
import { Tree } from '@/api/main/dataDirectory'
import { List as ListDevices } from '@/api/main/device'
// import { StarOutlined, LikeOutlined, MessageOutlined } from '@ant-design/icons-vue'
import { useAppStore } from '@/store/app'
const appStore = useAppStore()

const fieldNames = {
  key: 'id',
  title: 'name'
}

onMounted(() => {
  loadTree()
  listDevices(1)
})

const handleOk = () => {
  listDevices()
}
const handleReset = () => {
  queryParam.value = {}
  handleOk()
}

const loading = ref(false)
const treeData = ref([])
const loadTree = () => {
  loading.value = true
  Tree().then(res => {
    treeData.value = res.data
  }).finally(() => {
    setTimeout(() => {
      loading.value = false
    }, 100)
  })
}
const handleTreeSelect = (selectedKeys, e) => {
  if (selectedKeys.length > 0 && e.node.children.length === 0) {
    queryParam.value.dataDirectoryId = selectedKeys[0]
    handleOk()
  }
}

const dataLoading = ref(false)
const queryParam = ref({})
const listData = ref([])
const pagination = {
  onChange: (page, size) => {
    listDevices(page, size)
  },
  current: 1,
  pageSize: 4,
  total: 0
}

const handleChange = p => {
  console.log(p)
}

const listDevices = (current, size) => {
  queryParam.value.current = current
  queryParam.value.size = size
  dataLoading.value = true
  ListDevices(queryParam.value).then(res => {
    listData.value = res.data.records
    pagination.current = res.data.current
    pagination.pageSize = res.data.size
    pagination.total = res.data.total
  }).finally(() => {
    setTimeout(() => {
      dataLoading.value = false
    }, 100)
  })
}
</script>
<style scoped>
.ant-tag {
  cursor: pointer;
}
.ant-tree .ant-tree-node-content-wrapper .ant-tree-iconEle {
  color: blue;
}
.ant-list-item {
  padding-left: 4px;
}
.data-title {
  color:#1890ff
}
</style>
