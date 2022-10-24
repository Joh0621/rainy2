<template>
  <a-row :gutter="16">
    <a-col :span="12">
      <a-card>
        <bar-chart :height="300" :options="barOptions"/>
      </a-card>
    </a-col>
    <a-col :span="12">
      <a-card :bordered="false">
        <pie-chart :height="300" :options="pieOptions"/>
      </a-card>
    </a-col>
  </a-row>
</template>

<script setup>
const barOptions = ref({
  title: {
    text: '接入场站'
  },
  tooltip: {},
  xAxis: {
    data: ['衬衫', '羊毛衫', '雪纺衫', '裤子', '高跟鞋', '袜子']
  },
  yAxis: {},
  series: [
    {
      name: '销量',
      type: 'bar',
      data: [5, 20, 36, 10, 10, 20]
    }
  ]
})
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
</script>

<style scoped>

</style>
