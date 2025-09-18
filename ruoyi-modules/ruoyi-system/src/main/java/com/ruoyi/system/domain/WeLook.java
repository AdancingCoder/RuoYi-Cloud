package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 外观对象 we_look
 *
 * @author ruoyi
 * @date 2025-09-14
 */
public class WeLook extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "id")
    private Long id;

    /** 外观名称 */
    @Excel(name = "外观名称")
    private String name;

    /** 外观图片URL */
    @Excel(name = "外观图片URL")
    private String lookUrl;

    /** 任务ID */
    //@Excel(name = "任务ID")
    private String taskId;

    /** 执行ID */
    //@Excel(name = "执行ID")
    private String executeId;

    /** 外观类型 */
    @Excel(name = "外观类型")
    private String type;

    /** 关联we_model表的主键 */
    @Excel(name = "关联we_model表的主键")
    private Long modelId;

    /** 模特ID */
    //@Excel(name = "模特ID")
    private String modelWeId;

    /** 模特文件URL */
    //@Excel(name = "模特文件URL")
    private String modelUrl;

    /** 关联we_back表的主键 */
    //@Excel(name = "关联we_back表的主键")
    private Long backId;

    /** 背景ID */
    //@Excel(name = "背景ID")
    private String backWeId;

    /** 背景图片URL */
    //@Excel(name = "背景图片URL")
    private String backUrl;

    /** 关联we_cloth表的主键 */
    @Excel(name = "关联we_cloth表的主键")
    private Long clothId;

    /** 服装图片URL */
    //@Excel(name = "服装图片URL")
    private String clothUrl;

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

    public void setLookUrl(String lookUrl)
    {
        this.lookUrl = lookUrl;
    }

    public String getLookUrl()
    {
        return lookUrl;
    }

    public void setTaskId(String taskId)
    {
        this.taskId = taskId;
    }

    public String getTaskId()
    {
        return taskId;
    }

    public void setExecuteId(String executeId)
    {
        this.executeId = executeId;
    }

    public String getExecuteId()
    {
        return executeId;
    }

    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }

    public void setModelId(Long modelId)
    {
        this.modelId = modelId;
    }

    public Long getModelId()
    {
        return modelId;
    }

    public void setModelWeId(String modelWeId)
    {
        this.modelWeId = modelWeId;
    }

    public String getModelWeId()
    {
        return modelWeId;
    }

    public void setModelUrl(String modelUrl)
    {
        this.modelUrl = modelUrl;
    }

    public String getModelUrl()
    {
        return modelUrl;
    }

    public void setBackId(Long backId)
    {
        this.backId = backId;
    }

    public Long getBackId()
    {
        return backId;
    }

    public void setBackWeId(String backWeId)
    {
        this.backWeId = backWeId;
    }

    public String getBackWeId()
    {
        return backWeId;
    }

    public void setBackUrl(String backUrl)
    {
        this.backUrl = backUrl;
    }

    public String getBackUrl()
    {
        return backUrl;
    }

    public void setClothId(Long clothId)
    {
        this.clothId = clothId;
    }

    public Long getClothId()
    {
        return clothId;
    }

    public void setClothUrl(String clothUrl)
    {
        this.clothUrl = clothUrl;
    }

    public String getClothUrl()
    {
        return clothUrl;
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
                .append("lookUrl", getLookUrl())
                .append("taskId", getTaskId())
                .append("executeId", getExecuteId())
                .append("type", getType())
                .append("modelId", getModelId())
                .append("modelWeId", getModelWeId())
                .append("modelUrl", getModelUrl())
                .append("backId", getBackId())
                .append("backWeId", getBackWeId())
                .append("backUrl", getBackUrl())
                .append("clothId", getClothId())
                .append("clothUrl", getClothUrl())
                .append("delFlag", getDelFlag())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
