package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WeAiPictureMapper;
import com.ruoyi.system.domain.WeAiPicture;
import com.ruoyi.system.service.IWeAiPictureService;

/**
 * AI图片Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
@Service
public class WeAiPictureServiceImpl implements IWeAiPictureService 
{
    @Autowired
    private WeAiPictureMapper weAiPictureMapper;

    /**
     * 查询AI图片
     * 
     * @param id AI图片主键
     * @return AI图片
     */
    @Override
    public WeAiPicture selectWeAiPictureById(Long id)
    {
        return weAiPictureMapper.selectWeAiPictureById(id);
    }

    /**
     * 查询AI图片列表
     * 
     * @param weAiPicture AI图片
     * @return AI图片
     */
    @Override
    public List<WeAiPicture> selectWeAiPictureList(WeAiPicture weAiPicture)
    {
        return weAiPictureMapper.selectWeAiPictureList(weAiPicture);
    }

    /**
     * 新增AI图片
     * 
     * @param weAiPicture AI图片
     * @return 结果
     */
    @Override
    public int insertWeAiPicture(WeAiPicture weAiPicture)
    {
        weAiPicture.setCreateTime(DateUtils.getNowDate());
        return weAiPictureMapper.insertWeAiPicture(weAiPicture);
    }

    /**
     * 修改AI图片
     * 
     * @param weAiPicture AI图片
     * @return 结果
     */
    @Override
    public int updateWeAiPicture(WeAiPicture weAiPicture)
    {
        weAiPicture.setUpdateTime(DateUtils.getNowDate());
        return weAiPictureMapper.updateWeAiPicture(weAiPicture);
    }

    /**
     * 批量删除AI图片
     * 
     * @param ids 需要删除的AI图片主键
     * @return 结果
     */
    @Override
    public int deleteWeAiPictureByIds(Long[] ids)
    {
        return weAiPictureMapper.deleteWeAiPictureByIds(ids);
    }

    /**
     * 删除AI图片信息
     * 
     * @param id AI图片主键
     * @return 结果
     */
    @Override
    public int deleteWeAiPictureById(Long id)
    {
        return weAiPictureMapper.deleteWeAiPictureById(id);
    }
}
