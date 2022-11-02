import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { fileURLToPath, URL } from 'url'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { AntDesignVueResolver } from 'unplugin-vue-components/resolvers'
import eslintPlugin from 'vite-plugin-eslint'
import Less2CssVariablePlugin from 'antd-less-to-css-variable'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    hmr: true,
    port: 8000,
    proxy: {
      '/api': {
        target: 'http://24.43.102.213/'
      }
    }
  },
  plugins: [
    vue(),
    AutoImport({
      dts: 'src/auto-imports.d.ts',
      imports: ['vue', 'vue-router'],
      eslintrc: {
        enabled: true,
        filepath: './.eslintrc-auto-import.json',
        globalsPropValue: true
      }
    }),
    Components({
      dts: 'src/components.d.ts',
      deep: true,
      dirs: ['src/components'],
      extensions: ['vue'],
      resolvers: [AntDesignVueResolver({
        resolveIcons: true,
        importStyle: false
      })]
    }),
    eslintPlugin({ cache: false })
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  css: {
    preprocessorOptions: {
      less: {
        // DO NOT REMOVE THIS LINE
        javascriptEnabled: true,
        plugins: [new Less2CssVariablePlugin()]
      }
    }
  },
  optimizeDeps: {
    include: [
      '@ant-design/icons-vue',
      'ant-design-vue'
    ]
  }
})
