package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 模特对象 we_model
 *
 * @author ruoyi
 * @date 2025-09-14
 */
public class WeModel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 模特名称 */
    @Excel(name = "模特名称")
    private String name;

    /** 模特文件URL */
    @Excel(name = "模特文件URL")
    private String modelUrl;

    /** 模特ID */
    @Excel(name = "模特ID")
    private String modelWeId;

    /** 模特类型 */
    @Excel(name = "模特类型")
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

    public void setModelUrl(String modelUrl)
    {
        this.modelUrl = modelUrl;
    }

    public String getModelUrl()
    {
        return modelUrl;
    }

    public void setModelWeId(String modelWeId)
    {
        this.modelWeId = modelWeId;
    }

    public String getModelWeId()
    {
        return modelWeId;
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
                .append("modelUrl", getModelUrl())
                .append("modelWeId", getModelWeId())
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
