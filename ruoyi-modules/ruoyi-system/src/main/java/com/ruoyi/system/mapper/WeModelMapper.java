package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.WeModel;

/**
 * 模特Mapper接口
 * 
 * @author ruoyi
 * @date 2025-09-13
 */
public interface WeModelMapper 
{
    /**
     * 查询模特
     * 
     * @param id 模特主键
     * @return 模特
     */
    public WeModel selectWeModelById(Long id);

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
     * 删除模特
     * 
     * @param id 模特主键
     * @return 结果
     */
    public int deleteWeModelById(Long id);

    /**
     * 批量删除模特
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWeModelByIds(Long[] ids);
}
