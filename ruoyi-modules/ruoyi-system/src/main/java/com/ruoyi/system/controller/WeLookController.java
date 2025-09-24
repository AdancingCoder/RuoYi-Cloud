package com.ruoyi.system.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;
import java.io.IOException;
import java.io.File;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.system.api.RemoteFileService;
import com.ruoyi.system.api.domain.SysFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import static com.ruoyi.common.core.utils.HttpUtils.uploadFile;

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

    @Autowired
    private RemoteFileService remoteFileService;

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

        // 按type分组数据，便于按type维度组合
        Map<String, List<WeCloth>> clothGroupByType = clothList.stream().collect(Collectors.groupingBy(WeCloth::getType));
        Map<String, List<WeModel>> modelGroupByType = modelList.stream().collect(Collectors.groupingBy(WeModel::getType));
        Map<String, List<WeBack>> backGroupByType = backList.stream().collect(Collectors.groupingBy(WeBack::getType));

        // 组合生成外观数据，仅组合相同type的数据
        int count = 0;
        // 获取所有存在的type
        Set<String> allTypes = new HashSet<>();
        allTypes.addAll(clothGroupByType.keySet());
        allTypes.addAll(modelGroupByType.keySet());
        allTypes.addAll(backGroupByType.keySet());
        allTypes.remove("3");
        // 遍历每个type，只组合该type下的服装、模特和背景
        for (String type : allTypes) {
            List<WeCloth> clothOfType = clothGroupByType.getOrDefault(type, new ArrayList<>());
            List<WeModel> modelOfType = modelGroupByType.getOrDefault(type, new ArrayList<>());
            List<WeBack> backOfType = backGroupByType.getOrDefault(type, new ArrayList<>());

            // 只有当三种数据都存在时才进行组合
            if (!clothOfType.isEmpty() && !modelOfType.isEmpty() && !backOfType.isEmpty()) {
                for (WeCloth cloth : clothOfType) {
                    for (WeModel model : modelOfType) {
                        for (WeBack back : backOfType) {
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

        // 创建固定大小的线程池，避免过多并发请求
        ExecutorService executorService = Executors.newFixedThreadPool(10);

        // 异步处理任务
        List<CompletableFuture<Void>> futures = new ArrayList<>();
        for (WeLook look : looks) {
            // 为每个look创建独立的异步任务，确保数据不会错乱
            CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
                processLook(look);
            }, executorService);
            futures.add(future);
        }

        // 等待所有任务完成
        CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]))
                .thenRun(() -> {
                    log.info("所有looks处理完成");
                    executorService.shutdown();
                })
                .exceptionally(ex -> {
                    log.error("处理looks时发生异常", ex);
                    executorService.shutdown();
                    return null;
                });

        return AjaxResult.success("任务已提交，正在后台处理");
    }


    /**
     * 生成looks
     */
//    @RequiresPermissions("system:look:add")
//    @Log(title = "外观", businessType = BusinessType.UPDATE)
    @PostMapping("/generateLooks/{type}")
    public AjaxResult upLoad(@PathVariable(value = "type") String type, MultipartFile file) {



        return AjaxResult.success("任务已提交，正在后台处理");
    }





    /**
     * 处理单个look的生成任务
     * @param look 需要处理的look对象
     */
    private void processLook(WeLook look) {
        try {
            log.info("开始处理look ID: {}, name: {}", look.getId(), look.getName());

            // 1. 创建任务
            String taskId = WeshopUtils.createTask(look.getName(), look.getClothUrl());
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

    /**
     * 自动AI图片生成
     */
    @Log(title = "外观", businessType = BusinessType.INSERT)
    @PostMapping("/autoGenerateAiImage")
    public AjaxResult autoGenerateAiImage(
            @RequestParam("lookFile") MultipartFile lookFile,
            @RequestParam("modelFile") MultipartFile modelFile,
            @RequestParam("backgroundFile") MultipartFile backgroundFile) {
        try {
            log.info("开始自动AI图片生成");
            R<SysFile> fileResult = remoteFileService.upload(lookFile);
            if (StringUtils.isNull(fileResult) || StringUtils.isNull(fileResult.getData()))
            {
                return error("文件服务异常，请联系管理员");
            }

            // 检查文件是否为空
            if (lookFile.isEmpty() || modelFile.isEmpty() || backgroundFile.isEmpty()) {
                return AjaxResult.error("上传文件不能为空");
            }

            // 检查文件大小(限制为10MB)
            long maxFileSize = 10 * 1024 * 1024; // 10MB
            if (lookFile.getSize() > maxFileSize || modelFile.getSize() > maxFileSize || backgroundFile.getSize() > maxFileSize) {
                return AjaxResult.error("文件大小不能超过10MB");
            }

            // 1. 上传模特图片处理逻辑
            // 保存上传的文件到临时目录
            File tempModelFile = File.createTempFile("model_", ".png");
            modelFile.transferTo(tempModelFile);

            // 上传模特图片到Weshop
            String modelImageUrl = WeshopUtils.uploadImage(tempModelFile);
            if (modelImageUrl == null) {
                return AjaxResult.error("上传模特图片失败");
            }

            // 创建时尚模型
            // 查询we_model表主键最大值加1作为name
            Long maxModelId = weModelService.selectWeModelMaxId();
            String modelName = String.valueOf(maxModelId != null ? maxModelId + 1 : 1);
            String fashionModelId = WeshopUtils.createFashionModel(modelImageUrl, modelName);
            if (fashionModelId == null) {
                return AjaxResult.error("创建时尚模型失败");
            }

            // 查询时尚模型信息
/*            JSONObject fashionModelData = WeshopUtils.queryFashionModel(fashionModelId);
            if (fashionModelData == null) {
                return AjaxResult.error("查询时尚模型失败");
            }*/

            // 保存模特数据到we_model表
            WeModel model = new WeModel();
            model.setName(modelName);
            model.setModelUrl(modelImageUrl);
            model.setModelWeId(fashionModelId);
            model.setType("3"); // 设置type为3
            weModelService.insertWeModel(model);

            // 2. 上传背景图片处理逻辑
            // 保存上传的文件到临时目录
            File tempBackgroundFile = File.createTempFile("background_", ".png");
            backgroundFile.transferTo(tempBackgroundFile);

            // 上传背景图片到Weshop
            String backgroundImageUrl = WeshopUtils.uploadImage(tempBackgroundFile);
            if (backgroundImageUrl == null) {
                return AjaxResult.error("上传背景图片失败");
            }

            // 创建背景位置
            // 查询we_back表主键最大值加1作为name
            Long maxBackId = weBackService.selectWeBackMaxId();
            String backName = String.valueOf(maxBackId != null ? maxBackId + 1 : 1);
            String locationId = WeshopUtils.createLocation(backgroundImageUrl, backName);
            if (locationId == null) {
                return AjaxResult.error("创建背景位置失败");
            }

            // 查询背景位置信息
/*            JSONObject locationData = WeshopUtils.queryLocation(locationId);
            if (locationData == null) {
                return AjaxResult.error("查询背景位置失败");
            }*/

            // 保存背景数据到we_back表
            WeBack back = new WeBack();
            back.setName(backName);
            back.setBackUrl(backgroundImageUrl);
            back.setBackWeId(locationId);
            back.setType("3"); // 设置type为3
            weBackService.insertWeBack(back);

            // 3. 上传look图片处理逻辑
            // 保存上传的文件到临时目录
            File tempLookFile = File.createTempFile("look_", ".png");
            lookFile.transferTo(tempLookFile);

            // 保存look数据到we_cloth表
            // 查询we_cloth表主键最大值加1作为name和cloth_url
            Long maxClothId = weClothService.selectWeClothMaxId();
            String clothName = String.valueOf(maxClothId != null ? maxClothId + 1 : 1);
            WeCloth cloth = new WeCloth();
            cloth.setName(clothName);


            String url = fileResult.getData().getUrl();
            cloth.setClothUrl(url);
            cloth.setType("3"); // 设置type为3
            weClothService.insertWeCloth(cloth);

            // 4. 生成we_look数据
            // 检查是否已存在相同组合的外观数据
            WeLook checkLook = new WeLook();
            checkLook.setClothId(cloth.getId());
            checkLook.setModelId(model.getId());
            checkLook.setBackId(back.getId());

            // 如果不存在相同组合，则创建新的外观数据
            if (weLookService.selectWeLookList(checkLook).isEmpty()) {
                WeLook look = new WeLook(); // 修复变量名冲突
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

                //结合227-260行generateLooks方法，更新look数据的lookUrl
                // 参考processLook方法实现lookUrl的生成逻辑
                try {
                    log.info("开始处理look ID: {}, name: {}", look.getId(), look.getName());

                    // 1. 创建任务
                    String taskId = WeshopUtils.createTask(look.getName(), look.getClothUrl());
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
                            look.setLookUrl("执行失败");
                            weLookService.updateWeLook(look);
                        }
                    } else {
                        log.error("创建任务失败，look ID: {}", look.getId());
                        look.setLookUrl("创建任务失败");
                        weLookService.updateWeLook(look);
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

                //如果look的lookUrl不为空，则调用以下方法
                if (look.getLookUrl() != null && !look.getLookUrl().isEmpty() &&
                    !"失败".equals(look.getLookUrl()) &&
                    !"超时".equals(look.getLookUrl()) &&
                    !"执行失败".equals(look.getLookUrl()) &&
                    !"创建任务失败".equals(look.getLookUrl()) &&
                    !"异常".equals(look.getLookUrl())) {

                    // 类似generateAiImage方法的处理逻辑
                    try {
                        log.info("开始处理AI图片生成，look ID: {}, name: {}", look.getId(), look.getName());

                        // 获取背景信息（包含提示词）
                        WeBack backInfo = weBackService.selectWeBackById(look.getBackId());
                        if (backInfo == null) {
                            log.error("未找到背景信息，look ID: {}", look.getId());
                        } else {
                            // 创建AI图片任务
                            String taskId = WeshopUtils.createAiImageTask(look.getName(), look.getLookUrl());
                            if (taskId != null) {
                                log.info("创建AI图片任务成功，taskId: {}", taskId);

                                // 执行AI图片任务
                                String executionId = WeshopUtils.executeAiImageTask(taskId, WeshopUtils.generatePromptByType(look.getType(), backInfo.getPromot() + look.getRemark()));
                                if (executionId != null) {
                                    log.info("执行AI图片任务成功，executionId: {}", executionId);

                                    // 轮询任务状态直到完成
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
                                                // 将生成的图片URL列表返回给前端
                                                return AjaxResult.success("自动生成成功").put("imageUrls", imageUrls);
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
                        }
                    } catch (Exception e) {
                        log.error("处理AI图片生成时出错，look ID: {}", look.getId(), e);
                    }
                } else {
                    log.info("lookUrl为空或生成失败，跳过AI图片生成步骤，look ID: {}", look.getId());
                }

            }
            // 删除临时文件
            tempModelFile.delete();
            tempBackgroundFile.delete();
            tempLookFile.delete();

            return AjaxResult.success("自动生成成功");
        } catch (Exception e) {
            log.error("自动生成AI图片失败", e);
            return AjaxResult.error("自动生成失败: " + e.getMessage());
        }
    }
}
