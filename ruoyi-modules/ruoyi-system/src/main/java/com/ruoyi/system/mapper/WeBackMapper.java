package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.WeBack;

/**
 * 背景Mapper接口
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
public interface WeBackMapper 
{
    /**
     * 查询背景
     * 
     * @param id 背景主键
     * @return 背景
     */
    public WeBack selectWeBackById(Long id);

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
     * 删除背景
     * 
     * @param id 背景主键
     * @return 结果
     */
    public int deleteWeBackById(Long id);

    /**
     * 批量删除背景
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWeBackByIds(Long[] ids);
}
