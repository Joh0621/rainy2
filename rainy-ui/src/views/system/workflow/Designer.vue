<template>
  <iframe src="/designer.html" :style="style"></iframe>
</template>

<script setup>
const style = ref(
  'width: 100%; height: ' +
  (document.documentElement.clientHeight - 120) +
  'px; border: 0; overflow: hidden; box-shadow: 2px 0 6px rgb(0 21 41 / 35%)'
)
</script>

