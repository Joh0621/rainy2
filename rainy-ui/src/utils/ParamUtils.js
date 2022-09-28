const toIdNameParam = (record) => {
  return {
    id: record.id,
    name: record.name
  }
}

const toIdNamesParam = (record) => {
  const ids = []
  const names = []
  if (Array.isArray(record)) {
    for (let i = 0; i < record.length; i++) {
      const raw = toRaw(record[i])
      ids.push(raw.id)
      if (raw.name) {
        names.push(raw.name)
      } else {
        names.push(raw.value)
      }
    }
  }
  if (Object.prototype.toString.call(record) === '[object Object]') {
    ids.push(record.id)
    if (record.name) {
      names.push(record.name)
    } else {
      names.push(record.value)
    }
  }
  return {
    ids,
    names
  }
}

export {
  toIdNameParam,
  toIdNamesParam
}
