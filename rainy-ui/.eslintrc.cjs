module.exports = {
  env: {
    browser: true,
    es2021: true,
    node: true
  },
  extends: [
    'plugin:vue/vue3-essential',
    'standard',
    './.eslintrc-auto-import.json'
  ],
  overrides: [
  ],
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module'
  },
  plugins: [
    'vue'
  ],
  rules: {
    'vue/multi-word-component-names': 'off',
    'comma-dangle': ['error', {
      arrays: 'never',
      objects: 'never'
    }],
    'no-multiple-empty-lines': [1, { "max": 2 }],
    'semi': 2
  }
}
