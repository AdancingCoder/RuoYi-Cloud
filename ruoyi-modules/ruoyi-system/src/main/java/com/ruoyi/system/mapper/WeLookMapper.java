package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.WeLook;

/**
 * 外观Mapper接口
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
public interface WeLookMapper 
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
     * 删除外观
     * 
     * @param id 外观主键
     * @return 结果
     */
    public int deleteWeLookById(Long id);

    /**
     * 批量删除外观
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWeLookByIds(Long[] ids);
}
