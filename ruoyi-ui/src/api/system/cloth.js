import request from '@/utils/request'

// 查询服装列表
export function listCloth(query) {
  return request({
    url: '/system/cloth/list',
    method: 'get',
    params: query
  })
}

// 查询服装详细
export function getCloth(id) {
  return request({
    url: '/system/cloth/' + id,
    method: 'get'
  })
}

// 新增服装
export function addCloth(data) {
  return request({
    url: '/system/cloth',
    method: 'post',
    data: data
  })
}

// 修改服装
export function updateCloth(data) {
  return request({
    url: '/system/cloth',
    method: 'put',
    data: data
  })
}

// 删除服装
export function delCloth(id) {
  return request({
    url: '/system/cloth/' + id,
    method: 'delete'
  })
}

// 上传look图
export function uploadLook(data) {
  return request({
    url: '/system/cloth/uploadLook',
    method: 'post',
    data: data,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}