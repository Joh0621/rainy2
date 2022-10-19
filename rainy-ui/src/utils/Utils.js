export function timeFix () {
  const time = new Date()
  const hour = time.getHours()
  return hour < 9 ? '早上好' : hour <= 11 ? '上午好' : hour <= 13 ? '中午好' : hour < 20 ? '下午好' : '晚上好'
}

export const download = (res) => {
  try {
    const blob = new Blob([res.data], { type: 'application/octet-stream;charset=UTF-8' })
    // 需要后台设置 header  Access-Control-Expose-Headers: Content-Disposition
    const contentDisposition = res.headers['content-disposition']
    const pattern = /filename=([^;]+\.[^.;]+);*/
    const result = pattern.exec(contentDisposition)
    const filename = result[1]
    const downloadElement = document.createElement('a')
    const href = window.URL.createObjectURL(blob) // 创建下载的链接
    const reg = /^["](.*)["]$/g
    downloadElement.style.display = 'none'
    downloadElement.href = href
    downloadElement.download = decodeURI(filename.replace(reg, '$1')) // 下载后文件名
    document.body.appendChild(downloadElement)
    downloadElement.click() // 点击下载
    document.body.removeChild(downloadElement) // 下载完成移除元素
    window.URL.revokeObjectURL(href)
  } catch (e) {
    console.error(e)
  }
}
