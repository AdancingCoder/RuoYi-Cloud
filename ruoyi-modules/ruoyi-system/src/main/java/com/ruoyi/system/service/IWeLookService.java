package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.WeLook;

/**
 * 外观Service接口
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
public interface IWeLookService 
{
    /**
     * 查询外观
     * 
     * @param id 外观主键
     * @return 外观
     */
    public WeLook selectWeLookById(Long id);

    /**
     * 查询外观列表
     * 
     * @param weLook 外观
     * @return 外观集合
     */
    public List<WeLook> selectWeLookList(WeLook weLook);

    /**
     * 新增外观
     * 
     * @param weLook 外观
     * @return 结果
     */
    public int insertWeLook(WeLook weLook);

    /**
     * 修改外观
     * 
     * @param weLook 外观
     * @return 结果
     */
    public int updateWeLook(WeLook weLook);

    /**
     * 批量删除外观
     * 
     * @param ids 需要删除的外观主键集合
     * @return 结果
     */
    public int deleteWeLookByIds(Long[] ids);

    /**
     * 删除外观信息
     * 
     * @param id 外观主键
     * @return 结果
     */
    public int deleteWeLookById(Long id);
}
