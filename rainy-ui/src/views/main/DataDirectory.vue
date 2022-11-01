<template>
  <a-row :gutter="16">
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
            <a-form-item>
              <a-input style="width: 300px" v-model:value="queryParam.name" placeholder="请输入设备名称/测点名称" />
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
            <a-radio-group v-model:value="queryParam.major" @change="handleOk">
              <a-radio-button :key="item.value" v-for="item in appStore.dictItems('biz_major')" :value="item.value">
                {{item.name}}
              </a-radio-button>
            </a-radio-group>
            <a-button @click="batchApply" style="margin-left: 10px" type="primary">批量申请</a-button>
          </div>
        </div>
        <a-spin :spinning="dataLoading">
          <div>
            <a-checkbox v-model:checked="checkAll"
                        :indeterminate="indeterminate"
                        @change="onCheckAllChange">全选</a-checkbox>
          </div>
          <a-checkbox-group v-model:value="checkedList">
            <a-list item-layout="vertical" size="large" :pagination="pagination" :data-source="listData">
              <template #renderItem="{ item }">
                <a-list-item :key="item.id">
                  <a-checkbox :value="item.id" style="float: left;margin-right: 10px" @change="handleChange"></a-checkbox>
                  <a-list-item-meta :description="item.description">
                    <template #title>
                      <router-link :to="`/device/${item.id}`">
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
          </a-checkbox-group>
        </a-spin>
      </a-card>
    </a-col>
  </a-row>
  <BatchApplyData ref="batchApplyData" />
</template>
<script setup>
import BatchApplyData from './BatchApplyData.vue'
import { Tree } from '@/api/main/dataDirectory'
import { List as ListDevices } from '@/api/main/device'
import { useAppStore } from '@/store/app'
import router from '@/router/index'
import { message } from 'ant-design-vue'
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
  clearCheckAll()
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
const queryParam = ref({
  name: router.currentRoute.value.query.s
})
watch(
  router.currentRoute,
  (e) => {
    queryParam.value.name = router.currentRoute.value.query.s
  }
)
const listData = ref([])
const pagination = {
  onChange: (page, size) => {
    listDevices(page, size)
  },
  current: 1,
  pageSize: 4,
  total: 0
}


const ids = ref([])
const checkedList = ref(ids.value)
const checkAll = ref(false)
const indeterminate = ref(false)
const onCheckAllChange = e => {
  if (checkAll.value) {
    checkedList.value = ids.value
  } else {
    clearCheckAll()
  }
}
watch(
  checkedList,
  val => {
    if (checkedList.value.length === ids.value.length) {
      checkAll.value = true
      indeterminate.value = false
    } else if (checkedList.value.length === 0) {
      checkAll.value = false
      indeterminate.value = false
    } else {
      checkAll.value = false
      indeterminate.value = true
    }
  }
)
const clearCheckAll = () => {
  checkedList.value = []
}
const handleChange = () => {
  // console.log(toRaw(checkedList.value))
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
    ids.value = res.data.records.map(r => r.id)
  }).finally(() => {
    setTimeout(() => {
      dataLoading.value = false
    }, 100)
  })
}

const batchApplyData = ref()
const batchApply = () => {
  if (checkedList.value.length === 0) {
    message.warn('请选择您想要申请的数据')
  } else {
    batchApplyData.value.open(checkedList.value)
  }
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
.ant-list-lg .ant-list-item {
  padding: 16px 0 0 0;
}
.data-title {
  color:#1890ff
}
.ant-checkbox-group {
  width: 100%;
}
</style>
