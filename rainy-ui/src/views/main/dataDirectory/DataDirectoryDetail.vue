<template>
  <a-card>
    <a-card-meta title="风机01" description="数据主要包含功率，风速，电压，电流。。。" />
    <div style="margin-bottom: 8px"></div>
    <a-tabs v-model:activeKey="activeKey">
      <a-tab-pane key="0" tab="基本信息">
        <a-descriptions>
          <a-descriptions-item label="所属所">新能源</a-descriptions-item>
          <a-descriptions-item label="设备名称">风机001</a-descriptions-item>
          <a-descriptions-item label="数据量">1.2T</a-descriptions-item>
          <a-descriptions-item label="数据点个数">200个</a-descriptions-item>
          <a-descriptions-item label="Remark">empty</a-descriptions-item>
          <a-descriptions-item label="描述">
            新能源场站数据
          </a-descriptions-item>
        </a-descriptions>
      </a-tab-pane>
      <a-tab-pane key="1" tab="数据点码">
        <a-table :columns="columns" :data-source="data" bordered>
          <template #bodyCell="{ column, text }">
            <template v-if="column.dataIndex === 'name'">
              <a>{{ text }}</a>
            </template>
          </template>
        </a-table>
      </a-tab-pane>
      <a-tab-pane key="2" tab="数据预览" force-render>
        <a-table :columns="columns" :data-source="data" bordered>
          <template #bodyCell="{ column, text }">
            <template v-if="column.dataIndex === 'name'">
              <a>{{ text }}</a>
            </template>
          </template>
        </a-table>
      </a-tab-pane>
      <a-tab-pane key="3" tab="血缘关系">Content of Tab Pane 3</a-tab-pane>
    </a-tabs>
    <div>
      <a-button type="primary" primary>申请</a-button>
    </div>
  </a-card>
</template>
<script setup>
const activeKey = ref('0')
const columns = [
  {
    title: '序号',
    dataIndex: 'name'
  },
  {
    title: '点码',
    className: 'column-money',
    dataIndex: 'money'
  },
  {
    title: '描述',
    dataIndex: 'address'
  }
]
const data = [
  {
    key: '1',
    name: '1',
    money: '010010010001',
    address: '日发电量'
  },
  {
    key: '2',
    name: '2',
    money: '010010010001',
    address: '月发电量'
  },
  {
    key: '3',
    name: '3',
    money: '010010010001',
    address: '功率'
  }
]
</script>
