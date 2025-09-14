package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.WeAiPicture;

/**
 * AI图片Service接口
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
public interface IWeAiPictureService 
{
    /**
     * 查询AI图片
     * 
     * @param id AI图片主键
     * @return AI图片
     */
    public WeAiPicture selectWeAiPictureById(Long id);

    /**
     * 查询AI图片列表
     * 
     * @param weAiPicture AI图片
     * @return AI图片集合
     */
    public List<WeAiPicture> selectWeAiPictureList(WeAiPicture weAiPicture);

    /**
     * 新增AI图片
     * 
     * @param weAiPicture AI图片
     * @return 结果
     */
    public int insertWeAiPicture(WeAiPicture weAiPicture);

    /**
     * 修改AI图片
     * 
     * @param weAiPicture AI图片
     * @return 结果
     */
    public int updateWeAiPicture(WeAiPicture weAiPicture);

    /**
     * 批量删除AI图片
     * 
     * @param ids 需要删除的AI图片主键集合
     * @return 结果
     */
    public int deleteWeAiPictureByIds(Long[] ids);

    /**
     * 删除AI图片信息
     * 
     * @param id AI图片主键
     * @return 结果
     */
    public int deleteWeAiPictureById(Long id);
}
