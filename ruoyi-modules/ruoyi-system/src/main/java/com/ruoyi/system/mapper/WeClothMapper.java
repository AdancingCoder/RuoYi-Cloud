package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.WeCloth;

/**
 * 服装Mapper接口
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
public interface WeClothMapper 
{
    /**
     * 查询服装
     * 
     * @param id 服装主键
     * @return 服装
     */
    public WeCloth selectWeClothById(Long id);

    /**
     * 查询服装列表
     * 
     * @param weCloth 服装
     * @return 服装集合
     */
    public List<WeCloth> selectWeClothList(WeCloth weCloth);

    /**
     * 新增服装
     * 
     * @param weCloth 服装
     * @return 结果
     */
    public int insertWeCloth(WeCloth weCloth);

    /**
     * 修改服装
     * 
     * @param weCloth 服装
     * @return 结果
     */
    public int updateWeCloth(WeCloth weCloth);

    /**
     * 删除服装
     * 
     * @param id 服装主键
     * @return 结果
     */
    public int deleteWeClothById(Long id);

    /**
     * 批量删除服装
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWeClothByIds(Long[] ids);
    
    /**
     * 查询服装表主键最大值
     * 
     * @return 主键最大值
     */
    public Long selectWeClothMaxId();
}