package com.ruoyi.system.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.WeLook;
import com.ruoyi.system.domain.WeCloth;
import com.ruoyi.system.domain.WeModel;
import com.ruoyi.system.domain.WeBack;
import com.ruoyi.system.service.IWeClothService;
import com.ruoyi.system.service.IWeModelService;
import com.ruoyi.system.service.IWeBackService;
import com.ruoyi.system.service.IWeLookService;
import com.ruoyi.system.service.IWeAiPictureService;
import com.ruoyi.system.domain.WeAiPicture;
import com.ruoyi.common.core.utils.WeshopUtils;
import java.util.ArrayList;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 外观Controller
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/look")
public class WeLookController extends BaseController
{
    private static final Logger log = LoggerFactory.getLogger(WeLookController.class);

    @Autowired
    private IWeLookService weLookService;

    @Autowired
    private IWeClothService weClothService;

    @Autowired
    private IWeModelService weModelService;

    @Autowired
    private IWeBackService weBackService;

    @Autowired
    private IWeAiPictureService weAiPictureService;

    /**
     * 查询外观列表
     */
    @RequiresPermissions("system:look:list")
    @GetMapping("/list")
    public TableDataInfo list(WeLook weLook)
    {
        startPage();
        List<WeLook> list = weLookService.selectWeLookList(weLook);
        return getDataTable(list);
    }

    /**
     * 导出外观列表
     */
    @RequiresPermissions("system:look:export")
    @Log(title = "外观", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, WeLook weLook)
    {
        List<WeLook> list = weLookService.selectWeLookList(weLook);
        ExcelUtil<WeLook> util = new ExcelUtil<WeLook>(WeLook.class);
        util.exportExcel(response, list, "外观数据");
    }

    /**
     * 获取外观详细信息
     */
    @RequiresPermissions("system:look:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(weLookService.selectWeLookById(id));
    }

    /**
     * 新增外观
     */
    @RequiresPermissions("system:look:add")
    @Log(title = "外观", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WeLook weLook)
    {
        return toAjax(weLookService.insertWeLook(weLook));
    }

    /**
     * 修改外观
     */
    @RequiresPermissions("system:look:edit")
    @Log(title = "外观", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WeLook weLook)
    {
        return toAjax(weLookService.updateWeLook(weLook));
    }

    /**
     * 删除外观
     */
    @RequiresPermissions("system:look:remove")
    @Log(title = "外观", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(weLookService.deleteWeLookByIds(ids));
    }

    /**
     * 生成外观数据
     */
    @RequiresPermissions("system:look:add")
    @Log(title = "外观", businessType = BusinessType.INSERT)
    @PostMapping("/generateData")
    public AjaxResult generateData()
    {
        // 查询所有服装数据
        List<WeCloth> clothList = weClothService.selectWeClothList(new WeCloth());
        // 查询所有模特数据
        List<WeModel> modelList = weModelService.selectWeModelList(new WeModel());
        // 查询所有背景数据
        List<WeBack> backList = weBackService.selectWeBackList(new WeBack());

        // 组合生成外观数据
        int count = 0;
        for (WeCloth cloth : clothList) {
            for (WeModel model : modelList) {
                for (WeBack back : backList) {
                    // 检查是否已存在相同组合的外观数据
                    WeLook checkLook = new WeLook();
                    checkLook.setClothId(cloth.getId());
                    checkLook.setModelId(model.getId());
                    checkLook.setBackId(back.getId());

                    // 如果不存在相同组合，则创建新的外观数据
                    if (weLookService.selectWeLookList(checkLook).isEmpty()) {
                        WeLook look = new WeLook();
                        look.setClothId(cloth.getId());
                        look.setClothUrl(cloth.getClothUrl());
                        look.setModelId(model.getId());
                        look.setModelWeId(model.getModelWeId());
                        look.setModelUrl(model.getModelUrl());
                        look.setBackId(back.getId());
                        look.setBackWeId(back.getBackWeId());
                        look.setBackUrl(back.getBackUrl());
                        // 设置默认名称为"服装+模特+背景"组合
                        look.setName(cloth.getType() + "+" + cloth.getName() + "+" + model.getName() + "+" + back.getName());
                        // 设置外观类型与服装类型一致
                        look.setType(cloth.getType());
                        weLookService.insertWeLook(look);
                        count++;
                    }
                }
            }
        }
        return AjaxResult.success("生成成功，共新增" + count + "条数据");
    }

    /**
     * 生成looks
     */
    @RequiresPermissions("system:look:add")
    @Log(title = "外观", businessType = BusinessType.UPDATE)
    @PostMapping("/generateLooks")
    public AjaxResult generateLooks(@RequestBody Long[] ids)
    {
        List<WeLook> looks = new ArrayList<>();
        for (Long id : ids) {
            looks.add(weLookService.selectWeLookById(id));
        }

        // 异步处理任务
        //new Thread(() -> {
            for (WeLook look : looks) {
                try {
                    log.info("开始处理look ID: {}, name: {}", look.getId(), look.getName());

                    // 1. 创建任务
                    String taskId = WeshopUtils.createTask(look.getName(), look.getClothUrl());
                    //String taskId ="68c8004a7af440cb455c057f";
                    if (taskId != null) {
                        log.info("创建任务成功，taskId: {}", taskId);
                        // 更新任务ID
                        look.setTaskId(taskId);
                        weLookService.updateWeLook(look);

                        // 2. 执行任务
                        String executionId = WeshopUtils.executeTask(taskId, look.getModelWeId(), look.getBackWeId());
                        if (executionId != null) {
                            log.info("执行任务成功，executionId: {}", executionId);
                            // 更新执行ID
                            look.setExecuteId(executionId);
                            weLookService.updateWeLook(look);

                            // 3. 轮询任务状态直到完成
                            String status = "Pending";
                            int retryCount = 0;
                            int maxRetries = 60; // 最多尝试60次，即300秒(5分钟)

                            while (!"Success".equals(status) && !"Failed".equals(status) && retryCount < maxRetries) {
                                Thread.sleep(5000); // 每5秒查询一次
                                retryCount++;
                                log.info("第{}次轮询任务状态，taskId: {}, executionId: {}", retryCount, taskId, executionId);

                                WeshopUtils.TaskResult result = WeshopUtils.queryTask(taskId, executionId);
                                if (result != null) {
                                    status = result.getStatus();
                                    log.info("任务状态: {}", status);

                                    // 如果任务成功完成，更新look_url
                                    if ("Success".equals(status)) {
                                        look.setLookUrl(result.getImageUrl());
                                        weLookService.updateWeLook(look);
                                        log.info("任务成功完成，图片URL: {}", result.getImageUrl());
                                    } else if ("Failed".equals(status)) {
                                        look.setLookUrl("失败");
                                        weLookService.updateWeLook(look);
                                        log.info("任务执行失败");
                                    }
                                } else {
                                    log.warn("查询任务返回空结果");
                                }
                            }

                            if (retryCount >= maxRetries) {
                                log.error("任务超时，未在规定时间内完成，taskId: {}", taskId);
                                look.setLookUrl("超时");
                                weLookService.updateWeLook(look);
                            }
                        } else {
                            log.error("执行任务失败，taskId: {}", taskId);
                        }
                    } else {
                        log.error("创建任务失败，look ID: {}", look.getId());
                    }
                } catch (Exception e) {
                    log.error("处理look ID {} 时出错", look.getId(), e);
                    try {
                        look.setLookUrl("异常");
                        weLookService.updateWeLook(look);
                    } catch (Exception updateException) {
                        log.error("更新look异常状态失败，look ID: {}", look.getId(), updateException);
                    }
                }
            }
            log.info("批量生成looks处理完成");
        //}).start();

        return AjaxResult.success("任务已提交，正在后台处理");
    }

    /**
     * 生成AI图
     */
    //@RequiresPermissions("system:look:generateAiImage")
    @Log(title = "外观", businessType = BusinessType.UPDATE)
    @PostMapping("/generateAiImage")
    public AjaxResult generateAiImage(@RequestBody Long[] ids)
    {
        List<WeLook> looks = new ArrayList<>();
        for (Long id : ids) {
            looks.add(weLookService.selectWeLookById(id));
        }

        // 异步处理任务
        //new Thread(() -> {
            for (WeLook look : looks) {
                try {
                    log.info("开始处理AI图片生成，look ID: {}, name: {}", look.getId(), look.getName());

                    // 获取背景信息（包含提示词）
                    WeBack back = weBackService.selectWeBackById(look.getBackId());
                    if (back == null) {
                        log.error("未找到背景信息，look ID: {}", look.getId());
                        continue;
                    }

                    // 1. 创建AI图片任务
                    String taskId = WeshopUtils.createAiImageTask(look.getName(), look.getLookUrl());
                    if (taskId != null) {
                        log.info("创建AI图片任务成功，taskId: {}", taskId);

                        // 2. 执行AI图片任务
                        //定义prompt,值为 back.getPromot()+ look.getRemark + look.getType()对应的提示词
                        String executionId = WeshopUtils.executeAiImageTask(taskId, WeshopUtils.generatePromptByType(look.getType(), back.getPromot() + look.getRemark()));
                        if (executionId != null) {
                            log.info("执行AI图片任务成功，executionId: {}", executionId);

                            // 3. 轮询任务状态直到完成
                            String status = "Pending";
                            int retryCount = 0;
                            int maxRetries = 60; // 最多尝试60次，即300秒(5分钟)

                            while (!"Success".equals(status) && !"Failed".equals(status) && retryCount < maxRetries) {
                                Thread.sleep(5000); // 每5秒查询一次
                                retryCount++;
                                log.info("第{}次轮询AI图片任务状态，taskId: {}, executionId: {}", retryCount, taskId, executionId);

                                WeshopUtils.AiImageTaskResult result = WeshopUtils.queryAiImageTask(taskId, executionId);
                                if (result != null) {
                                    status = result.getStatus();
                                    log.info("AI图片任务状态: {}", status);

                                    // 如果任务成功完成，保存AI图片
                                    if ("Success".equals(status)) {
                                        List<String> imageUrls = result.getImageUrls();
                                        log.info("AI图片任务成功完成，共生成 {} 张图片", imageUrls.size());

                                        // 为每张图片创建WeAiPicture记录
                                        for (String imageUrl : imageUrls) {
                                            WeAiPicture aiPicture = new WeAiPicture();
                                            aiPicture.setName(look.getName());
                                            aiPicture.setType(look.getType());
                                            aiPicture.setLookId(look.getId());
                                            aiPicture.setLookUrl(look.getLookUrl());
                                            aiPicture.setTaskId(taskId);
                                            aiPicture.setExecuteId(executionId);
                                            aiPicture.setAiUrl(imageUrl);
                                            weAiPictureService.insertWeAiPicture(aiPicture);
                                        }
                                        log.info("AI图片记录保存完成");
                                    } else if ("Failed".equals(status)) {
                                        log.info("AI图片任务执行失败，错误信息: {}", result.getError());

                                        // 保存错误信息
                                        WeAiPicture aiPicture = new WeAiPicture();
                                        aiPicture.setName(look.getName());
                                        aiPicture.setType(look.getType());
                                        aiPicture.setLookId(look.getId());
                                        aiPicture.setLookUrl(look.getLookUrl());
                                        aiPicture.setTaskId(taskId);
                                        aiPicture.setExecuteId(executionId);
                                        aiPicture.setAiUrl("错误: " + result.getError());
                                        weAiPictureService.insertWeAiPicture(aiPicture);
                                    }
                                } else {
                                    log.warn("查询AI图片任务返回空结果");
                                }
                            }

                            if (retryCount >= maxRetries) {
                                log.error("AI图片任务超时，未在规定时间内完成，taskId: {}", taskId);
                            }
                        } else {
                            log.error("执行AI图片任务失败，taskId: {}", taskId);
                        }
                    } else {
                        log.error("创建AI图片任务失败，look ID: {}", look.getId());
                    }
                } catch (Exception e) {
                    log.error("处理AI图片生成时出错，look ID: {}", look.getId(), e);
                }
            }
            log.info("批量生成AI图片处理完成");
        //}).start();

        return AjaxResult.success("AI图片生成任务已提交，正在后台处理");
    }
}
