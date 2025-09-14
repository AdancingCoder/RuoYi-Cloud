package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 背景对象 we_back
 * 
 * @author ruoyi
 * @date 2025-09-14
 */
public class WeBack extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 背景名称 */
    @Excel(name = "背景名称")
    private String name;

    /** 背景图片URL */
    @Excel(name = "背景图片URL")
    private String backUrl;

    /** 背景ID */
    @Excel(name = "背景ID")
    private String backWeId;

    /** 背景描述 */
    @Excel(name = "背景描述")
    private String promot;

    /** 背景类型 */
    @Excel(name = "背景类型")
    private String type;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setBackUrl(String backUrl) 
    {
        this.backUrl = backUrl;
    }

    public String getBackUrl() 
    {
        return backUrl;
    }

    public void setBackWeId(String backWeId) 
    {
        this.backWeId = backWeId;
    }

    public String getBackWeId() 
    {
        return backWeId;
    }

    public void setPromot(String promot) 
    {
        this.promot = promot;
    }

    public String getPromot() 
    {
        return promot;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("backUrl", getBackUrl())
            .append("backWeId", getBackWeId())
            .append("promot", getPromot())
            .append("type", getType())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
