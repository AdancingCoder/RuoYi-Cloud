package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WeBackMapper;
import com.ruoyi.system.domain.WeBack;
import com.ruoyi.system.service.IWeBackService;

/**
 * 背景Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
@Service
public class WeBackServiceImpl implements IWeBackService 
{
    @Autowired
    private WeBackMapper weBackMapper;

    /**
     * 查询背景
     * 
     * @param id 背景主键
     * @return 背景
     */
    @Override
    public WeBack selectWeBackById(Long id)
    {
        return weBackMapper.selectWeBackById(id);
    }
    
    /**
     * 根据外部ID查询背景
     * 
     * @param backWeId 背景外部ID
     * @return 背景
     */
    @Override
    public WeBack selectWeBackByWeId(String backWeId)
    {
        return weBackMapper.selectWeBackByWeId(backWeId);
    }

    /**
     * 查询背景列表
     * 
     * @param weBack 背景
     * @return 背景
     */
    @Override
    public List<WeBack> selectWeBackList(WeBack weBack)
    {
        return weBackMapper.selectWeBackList(weBack);
    }

    /**
     * 新增背景
     * 
     * @param weBack 背景
     * @return 结果
     */
    @Override
    public int insertWeBack(WeBack weBack)
    {
        weBack.setCreateTime(DateUtils.getNowDate());
        return weBackMapper.insertWeBack(weBack);
    }

    /**
     * 修改背景
     * 
     * @param weBack 背景
     * @return 结果
     */
    @Override
    public int updateWeBack(WeBack weBack)
    {
        weBack.setUpdateTime(DateUtils.getNowDate());
        return weBackMapper.updateWeBack(weBack);
    }

    /**
     * 批量删除背景
     * 
     * @param ids 需要删除的背景主键
     * @return 结果
     */
    @Override
    public int deleteWeBackByIds(Long[] ids)
    {
        return weBackMapper.deleteWeBackByIds(ids);
    }

    /**
     * 删除背景信息
     * 
     * @param id 背景主键
     * @return 结果
     */
    @Override
    public int deleteWeBackById(Long id)
    {
        return weBackMapper.deleteWeBackById(id);
    }
    
    /**
     * 查询背景表主键最大值
     * 
     * @return 主键最大值
     */
    @Override
    public Long selectWeBackMaxId()
    {
        return weBackMapper.selectWeBackMaxId();
    }
}