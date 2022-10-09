<template>
  <a-row :gutter="24" style="margin-top: 16px">
    <a-col :span="18">
      <a-card>
        <a-card-meta :title="userStore.nickName" description="组织机构">
          <template #avatar>
            <a-avatar
                :src="userStore.avatar"
                size="large"
                :style="{ verticalAlign: 'middle' }"
            >
              {{ userStore.avatar }}
            </a-avatar>
          </template>
        </a-card-meta>
      </a-card>
      <a-row :gutter="24" style="margin-top: 16px">
        <a-col :span="12">
          <a-card title="登录日志">
            <template #extra>
              <router-link to="/log/login">更多</router-link>
            </template>
            <a-timeline>
              <a-timeline-item v-for="item in loginLogs" :key="item.id" :value="item.id">
                {{ item.datetime }}
                {{ item.username }}
                {{ appStore.dictItemValue('sys_login_type', item.type) }}
                <br/>
                <span class="ant-card-meta-description">
            {{ item.ip }}
            {{ item.browser }}
            {{ item.os }}
            </span>
              </a-timeline-item>
            </a-timeline>
          </a-card>
        </a-col>
        <a-col class="operation-log" :span="12">
          <a-card title="操作日志">
            <template #extra>
              <router-link to="/log/operation">更多</router-link>
            </template>
            <a-timeline>
              <a-timeline-item v-for="item in operationLogs" :key="item.id" :value="item.id">
                {{ item.datetime }}
                {{ item.username }}
                {{ item.detail }}
              </a-timeline-item>
            </a-timeline>
          </a-card>
        </a-col>
      </a-row>
    </a-col>
    <a-col :span="6">
    </a-col>
  </a-row>
</template>
<script setup>
import { useUserStore } from '@/store/user'
import { useAppStore } from '@/store/app'
import { List } from '@/api/log/loginLog'
import { List as ListOperationLogs } from '@/api/log/OperationLog'

const userStore = useUserStore()
const appStore = useAppStore()


onMounted(() => {
  listLoginLogs()
  listOperationLogs()
})

const loginLogs = ref([])
const listLoginLogs = () => {
  const param = { current: 1, size: 6 }
  List(param).then(res => {
    loginLogs.value = res.data.records
  })
}

const operationLogs = ref([])
const listOperationLogs = () => {
  const param = { current: 1, size: 6 }
  ListOperationLogs(param).then(res => {
    operationLogs.value = res.data.records
  })
}
</script>
<style scoped>
.operation-log {
  padding-left: 0;
}
</style>
