<template>
  <a-row :gutter="16">
    <a-col :span="12">
      <a-card>
        <a-statistic
          title="我的待办"
          :value="1"
          :precision="0"
          suffix="%"
          :value-style="{ color: '#3f8600' }"
          style="margin-right: 50px"
        >
          <template #prefix>
            <arrow-up-outlined />
          </template>
        </a-statistic>
      </a-card>
    </a-col>
    <a-col :span="12">
      <a-card>
        <a-statistic
          title="我的申请"
          :value="9.3"
          :precision="2"
          suffix="%"
          class="demo-class"
          :value-style="{ color: '#cf1322' }"
        >
          <template #prefix>
            <arrow-down-outlined />
          </template>
        </a-statistic>
      </a-card>
    </a-col>
  </a-row>
</template>
<script>
import { ArrowUpOutlined, ArrowDownOutlined } from '@ant-design/icons-vue'
import { defineComponent } from 'vue'
export default defineComponent({
  components: {
    ArrowUpOutlined,
    ArrowDownOutlined
  }
})
</script>
