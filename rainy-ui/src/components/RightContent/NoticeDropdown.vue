<template>
  <a-popover
      placement="bottomRight"
      overlayClassName="header-notice-wrapper"
      :overlayStyle="{ width: '300px' }"
  >
    <template #content>
      <a-spin :spinning="loading">
        <a-tabs v-model:activeKey="activeKey">
          <a-tab-pane tab="公告" :key="1">
            <a-list>
              <a-list-item v-for="(item, index) in notices" :key="item.title">
                <a-list-item-meta :title="(index+1) + '.' + item.title" :description="item.description"></a-list-item-meta>
              </a-list-item>
            </a-list>
          </a-tab-pane>
          <a-tab-pane tab="待办" :key="2">
            <p>1.小明申请了数据</p>
            <p>2.小明申请了数据</p>
            <p>3.小明申请了数据</p>
          </a-tab-pane>
        </a-tabs>
      </a-spin>
    </template>
    <a-badge :count="count" title="title">
      <bell-outlined style="font-size: 16px; padding: 4px"/>
    </a-badge>
  </a-popover>
</template>

<script setup>
import { EventSourcePolyfill } from 'event-source-polyfill'
import { TOKEN_NAME } from '@/utils/constants.js'

const loading = ref(false)
const count = ref(1)
const activeKey = ref(1)
const notices = ref([
  {
    title: '系统通知',
    description: 'hzzzzzzzzzzzzzzzzzzzzzzzz..............'
  }
])

onMounted(() => {
  getNotices()
})
const baseURL = import.meta.env.VITE_API_BASE_URL
const getNotices = () => {
  const headers = {}
  headers[TOKEN_NAME] = localStorage.getItem(TOKEN_NAME)
  const eventSource = new EventSourcePolyfill(baseURL + '/notices', { headers })
  eventSource.addEventListener('message', e => {
    const jsonArray = JSON.parse(e.data)
    console.log(jsonArray[1].data)
  })
}
</script>

<style lang="less" scoped>
.header-notice-wrapper {
  top: 50px !important;
}
.header-notice{
  display: inline-block;
  transition: all 0.3s;

  span {
    vertical-align: initial;
  }
}
</style>
