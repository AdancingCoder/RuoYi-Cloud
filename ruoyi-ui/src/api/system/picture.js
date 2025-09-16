import request from '@/utils/request'

// 查询AI图片列表
export function listPicture(query) {
  return request({
    url: '/system/picture/list',
    method: 'get',
    params: query
  })
}

// 查询AI图片详细
export function getPicture(id) {
  return request({
    url: '/system/picture/' + id,
    method: 'get'
  })
}

// 新增AI图片
export function addPicture(data) {
  return request({
    url: '/system/picture',
    method: 'post',
    data: data
  })
}

// 修改AI图片
export function updatePicture(data) {
  return request({
    url: '/system/picture',
    method: 'put',
    data: data
  })
}

// 删除AI图片
export function delPicture(id) {
  return request({
    url: '/system/picture/' + id,
    method: 'delete'
  })
}

// 批量更新审核状态
export function updateAuditStatus(data) {
  return request({
    url: '/system/picture/updateAuditStatus',
    method: 'post',
    data: data,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  })
}