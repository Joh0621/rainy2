<template>
  <a-row :gutter="24">
    <a-col :md="24" :lg="7" style="padding-right: 0">
      <a-card :bordered="false">
        <div class="account-center-avatarHolder">
          <div class="avatar">
            <img :src="userStore.avatar" />
            <a>
              <div class="mask"><upload-outlined /></div>
            </a>
          </div>
          <div class="username">{{ userStore.userinfo.username }}</div>
<!--          <div class="bio">{{ userStore.nickName }}</div>-->
        </div>
        <div class="account-center-detail">
          <p><i class="title"></i>{{ userStore.nickName }}</p>
          <p><i class="group"></i>{{ userStore.userinfo.org }}</p>
          <p>
            <i class="address"></i>
            <span>{{ userStore.userinfo.username }}</span>
          </p>
        </div>
      </a-card>
    </a-col>

    <a-col :md="24" :lg="17">
      <a-card
          :bordered="false"
          style="width: 100%"
          :tab-list="tabs"
          :active-tab-key="activeKey"
          @tabChange="(key) => handleTabChange(key)"
      >
        <p v-if="activeKey === 'basic'">
          <Basic/>
        </p>
      </a-card>
    </a-col>
  </a-row>
</template>

<script setup>
import { useUserStore } from '@/store/user'
import Basic from '@/views/system/account/Basic.vue'

const userStore = useUserStore()

const tabs = [
  {
    key: 'basic',
    tab: '基本信息'
  },
  {
    key: 'account',
    tab: '账号中心'
  }
]
const activeKey = ref('basic')
const handleTabChange = key => {
  activeKey.value = key
}
</script>

<style lang="less" scoped>
.account-center-avatarHolder {
  text-align: center;
  margin-bottom: 24px;
  & > .avatar {
    margin: 0 auto;
    width: 104px;
    height: 104px;
    margin-bottom: 20px;
    border-radius: 50%;
    overflow: hidden;
    img {
      height: 100%;
      width: 100%;
    }
  }
  .mask {
    border-radius: 50%;
    position: absolute;
    margin-top: -104px;
    width: 104px;
    height: 104px;
    background: rgba(101, 101, 101, 0.6);
    color: #ffffff;
    opacity: 0;
    font-size: 25px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .avatar a:hover .mask {
    opacity: 1;
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
