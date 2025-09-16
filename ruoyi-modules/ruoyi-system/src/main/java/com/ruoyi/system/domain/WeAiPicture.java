package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import com.ruoyi.system.utils.AiPictureExcelHandler;

/**
 * AI图片对象 we_ai_picture
 *
 * @author ruoyi
 * @date 2025-09-14
 */
public class WeAiPicture extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @Excel(name = "id")
    private Long id;

    /** 图片名称 */
    @Excel(name = "图片名称")
    private String name;

    /** AI生成图片URL */
    @Excel(name = "AI生成图片URL", cellType = Excel.ColumnType.STRING, handler = AiPictureExcelHandler.class)
    private String aiUrl;

    /** 任务ID */
    //@Excel(name = "任务ID")
    private String taskId;

    /** 执行ID */
    //@Excel(name = "执行ID")
    private String executeId;

    /** 图片类型 */
    //@Excel(name = "图片类型")
    private String type;

    /** 关联we_look表的主键 */
    //@Excel(name = "关联we_look表的主键")
    private Long lookId;

    /** 外观图片URL */
    //@Excel(name = "外观图片URL")
    private String lookUrl;

    /** 父id */
    //@Excel(name = "父id")
    private Long pid;

    /** 状态（0,1,2） */
    @Excel(name = "状态", readConverterExp = "0=待审核,1=审核通过,2=审核未通过", combo = {"待审核", "审核通过", "审核未通过"}, cellType = Excel.ColumnType.STRING)
    private String dataStatus;

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

    public void setAiUrl(String aiUrl)
    {
        this.aiUrl = aiUrl;
    }

    public String getAiUrl()
    {
        return aiUrl;
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

    public void setLookId(Long lookId)
    {
        this.lookId = lookId;
    }

    public Long getLookId()
    {
        return lookId;
    }

    public void setLookUrl(String lookUrl)
    {
        this.lookUrl = lookUrl;
    }

    public String getLookUrl()
    {
        return lookUrl;
    }

    public void setPid(Long pid)
    {
        this.pid = pid;
    }

    public Long getPid()
    {
        return pid;
    }

    public void setDataStatus(String dataStatus)
    {
        // 处理状态文本到代码的转换
        if ("待审核".equals(dataStatus)) {
            this.dataStatus = "0";
        } else if ("审核通过".equals(dataStatus)) {
            this.dataStatus = "1";
        } else if ("审核未通过".equals(dataStatus)) {
            this.dataStatus = "2";
        } else if ("0".equals(dataStatus) || "1".equals(dataStatus) || "2".equals(dataStatus)) {
            // 直接设置代码值（从Excel导入时已经转换过的值）
            this.dataStatus = dataStatus;
        } else if (dataStatus == null || dataStatus.isEmpty()) {
            // 处理空值情况
            this.dataStatus = dataStatus;
        } else {
            this.dataStatus = dataStatus;
        }
    }

    public String getDataStatus()
    {
        return dataStatus;
    }

  /*  public String getDataStatusLabel() {
        switch (dataStatus) {
            case "0": return "待审核";
            case "1": return "审核通过";
            case "2": return "审核未通过";
            default: return dataStatus;
        }
    }*/

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
            .append("aiUrl", getAiUrl())
            .append("taskId", getTaskId())
            .append("executeId", getExecuteId())
            .append("type", getType())
            .append("lookId", getLookId())
            .append("lookUrl", getLookUrl())
            .append("pid", getPid())
            .append("dataStatus", getDataStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
