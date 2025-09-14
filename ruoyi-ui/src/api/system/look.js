import request from '@/utils/request'

// 查询外观列表
export function listLook(query) {
  return request({
    url: '/system/look/list',
    method: 'get',
    params: query
  })
}

// 查询外观详细
export function getLook(id) {
  return request({
    url: '/system/look/' + id,
    method: 'get'
  })
}

// 新增外观
export function addLook(data) {
  return request({
    url: '/system/look',
    method: 'post',
    data: data
  })
}

// 修改外观
export function updateLook(data) {
  return request({
    url: '/system/look',
    method: 'put',
    data: data
  })
}

// 删除外观
export function delLook(id) {
  return request({
    url: '/system/look/' + id,
    method: 'delete'
  })
}

// 生成外观数据
export function generateLookData() {
  return request({
    url: '/system/look/generateData',
    method: 'post'
  })
}

// 生成look
export function generateLooks(data) {
  return request({
    url: '/system/look/generateLooks',
    method: 'post',
    data: data
  })
}