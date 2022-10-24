<template>

  <a-row>
    <a-col :span="5">
      <a-menu
          :style="style"
          v-model:selectedKeys="selectedKeys"
          mode="inline"
          theme="light"
      >
        <a-menu-item :key="1">
          <template #icon>
            <MailOutlined />
          </template>
          基本设置
        </a-menu-item>
        <a-menu-item :key="2">
          <template #icon>
            <CalendarOutlined />
          </template>
          安全设置
        </a-menu-item>
      </a-menu>
    </a-col>

    <a-col :span="19">
      <a-card v-if="selectedKeys[0] === 1" title="基本设置">
        <Basic/>
      </a-card>
      <a-card v-if="selectedKeys[0] === 2" title="安全设置">
        <a-button type="primary">修改密码</a-button>
      </a-card>
    </a-col>
  </a-row>
</template>

<script setup>
import Basic from '@/views/system/account/Basic.vue'

const selectedKeys = ref([1])
const style = 'height: ' + (document.documentElement.clientHeight - 200) + 'px'
</script>

<style lang="less" scoped>
.account-center-avatarHolder {
  text-align: center;
  margin-bottom: 24px;
  & > .avatar {
    margin: 0 auto;
    height: 84px;
    border-radius: 50%;
    overflow: hidden;
    img {
      height: 100%;
      width: 100%;
    }
  }
  .username {
    font-size: 20px;
    line-height: 28px;
    font-weight: 500;
    margin-bottom: 4px;
  }
}

.account-center-detail {
  p {
    margin-bottom: 8px;
    padding-left: 26px;
    position: relative;
  }
  i {
    position: absolute;
    height: 14px;
    width: 14px;
    left: 0;
    top: 4px;
    background: url(https://gw.alipayobjects.com/zos/rmsportal/pBjWzVAHnOOtAUvZmZfy.svg);
  }
  .title {
    background-position: 0 0;
  }
  .group {
    background-position: 0 -22px;
  }
  .address {
    background-position: 0 -44px;
  }
}
.teamTitle {
  font-weight: 500;
  margin-bottom: 12px;
}
.account-center-team {
  .members {
    a {
      display: block;
      margin: 12px 0;
      line-height: 24px;
      height: 24px;
      .member {
        font-size: 14px;
        line-height: 24px;
        max-width: 100px;
        vertical-align: top;
        margin-left: 12px;
        transition: all 0.3s;
        display: inline-block;
      }
    }
  }
}
</style>
