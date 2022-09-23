import '@ant-design-vue/pro-layout/dist/style.css'
import 'ant-design-vue/dist/antd.variable.min.css'

import { createApp } from 'vue'
import { ConfigProvider } from 'ant-design-vue'
import { ProLayout, PageContainer } from '@ant-design-vue/pro-layout'
import { createPinia } from 'pinia'
import router from '@/router'
import App from '@/App.vue'

import '@/router/permission'

const app = createApp(App)
app.use(createPinia())
app.use(router)
app.use(ConfigProvider)
app.use(ProLayout).use(PageContainer)
app.mount('#app')
