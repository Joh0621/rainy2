<template>
  <a-row :gutter="16">
    <a-col :span="6">
      <a-card :bordered="false">
        <a-statistic
            title="我的申请"
            :value="count[3]"
            :value-style="{ color: 'blue', cursor: 'pointer' }">
          <template #formatter="record">
            <router-link to="/apply">
              {{ record.value }}
            </router-link>
          </template>
        </a-statistic>
      </a-card>
    </a-col>
    <a-col :span="6">
      <a-card :bordered="false">
        <a-statistic
            @click="Count"
            title="我的待办"
            :value="count[4]"
            :value-style="{ color: 'blue', cursor: 'pointer' }">
          <template #formatter="record">
            <router-link to="/workflow/task/todo">
              {{ record.value }}
            </router-link>
          </template>
        </a-statistic>
      </a-card>
    </a-col>
    <a-col :span="4">
      <a-card :bordered="false">
        <a-statistic
            title="接入场站"
            :value="count[0]"
            suffix="个"
            :value-style="{ color: 'red' }">
        </a-statistic>
      </a-card>
    </a-col>
    <a-col :span="4">
      <a-card>
        <a-statistic
            title="接入设备"
            :value="count[1]"
            suffix="台"
            :value-style="{ color: 'blue' }">
        </a-statistic>
      </a-card>
    </a-col>
    <a-col :span="4">
      <a-card :bordered="false">
        <a-statistic
            title="接入测点"
            :value="count[2]"
            suffix="个"
            :value-style="{ color: '#3f8600' }">
        </a-statistic>
      </a-card>
    </a-col>
  </a-row>
  <a-row class="margin-t16" :gutter="16">
    <a-col :span="12">
      <a-card :bordered="false">
        <a-radio-group style="float: right" v-model:value="deviceType" @change="deviceCount">
          <a-radio-button style="z-index: 99" :value="0">场站</a-radio-button>
          <a-radio-button style="z-index: 99" :value="1">专业</a-radio-button>
        </a-radio-group>
        <pie-chart :height="300" :options="pieOptions"/>
      </a-card>
    </a-col>
    <a-col :span="12">
      <a-card :bordered="false">
        <a-radio-group style="float: right" v-model:value="pointType" @change="pointCount">
          <a-radio-button style="z-index: 99" :value="0">场站</a-radio-button>
          <a-radio-button style="z-index: 99" :value="1">专业</a-radio-button>
        </a-radio-group>
        <bar-chart :height="300" :options="barOptions"/>
      </a-card>
    </a-col>
  </a-row>
  <a-row class="margin-t16" :gutter="16">
    <a-col :span="8">
      <a-card :bordered="false">
        <pie-chart :height="300" :options="apiCount"/>
      </a-card>
    </a-col>
    <a-col :span="8">
      <a-card :bordered="false">
        <pie-chart :height="300" :options="apiResponseTime"/>
      </a-card>
    </a-col>
    <a-col :span="8">
      <a-card :bordered="false">
        <pie-chart :height="300" :options="apiDataSize"/>
      </a-card>
    </a-col>
  </a-row>
</template>

<script setup>
import { Count, PointCount, DeviceCount } from '@/api/main/dashboard'
import { useAppStore } from '@/store/app'
const appStore = useAppStore()

onMounted(() => {
  loadCount()
  deviceCount()
  pointCount()
})

// 数量统计
const count = ref([0, 0, 0])
const loadCount = () => {
  Count().then(res => {
    count.value = res.data
  })
}

// 设备数量统计
const pieOptions = ref({
  title: {
    text: '设备数量统计',
    left: 'center'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: '设备数量',
      type: 'pie',
      radius: '50%',
      data: [
        { value: 53, name: '鲁能迎风岭' },
        { value: 45, name: '天桥山' },
        { value: 45, name: '大苏计' },
        { value: 34, name: '金阳风光储' }
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
})

const deviceType = ref(0)
const deviceCount = () => {
  const param = {
    type: deviceType.value
  }
  DeviceCount(param).then(res => {
    const data = []
    res.data.forEach(r => {
      data.push({
        name: deviceType.value === 0 ? r.name : appStore.dictItemValue('biz_major', r.name),
        value: r.count
      })
    })
    pieOptions.value.series[0].data = data
  })
}

// 测点数量统计
const barOptions = ref({
  title: {
    text: '测点数量统计'
  },
  tooltip: {},
  xAxis: {
    data: ['鲁能迎风岭', '天桥山', '大苏计', '金阳风光储']
  },
  yAxis: {},
  series: [
    {
      name: '测点数量',
      type: 'bar',
      data: []
    }
  ]
})

const pointType = ref(0)
const pointCount = () => {
  const param = {
    type: pointType.value
  }
  PointCount(param).then(res => {
    const x = []
    const y = []
    res.data.forEach(r => {
      x.push(pointType.value === 0 ? r.name : appStore.dictItemValue('biz_major', r.name))
      // x.push(r.name)
      y.push(r.count)
    })
    barOptions.value.xAxis.data = x
    barOptions.value.series[0].data = y
  })
}

// 接口调用次数统计
const apiCount = ref({
  title: {
    text: '接口调用次数统计',
    left: 'right'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: '设备数量',
      type: 'pie',
      radius: '50%',
      data: [
        { value: 53, name: '实时数据接口' },
        { value: 34, name: '历史数据接口' }
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
})

// 接口调用次数统计
const apiResponseTime = ref({
  title: {
    text: '接口响应时长统计',
    left: 'right'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: '设备数量',
      type: 'pie',
      radius: '50%',
      data: [
        { value: 53, name: '实时数据接口' },
        { value: 34, name: '历史数据接口' }
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
})

// 接口调用次数统计
const apiDataSize = ref({
  title: {
    text: '接口数据传输量统计',
    left: 'right'
  },
  tooltip: {
    trigger: 'item'
  },
  legend: {
    orient: 'vertical',
    left: 'left'
  },
  series: [
    {
      name: '设备数量',
      type: 'pie',
      radius: '50%',
      data: [
        { value: 53, name: '实时数据接口' },
        { value: 34, name: '历史数据接口' }
      ],
      emphasis: {
        itemStyle: {
          shadowBlur: 10,
          shadowOffsetX: 0,
          shadowColor: 'rgba(0, 0, 0, 0.5)'
        }
      }
    }
  ]
})
</script>

<style scoped>

</style>
