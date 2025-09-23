package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.WeBack;

/**
 * 背景Service接口
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
public interface IWeBackService 
{
    /**
     * 查询背景
     * 
     * @param id 背景主键
     * @return 背景
     */
    public WeBack selectWeBackById(Long id);
    
    /**
     * 根据外部ID查询背景
     * 
     * @param backWeId 背景外部ID
     * @return 背景
     */
    public WeBack selectWeBackByWeId(String backWeId);

    /**
     * 查询背景列表
     * 
     * @param weBack 背景
     * @return 背景集合
     */
    public List<WeBack> selectWeBackList(WeBack weBack);

    /**
     * 新增背景
     * 
     * @param weBack 背景
     * @return 结果
     */
    public int insertWeBack(WeBack weBack);

    /**
     * 修改背景
     * 
     * @param weBack 背景
     * @return 结果
     */
    public int updateWeBack(WeBack weBack);

    /**
     * 批量删除背景
     * 
     * @param ids 需要删除的背景主键集合
     * @return 结果
     */
    public int deleteWeBackByIds(Long[] ids);

    /**
     * 删除背景信息
     * 
     * @param id 背景主键
     * @return 结果
     */
    public int deleteWeBackById(Long id);
    
    /**
     * 查询背景表主键最大值
     * 
     * @return 主键最大值
     */
    public Long selectWeBackMaxId();
}