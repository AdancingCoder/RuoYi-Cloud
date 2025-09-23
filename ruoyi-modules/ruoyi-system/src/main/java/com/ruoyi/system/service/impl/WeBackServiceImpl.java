package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import com.alibaba.dashscope.aigc.multimodalconversation.MultiModalConversation;
import com.alibaba.dashscope.aigc.multimodalconversation.MultiModalConversationParam;
import com.alibaba.dashscope.aigc.multimodalconversation.MultiModalConversationResult;
import com.alibaba.dashscope.common.MultiModalMessage;
import com.alibaba.dashscope.common.Role;
import com.alibaba.dashscope.exception.NoApiKeyException;
import com.alibaba.dashscope.exception.UploadFileException;
import com.ruoyi.common.core.utils.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.WeBackMapper;
import com.ruoyi.system.domain.WeBack;
import com.ruoyi.system.service.IWeBackService;

/**
 * 背景Service业务层处理
 *
 * @author ruoyi
 * @date 2025-09-14
 */
@Service
@Slf4j
public class WeBackServiceImpl implements IWeBackService
{
    @Autowired
    private WeBackMapper weBackMapper;

    /**
     * 查询背景
     *
     * @param id 背景主键
     * @return 背景
     */
    @Override
    public WeBack selectWeBackById(Long id)
    {
        return weBackMapper.selectWeBackById(id);
    }

    /**
     * 根据外部ID查询背景
     *
     * @param backWeId 背景外部ID
     * @return 背景
     */
    @Override
    public WeBack selectWeBackByWeId(String backWeId)
    {
        return weBackMapper.selectWeBackByWeId(backWeId);
    }

    /**
     * 查询背景列表
     *
     * @param weBack 背景
     * @return 背景
     */
    @Override
    public List<WeBack> selectWeBackList(WeBack weBack)
    {
        return weBackMapper.selectWeBackList(weBack);
    }

    /**
     * 新增背景
     *
     * @param weBack 背景
     * @return 结果
     */
    @Override
    public int insertWeBack(WeBack weBack)
    {
        weBack.setCreateTime(DateUtils.getNowDate());
        return weBackMapper.insertWeBack(weBack);
    }

    /**
     * 修改背景
     *
     * @param weBack 背景
     * @return 结果
     */
    @Override
    public int updateWeBack(WeBack weBack)
    {
        weBack.setUpdateTime(DateUtils.getNowDate());
        return weBackMapper.updateWeBack(weBack);
    }

    /**
     * 批量删除背景
     *
     * @param ids 需要删除的背景主键
     * @return 结果
     */
    @Override
    public int deleteWeBackByIds(Long[] ids)
    {
        return weBackMapper.deleteWeBackByIds(ids);
    }

    /**
     * 删除背景信息
     *
     * @param id 背景主键
     * @return 结果
     */
    @Override
    public int deleteWeBackById(Long id)
    {
        return weBackMapper.deleteWeBackById(id);
    }


    public String getPromot(String filesUrl) {
        MultiModalConversation conv = new MultiModalConversation();
        ArrayList<Map<String,Object>> content = new ArrayList<>();
        Map<String, Object> image = Collections.singletonMap("image", filesUrl);
        Map<String, Object> text1 = Collections.singletonMap("text", "详细描述一下这张图片，不需要描述帽子，头发,衣服,项链,耳饰，鞋子,重点描述模特的姿态");
        content.add(image);
        content.add(text1);
        MultiModalMessage userMessage =
                MultiModalMessage.builder().role(Role.USER.getValue()).content(content).build();

        MultiModalConversationParam conversationParam = MultiModalConversationParam.builder()
                // 若没有配置环境变量，请用百炼API Key将下行替换为：.apiKey("sk-xxx")
                .apiKey("sk-fb13640c656c462ea2d35b14b3b14a31")

                // 此处以qwen-vl-max-latest为例，可按需更换模型名称。模型列表：https://help.aliyun.com/model-studio/getting-started/models
                .model("qwen-vl-max-latest")
                .build();

        conversationParam.setMessages(Collections.singletonList(userMessage));

        MultiModalConversationResult result = null;
        try {
            result = conv.call(conversationParam);
        } catch (NoApiKeyException | UploadFileException e) {
            log.error("", e);
        }
        assert result != null;
        String text = (String) result.getOutput().getChoices().get(0).getMessage().getContent().get(0).get("text");
        String s = text.replaceAll("\n", "");
        return s;

    }

    @Override
    public Long selectWeBackMaxId() {
        return weBackMapper.selectWeBackMaxId();
    }

}
