package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.WeModel;

/**
 * 模特Service接口
 * 
 * @author ruoyi
 * @date 2025-09-13
 */
public interface IWeModelService 
{
    /**
     * 查询模特
     * 
     * @param id 模特主键
     * @return 模特
     */
    public WeModel selectWeModelById(Long id);
    
    /**
     * 根据外部ID查询模特
     * 
     * @param modelWeId 模特外部ID
     * @return 模特
     */
    public WeModel selectWeModelByWeId(String modelWeId);

    /**
     * 查询模特列表
     * 
     * @param weModel 模特
     * @return 模特集合
     */
    public List<WeModel> selectWeModelList(WeModel weModel);

    /**
     * 新增模特
     * 
     * @param weModel 模特
     * @return 结果
     */
    public int insertWeModel(WeModel weModel);

    /**
     * 修改模特
     * 
     * @param weModel 模特
     * @return 结果
     */
    public int updateWeModel(WeModel weModel);

    /**
     * 批量删除模特
     * 
     * @param ids 需要删除的模特主键集合
     * @return 结果
     */
    public int deleteWeModelByIds(Long[] ids);

    /**
     * 删除模特信息
     * 
     * @param id 模特主键
     * @return 结果
     */
    public int deleteWeModelById(Long id);
}