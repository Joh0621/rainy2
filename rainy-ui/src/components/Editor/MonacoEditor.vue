<template>
  <div style="height: 400px;margin: 2px" ref="container"></div>
</template>
<script setup>
import * as monaco from 'monaco-editor/esm/vs/editor/editor.api'
import jsonWorker from 'monaco-editor/esm/vs/language/json/json.worker?worker'
import cssWorker from 'monaco-editor/esm/vs/language/css/css.worker?worker'
import htmlWorker from 'monaco-editor/esm/vs/language/html/html.worker?worker'
import tsWorker from 'monaco-editor/esm/vs/language/typescript/ts.worker?worker'
import EditorWorker from 'monaco-editor/esm/vs/editor/editor.worker?worker'

self.MonacoEnvironment = {
  getWorker (label) {
    if (label === 'json') {
      return new jsonWorker()
    }
    if (label === 'css' || label === 'scss' || label === 'less') {
      return new cssWorker()
    }
    if (label === 'html' || label === 'handlebars' || label === 'razor') {
      return new htmlWorker()
    }
    if (['typescript', 'javascript'].includes(label)) {
      return new tsWorker()
    }
    return new EditorWorker()
  }
}
const props = defineProps({
  options: {
    value: '', // 编辑器初始显示文字
    language: 'sql', // 此处使用的python，其他语言支持自行查阅demo
    roundedSelection: false,
    scrollBeyondLastLine: false,
    theme: 'vs-dark'
  }
})
const emits = defineEmits(['change'])
const container = ref()
onMounted(() => {
  const editor = monaco.editor.create(container.value, props.options)
  editor.onDidChangeModelContent(() => {
    emits('change', editor.getValue())
  })
})

</script>
