package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WeModelMapper;
import com.ruoyi.system.domain.WeModel;
import com.ruoyi.system.service.IWeModelService;

/**
 * 模特Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-09-13
 */
@Service
public class WeModelServiceImpl implements IWeModelService 
{
    @Autowired
    private WeModelMapper weModelMapper;

    /**
     * 查询模特
     * 
     * @param id 模特主键
     * @return 模特
     */
    @Override
    public WeModel selectWeModelById(Long id)
    {
        return weModelMapper.selectWeModelById(id);
    }
    
    /**
     * 根据外部ID查询模特
     * 
     * @param modelWeId 模特外部ID
     * @return 模特
     */
    @Override
    public WeModel selectWeModelByWeId(String modelWeId)
    {
        return weModelMapper.selectWeModelByWeId(modelWeId);
    }

    /**
     * 查询模特列表
     * 
     * @param weModel 模特
     * @return 模特
     */
    @Override
    public List<WeModel> selectWeModelList(WeModel weModel)
    {
        return weModelMapper.selectWeModelList(weModel);
    }

    /**
     * 新增模特
     * 
     * @param weModel 模特
     * @return 结果
     */
    @Override
    public int insertWeModel(WeModel weModel)
    {
        weModel.setCreateTime(DateUtils.getNowDate());
        return weModelMapper.insertWeModel(weModel);
    }

    /**
     * 修改模特
     * 
     * @param weModel 模特
     * @return 结果
     */
    @Override
    public int updateWeModel(WeModel weModel)
    {
        weModel.setUpdateTime(DateUtils.getNowDate());
        return weModelMapper.updateWeModel(weModel);
    }

    /**
     * 批量删除模特
     * 
     * @param ids 需要删除的模特主键
     * @return 结果
     */
    @Override
    public int deleteWeModelByIds(Long[] ids)
    {
        return weModelMapper.deleteWeModelByIds(ids);
    }

    /**
     * 删除模特信息
     * 
     * @param id 模特主键
     * @return 结果
     */
    @Override
    public int deleteWeModelById(Long id)
    {
        return weModelMapper.deleteWeModelById(id);
    }
    
    /**
     * 查询模特表主键最大值
     * 
     * @return 主键最大值
     */
    @Override
    public Long selectWeModelMaxId()
    {
        return weModelMapper.selectWeModelMaxId();
    }
}