package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WeClothMapper;
import com.ruoyi.system.domain.WeCloth;
import com.ruoyi.system.service.IWeClothService;

/**
 * 服装Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
@Service
public class WeClothServiceImpl implements IWeClothService 
{
    @Autowired
    private WeClothMapper weClothMapper;

    /**
     * 查询服装
     * 
     * @param id 服装主键
     * @return 服装
     */
    @Override
    public WeCloth selectWeClothById(Long id)
    {
        return weClothMapper.selectWeClothById(id);
    }

    /**
     * 查询服装列表
     * 
     * @param weCloth 服装
     * @return 服装
     */
    @Override
    public List<WeCloth> selectWeClothList(WeCloth weCloth)
    {
        return weClothMapper.selectWeClothList(weCloth);
    }

    /**
     * 新增服装
     * 
     * @param weCloth 服装
     * @return 结果
     */
    @Override
    public int insertWeCloth(WeCloth weCloth)
    {
        weCloth.setCreateTime(DateUtils.getNowDate());
        return weClothMapper.insertWeCloth(weCloth);
    }

    /**
     * 修改服装
     * 
     * @param weCloth 服装
     * @return 结果
     */
    @Override
    public int updateWeCloth(WeCloth weCloth)
    {
        weCloth.setUpdateTime(DateUtils.getNowDate());
        return weClothMapper.updateWeCloth(weCloth);
    }

    /**
     * 批量删除服装
     * 
     * @param ids 需要删除的服装主键
     * @return 结果
     */
    @Override
    public int deleteWeClothByIds(Long[] ids)
    {
        return weClothMapper.deleteWeClothByIds(ids);
    }

    /**
     * 删除服装信息
     * 
     * @param id 服装主键
     * @return 结果
     */
    @Override
    public int deleteWeClothById(Long id)
    {
        return weClothMapper.deleteWeClothById(id);
    }
}
