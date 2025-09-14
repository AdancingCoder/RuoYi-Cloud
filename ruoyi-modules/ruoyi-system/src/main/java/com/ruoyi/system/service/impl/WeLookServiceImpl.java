package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WeLookMapper;
import com.ruoyi.system.domain.WeLook;
import com.ruoyi.system.service.IWeLookService;

/**
 * 外观Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
@Service
public class WeLookServiceImpl implements IWeLookService 
{
    @Autowired
    private WeLookMapper weLookMapper;

    /**
     * 查询外观
     * 
     * @param id 外观主键
     * @return 外观
     */
    @Override
    public WeLook selectWeLookById(Long id)
    {
        return weLookMapper.selectWeLookById(id);
    }

    /**
     * 查询外观列表
     * 
     * @param weLook 外观
     * @return 外观
     */
    @Override
    public List<WeLook> selectWeLookList(WeLook weLook)
    {
        return weLookMapper.selectWeLookList(weLook);
    }

    /**
     * 新增外观
     * 
     * @param weLook 外观
     * @return 结果
     */
    @Override
    public int insertWeLook(WeLook weLook)
    {
        weLook.setCreateTime(DateUtils.getNowDate());
        return weLookMapper.insertWeLook(weLook);
    }

    /**
     * 修改外观
     * 
     * @param weLook 外观
     * @return 结果
     */
    @Override
    public int updateWeLook(WeLook weLook)
    {
        weLook.setUpdateTime(DateUtils.getNowDate());
        return weLookMapper.updateWeLook(weLook);
    }

    /**
     * 批量删除外观
     * 
     * @param ids 需要删除的外观主键
     * @return 结果
     */
    @Override
    public int deleteWeLookByIds(Long[] ids)
    {
        return weLookMapper.deleteWeLookByIds(ids);
    }

    /**
     * 删除外观信息
     * 
     * @param id 外观主键
     * @return 结果
     */
    @Override
    public int deleteWeLookById(Long id)
    {
        return weLookMapper.deleteWeLookById(id);
    }
}
