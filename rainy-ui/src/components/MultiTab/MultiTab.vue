<template>
  <div class="multi-tabs">
    <a-tabs
        v-model:activeKey="activeKey"
        type="editable-card"
        class="ant-multi-tabs"
        hide-add
        @edit="handleTabEdit"
        @tabClick="handleTabClick"
    >
      <template #leftExtra>
        <div class="ant-multi-tabs-arrow" @click="scrollLeft">
          <LeftOutlined />
        </div>
      </template>
      <template #rightExtra>
        <div class="ant-multi-tabs-arrow" @click="scrollRight">
          <right-outlined />
        </div>
      </template>
      <a-tab-pane
          v-for="item in tagList"
          :key="item.fullPath"
          :closable="item.meta.affix">
        <template #tab>
          <a-dropdown :trigger="['contextmenu']">
            <div>
              {{item.meta.title}}
            </div>
            <template #overlay>
              <a-menu>
                <a-menu-item @click="refresh">
                  <reload-outlined  /> 刷新
                </a-menu-item>
                <a-menu-item @click="closeAll">
                  <close-outlined /> 关闭其他标签
                </a-menu-item>
                <a-menu-item >
                  <a :href="item.fullPath" target="_blank">
                    <select-outlined /> 在新的窗口中打开
                  </a>
                </a-menu-item>
              </a-menu>
            </template>
          </a-dropdown>
        </template>
      </a-tab-pane>
    </a-tabs>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()

const indexRouter = {
  fullPath: '/workbench',
  meta: {
    title: '首页',
    affix: false
  }
}

const tagList = ref([])
const activeKey = ref()

watch(
  router.currentRoute,
  (e) => {
    addTag(e)
  }
)
onMounted(() => {
  addTag(indexRouter)
  addTag(router.currentRoute.value)
})


const addTag = tag => {
  const exists = tagList.value.find(r => {
    return r.fullPath === tag.fullPath
  })
  if (!exists) {
    tagList.value.push(tag)
  }
  activeKey.value = tag.fullPath
}

const handleTabClick = (fullPath) => {
  router.push(fullPath)
}
const handleTabEdit = (fullPath) => {
  // 只剩下一个标签时，什么都不做
  if (tagList.value.length === 1) {
    return
  }
  // 找到要删除的标签
  const removeTag = tagList.value.find(tag => tag.fullPath === fullPath)
  tagList.value.forEach((item, index) => {
    if (item.fullPath === removeTag.fullPath) {
      tagList.value.splice(index, 1)
    }
  })
  // 如果要删除的标签时当前标签，跳转到最后一个标签页
  if (activeKey.value === fullPath) {
    const lastTag = tagList.value.slice(-1)[0]
    router.push(lastTag.fullPath)
  }
}

const scrollLeft = () => {
}
const scrollRight = () => {
}
const refresh = () => {
}
const closeAll = () => {
}
</script>

<style lang="less">
.ant-multi-tabs {
  &.ant-tabs {
    background: white;
    box-shadow: var(--ant-primary-color);
    z-index: 99;
    .ant-tabs-nav {
      margin-bottom: 0;
      .ant-tabs-extra-content {
        display: flex;
      }
      .ant-tabs-nav-wrap {
        .ant-tabs-ink-bar {
          visibility: visible;
        }
        .ant-tabs-tab-with-remove {
          padding-right: 4px;
        }
        .ant-tabs-tab {
          background: none;
          height: 40px;
          line-height: 40px;
          transition: background-color 0.3s, color 0.3s;
          padding: 0 16px;
          border-radius: 0;
          border: none;
          margin: 0;
          .ant-tabs-tab-remove {
            margin: 0;
            padding: 0 5px;
          }
        }
        .ant-tabs-tab-active {
          background: var(--ant-primary-1);
        }
      }
    }

    .ant-multi-tabs-drop,
    .ant-multi-tabs-arrow,
    .ant-tabs-nav-operations .ant-tabs-nav-more {
      padding: 0;
      width: 40px;
      height: 40px;
      line-height: 40px;
      text-align: center;
      cursor: pointer;
    }
  }
}
</style>
